package com.how2java.controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.how2java.pojo.Admin;
import com.how2java.pojo.Page;
import com.how2java.pojo.User;
import com.how2java.service.AdminService;
import com.how2java.service.UserService;
@Controller
@RequestMapping("userManager")
public class UserController{
	@Autowired
	UserService userService;
	@Autowired
	AdminService adminService;
	
	// 用来返回不同的页面路径，注意@ResponseBody标签
	@RequestMapping("/test")
	public String test(){
		return "view/Test";
	}
	
	@RequestMapping("/loginInfo")
	@ResponseBody
	public String login(String nam,String pwd,String character,HttpServletRequest request, HttpServletResponse response){
		if("用户".equals(character)) {
			User user = new User(nam,pwd);
			User newUser = userService.login(user);
			if(newUser != null) {
				request.getSession().setAttribute("username", newUser.getName());
				request.getSession().setAttribute("id", newUser.getId());
				return "usersuccess";
			}else {
				return "failure";
			}
		}else {
			Admin admin = new Admin(nam,pwd);
			Admin adNew = adminService.loginAdmin(admin);
			if(adNew != null) {
				request.getSession().setAttribute("username", adNew.getName());
				// 设置session的最大时限
				request.getSession().setMaxInactiveInterval(10);
				return "adminsuccess";
			}else {
				return "failure";
			}
		}
		
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public String login(String name,String nam,String pwd,String tel){
		User user = new User(name,nam,pwd,tel);
		boolean b = userService.addUser(user);
		if(b) {
			return "success";
		}
		return "failure";
		
	}
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	
	@RequestMapping("/userInfo")
	public ModelAndView userInfo(String user,Page page){
		List<User> list = null;
		list = userService.selectAll(user,page.getStart(),page.getStart()+page.getCount());
		ModelAndView mav = new ModelAndView("userInfo");
		// 计算最大页数
		page.caculateLast(userService.total());
		mav.addObject("page", page);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/selectUser")
	public ModelAndView  selectUser(String id){
		User user = userService.selectUser(id);
		ModelAndView mav = new ModelAndView("showUser");
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping("/updateUser")
	@ResponseBody
	public String updateUser(User user){
		boolean b = userService.updateUser(user);
		if(b) {
			return "success";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(HttpServletRequest request){
		if(request.getSession().getAttribute("username") == null) {
			//配合拦截器，给与login页面需要登录的状态，删掉下行代码，则没有alert弹框
			request.getSession().setAttribute("flag", true);
			return "failure";
		}
		return "success";
	}
}

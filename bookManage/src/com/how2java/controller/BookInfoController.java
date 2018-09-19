package com.how2java.controller;



import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.how2java.pojo.BookInfo;
import com.how2java.pojo.Page;
import com.how2java.service.BookInfoService;

@Controller
@RequestMapping("bookInfoManager")
public class BookInfoController {
	@Autowired
	BookInfoService bookinforService;
	
	@RequestMapping("/addBooks")
	@ResponseBody
	public String addBooks(BookInfo bookinfo){
		boolean b = bookinforService.addBook(bookinfo);
		if(b) {
			return "success";
		}else {
			return "error";
		}
	}

	@RequestMapping("/addBook")
	public String addBook(){
		return "addBook";
	}
	
	@RequestMapping("/showBook")
	public ModelAndView showBook(String bkname,Page page){
		ModelAndView mav = new ModelAndView("showBook");
		// pageHelper设置
		PageHelper.offsetPage(page.getStart(),5);
		List<BookInfo> list = bookinforService.showAllBook(bkname);
		// pageHelper获取数据总数
		int total = (int) new PageInfo<>(list).getTotal();
		page.caculateLast(total);
		mav.addObject("booklist",list);
		return mav;
	}
	
	@RequestMapping("/showBookById")
	public ModelAndView showBookById(int id){
		ModelAndView mav = new ModelAndView("showBookById");
		BookInfo book = bookinforService.showBookById(id);
		mav.addObject("book",book);
		return mav;
	}
	
	@RequestMapping("/recomBook")
	@ResponseBody
	public String recomBook(int id,HttpServletRequest request){
		String username = request.getSession().getAttribute("username").toString();
		boolean b = bookinforService.recomBook(username,id);
		if(b) {
			return "success";
		}else{
			return "failure";
		}
	}
	
}

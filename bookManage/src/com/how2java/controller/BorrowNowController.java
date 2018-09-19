package com.how2java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.how2java.pojo.BorrowNow;
import com.how2java.service.BorrowNowService;

@Controller
@RequestMapping("borrowManager")
public class BorrowNowController {
	@Autowired
	BorrowNowService borrowNow;
	
	@RequestMapping("/showBorrow")
	@ResponseBody
	public ModelAndView showBorrow(String bname){
		ModelAndView mav = new ModelAndView("borrowBook");
		List<BorrowNow> list = borrowNow.selectAll(bname);
		mav.addObject("borrlist",list);
		return mav;
	}
	
	@RequestMapping("/deleteById")
	@ResponseBody
	public String deleteById(int bkid,int usid){
		try {
			boolean b = borrowNow.deteleByID(bkid, usid);
			if(b) {
				return "success";
			}
		} catch (Exception e) {
			System.out.println("controller捕获，事务回滚");
		}
		return "failure";
	}
}

package com.how2java.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.how2java.pojo.BorrowHis;
import com.how2java.service.BorrowHisService;


@Controller
@RequestMapping("borrowHis")
public class BorrowHisController {
	@Autowired
	BorrowHisService borrHisService;
	
	@RequestMapping("/showBorrowHis")
	@ResponseBody
	public ModelAndView showBorrowHis(String value){
		ModelAndView mav = new ModelAndView();
		List<BorrowHis> borrList = borrHisService.showBorrowHis(value);
		mav.setViewName("showBookHis");
		mav.addObject("borrlist",borrList);
		return mav;
	}
	
	@RequestMapping("/toExport")
	@ResponseBody
	public void toExport(String value,HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setHeader("Content-Disposition", "attachment;filename=bookHis.xls");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        // 查询获取数据
    	List<BorrowHis> list = borrHisService.showBorrowHis(value);
    	HSSFWorkbook workBook = new HSSFWorkbook();		//创建 一个excel文档对象
    	HSSFSheet sheet = workBook.createSheet();			//创建一个工作薄对象
    	// 设置单元格宽度 -- 索引从0开始,根据API，是多少个字符长度 * 256 为最终结果
    	sheet.setColumnWidth(1, 20 * 256);
    	sheet.setColumnWidth(4, 20 * 256);
    	sheet.setColumnWidth(5, 20 * 256);
    	sheet.setColumnWidth(6, 20 * 256);
    	sheet.setColumnWidth(7, 14 * 256);
    	//设置样式
    	HSSFCellStyle titleStyle = workBook.createCellStyle();	//创建样式对象
    	titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);	//水平居中
    	titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);	//垂直居中
    	// 设置字体
    	HSSFFont titleFont = workBook.createFont();			//创建字体对象
    	titleFont.setFontHeightInPoints((short) 15);		//设置字体大小
    	titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);	//设置粗体
    	titleFont.setFontName("黑体");	//设置为黑体字
    	titleStyle.setFont(titleFont);
    	// 合并单元格操作
    	sheet.addMergedRegion(new CellRangeAddress(0, 1, 0, 7));
    	HSSFRow row = null;
    	HSSFCell cell = null;
    	row = sheet.createRow(0);
    	cell = row.createCell(0);
    	cell.setCellStyle(titleStyle);
    	cell.setCellValue(new HSSFRichTextString("图书借阅记录表"));
    	// 设置表文样式
    	HSSFCellStyle tableStyle = workBook.createCellStyle();
    	tableStyle.setBorderBottom((short)1);
    	tableStyle.setBorderTop((short)1);
    	tableStyle.setBorderLeft((short)1);
    	tableStyle.setBorderRight((short)1);
    	tableStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    	// 设置表文字体
    	HSSFFont tableFont = workBook.createFont();
    	tableFont.setFontHeightInPoints((short) 12); 		//设置字体大小
    	tableFont.setFontName("宋体"); 				//设置为黑体字
    	tableStyle.setFont(tableFont);
    	String[] title = {"图书编号","图书名称","用户ID","用户名称","联系方式","借阅开始时间","借阅结束时间","归还情况"};
    	row = sheet.createRow(2);
    	for (int i = 0; i < title.length; i++) {
    		cell = row.createCell(i);
    		cell.setCellStyle(tableStyle);
    		cell.setCellValue(new HSSFRichTextString(title[i]));
    	}
    	for (int i = 0; i < list.size(); i++) {
    		row = sheet.createRow(i+3);
    		BorrowHis borr = list.get(i);
    		String[] str = {borr.getBkid(),borr.getBkname(),borr.getUsid(),borr.getUsname(),
    				borr.getUstel(),borr.getBetime(),borr.getEndtime(),borr.getIsgui()};
    		for (int j = 0; j < str.length; j++) {
    			cell = row.createCell(j);
        		cell.setCellStyle(tableStyle);
        		cell.setCellValue(new HSSFRichTextString(str[j]));
    		}
    	}
    	// 文件输出流
    	workBook.write(response.getOutputStream()); 
	}
}

package com.how2java.service;

import java.util.List;
import java.util.Vector;

import com.how2java.pojo.BookInfo;


public interface BookInfoService {
	/**
	 * 添加书籍
	 * */
	public boolean addBook(BookInfo bookinfo);
	
	/**
	 * 查找书籍
	 * */
	public List<BookInfo> showAllBook(String bkname);
	
	/**
	 * 查找书籍 --- 根据ID
	 * */
	public BookInfo showBookById(int id);
	
	/**
	 * 推荐该书---按ID推荐
	 */
	public boolean recomBook(String by,int id);
	
	/***
	 * 修改书的状态
	 */
	public int changeStat(int bkid);
}

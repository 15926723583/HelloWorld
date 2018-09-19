package com.how2java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.how2java.mapper.BookInfoMapper;
import com.how2java.pojo.BookInfo;
import com.how2java.service.BookInfoService;

@Service
public class BookInfoServiceImpl implements BookInfoService {
	@Autowired
	BookInfoMapper bookinfoMapper;
	@Override
	public boolean addBook(BookInfo bookinfo) {
		int i = bookinfoMapper.addBook(bookinfo);
		if(i > 0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public List<BookInfo> showAllBook(String bkname) {
		return bookinfoMapper.showAllBook(bkname);
	}

	@Override
	public BookInfo showBookById(int id) {
		return bookinfoMapper.showBookById(id);
	}
	@Override
	public boolean recomBook(String by, int id) {
		BookInfo bookinfo = bookinfoMapper.showBookById(id);
		String newBy = bookinfo.getBy1() + "\n" + by + " 推荐该书!";
		int i = bookinfoMapper.recomBook(newBy, id);
		if(i > 0) {
			return true;
		}
		return false;
	}
	@Override
	public int changeStat(int bkid) {
		return bookinfoMapper.changeStat(bkid);
	}
}

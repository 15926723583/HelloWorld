package com.how2java.service;

import java.util.List;

import com.how2java.pojo.BorrowHis;

public interface BorrowHisService {
	/**
	 * 添加纪录进历史表
	 */
	public boolean addBorrowHis(BorrowHis borrHis);
	
	/***
	 * 显示所有历史记录
	 */
	public List<BorrowHis> showBorrowHis(String value);
}

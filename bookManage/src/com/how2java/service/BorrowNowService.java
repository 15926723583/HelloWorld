package com.how2java.service;

import java.util.List;

import com.how2java.pojo.BorrowNow;

public interface BorrowNowService {
	/**
	 * 查找所有借阅记录
	 */
	public List<BorrowNow> selectAll(String bname);
	/**
	 * 删除当前借阅记录
	 * @throws Exception 
	 */
	public boolean deteleByID(int bkid,int usid) throws Exception;
	/**
	 * 查询单个数据
	 */
	public BorrowNow selectById(int bkid,int usid);
}

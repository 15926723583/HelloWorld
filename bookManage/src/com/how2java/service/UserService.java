package com.how2java.service;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.how2java.pojo.Page;
import com.how2java.pojo.User;

public interface UserService {
	/**
	 * 查看所有用户
	 * */
	public List<User> selectAll(String user,int start,int count);
	
	/**
	 * 查看所有用户人数
	 */
	public int total();
	
	/**
	 * 用户登陆
	 * */
	public User login(User user);
	/**
	 * 获取单个用户
	 */
	public User selectUser(String id);
	/**
	 * 用户更新
	 */
	public boolean updateUser(User user);
	/**
	 * 添加用户
	 */
	public boolean addUser(User user);
}

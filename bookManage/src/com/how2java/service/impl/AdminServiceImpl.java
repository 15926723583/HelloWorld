package com.how2java.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.how2java.mapper.AdminMapper;
import com.how2java.pojo.Admin;
import com.how2java.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper adminMapper;

	public Admin loginAdmin(Admin admin) {
		return adminMapper.login(admin);
	}
}

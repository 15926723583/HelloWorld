package com.how2java.service.impl;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.how2java.mapper.UserMapper;
import com.how2java.pojo.Page;
import com.how2java.pojo.User;
import com.how2java.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> selectAll(String user,int start,int count) {
		return userMapper.selectAll(user,start,count);
	}

	@Override
	public int total() {
		return userMapper.total();
	}

	@Override
	public User login(User user){
		return userMapper.login(user);
	}

	@Override
	public User selectUser(String id) {
		return userMapper.selectUser(id);
	}

	@Override
	public boolean updateUser(User user) {
		int i = userMapper.updateUser(user);
		if(i > 0) {
			return true;
		}else {
			return false;
		}	
	}

	@Override
	public boolean addUser(User user) {
		int i = userMapper.add(user);
		if(i > 1) {
			return true;
		}
		return false;
	}
}

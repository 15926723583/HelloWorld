package com.how2java.mapper;

import org.apache.ibatis.annotations.Select;

import com.how2java.pojo.Admin;

public interface AdminMapper {
	@Select("select ad_name name,ad_nam nam,ad_pwd pwd from bk_admin where ad_nam = #{nam} and ad_pwd=#{pwd}")
	public Admin login(Admin admin);
}

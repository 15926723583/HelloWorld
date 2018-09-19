package com.how2java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.junit.runners.Parameterized.Parameters;

import com.how2java.pojo.Page;
import com.how2java.pojo.User;

public interface UserMapper {
	@Insert("insert into bk_user values(SQ_USERID.nextval,#{name},#{nam},#{pwd},100,#{tel},null,null)")
	public int add(User user);
	
	@Select("select us_id id,us_name name,us_num num,us_tel tel from bk_user where us_nam = #{nam} and us_pwd=#{pwd}")
	public User login(User user);
	
	/**
	 * 用xml方式进行 ---- 分页操作
	 */
	public List<User> selectAll(@Param("user")String user,@Param("start")int start,@Param("count")int count);
	
	@Select("select us_id id,us_name name,us_num num,us_tel tel from bk_user where us_id = #{id}")
	public User selectUser(String id);
	
	
	@Update("update BK_USER set us_num = #{num} WHERE US_ID = #{id}")
	public int updateUser(User user);
	
	@Select("select count(*) from bk_user ")
	public int total();
}

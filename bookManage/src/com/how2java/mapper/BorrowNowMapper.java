package com.how2java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.how2java.pojo.BorrowNow;

public interface BorrowNowMapper {
	/**
	 * xml方式 动态查询
	 */
	public List<BorrowNow> selectAll(@Param("bname") String bname);
	
	/**
	 * 删除当前借阅表记录
	 */
	@Delete("delete from bk_now where bk_id = #{bkid}  and us_id = #{usid}")
	public int deleteById(@Param("bkid") int bkid,@Param("usid") int usid);
	
	/**
	 * 查询单个数据
	 */
	@Select("select bk_id bkid,bk_name bkname,us_id usid,us_name usname,us_tel ustel,be_time betime,end_time endtime,is_gui isgui from bk_now where bk_id = #{bkid}  and us_id = #{usid}")
	public BorrowNow selectById(@Param("bkid") int bkid,@Param("usid") int usid);
}

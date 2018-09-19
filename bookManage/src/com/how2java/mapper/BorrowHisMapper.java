package com.how2java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.how2java.pojo.BorrowHis;

public interface BorrowHisMapper {
	/**
	 * 添加纪录进历史表
	 */
	@Insert("insert into bk_his values(#{bkid},#{bkname},#{usid},#{usname},#{ustel},#{betime},#{endtime},#{isgui},sq_his.nextval,null)")
	public int addBorrowHis(BorrowHis borrHis);
	
	/**
	 * 搜索所有历史记录表 --- xml动态书写
	 */
	public List<BorrowHis> showBorrowHis(@Param("value") String value);
}

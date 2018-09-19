package com.how2java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.how2java.pojo.BookInfo;

public interface BookInfoMapper {
	/**
	 * 添加书籍
	 * */
	@Insert("insert into BK_INFO values(SQ_BOOKID.nextval,#{name},#{bkgroup},'未借出',#{by1},'柯贤铭',null)")
	public int addBook(BookInfo bookinfo);
	
	/**
	 * 查找书籍 --- 动态查询如果不传递对象的话，需要加上@Param
	 * */ 
	public List<BookInfo> showAllBook(@Param("bkname") String bkname);
	
	/**
	 * 查找书籍---按ID查找
	 * */
	@Select("select bk_id id,bk_name name,gr_name bkgroup,bk_stat stat,by1 from bk_info where bk_id = #{id}")
	public BookInfo showBookById(int id);
	
	/**
	 * 推荐该书---按ID推荐
	 */
	@Insert("update bk_info set by1 = #{by} where bk_id = #{id}")
	public int recomBook(@Param("by") String by,@Param("id") int id);
	
	@Update("update BK_INFO SET BK_STAT = '未借出' WHERE BK_ID = #{bkid}")
	public int changeStat(@Param("bkid") int bkid);
}

package com.how2java.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.how2java.mapper.BookInfoMapper;
import com.how2java.mapper.BorrowHisMapper;
import com.how2java.mapper.BorrowNowMapper;
import com.how2java.pojo.BorrowHis;
import com.how2java.pojo.BorrowNow;
import com.how2java.service.BookInfoService;
import com.how2java.service.BorrowHisService;
import com.how2java.service.BorrowNowService;

@Service
public class BorrowNowServiceImpl implements BorrowNowService {
	@Autowired
	BorrowNowMapper borrowMapper;
	@Autowired
	BorrowHisService borrHisService;
	@Autowired
	BookInfoService bookinforService;

	@Override
	public List<BorrowNow> selectAll(String bname) {
		return borrowMapper.selectAll(bname);
	}
	// Mybatis事务注解
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
	public boolean deteleByID(int bkid, int usid) throws Exception { 
		int i = 0;
		boolean b = false;
		try {
			// 先查询获取数据，删除当前借阅表，添加进历史借阅表，修改书籍状态
			BorrowNow borrNow = borrowMapper.selectById(bkid, usid);
			i = borrowMapper.deleteById(bkid, usid);
			// 是否超时的参数判断
			String str = "";
			// 进行时间判断,用当前时间和借阅约定归还时间做判断
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date nowtime = sdf.parse(sdf.format(new Date()));
				Date end = sdf.parse(borrNow.getEndtime());
				if (nowtime.compareTo(end) >= 0) {
					str = "超时归还";
				} else {
					str = "按时归还";
				}
			} catch (Exception e) {
				System.out.println("时间转换出现异常");
			}
			// 实例化历史记录表对象
			BorrowHis borrHis = new BorrowHis(
					borrNow.getBkid(),borrNow.getBkname(),borrNow.getUsid(),borrNow.getUsname(),
					borrNow.getUstel(),borrNow.getBetime(),borrNow.getEndtime(),
					str,null);
			b = borrHisService.addBorrowHis(borrHis);
			i = bookinforService.changeStat(bkid);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		if(i > 0 && b) {
			return true;
		}
		return false;
	}

	@Override
	public BorrowNow selectById(int bkid, int usid) {
		return borrowMapper.selectById(bkid, usid);
	}
}

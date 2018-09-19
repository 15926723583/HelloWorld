package com.how2java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.how2java.mapper.BorrowHisMapper;
import com.how2java.pojo.BorrowHis;
import com.how2java.service.BorrowHisService;

@Service
public class BorrowHisServiceImpl implements BorrowHisService {
	@Autowired
	BorrowHisMapper borrHisMapper;
	
	@Override
	public boolean addBorrowHis(BorrowHis borrHis) {
		int i = 0;
		i = borrHisMapper.addBorrowHis(borrHis);
		if(i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<BorrowHis> showBorrowHis(String value) {
		return borrHisMapper.showBorrowHis(value);
	}
}

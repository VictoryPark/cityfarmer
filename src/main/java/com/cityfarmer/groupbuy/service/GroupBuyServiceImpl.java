package com.cityfarmer.groupbuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.GroupBuyBoard;
import com.cityfarmer.repository.mapper.GroupBuyMapper;

@Service
public class GroupBuyServiceImpl implements GroupBuyService {
	
	@Autowired
	private GroupBuyMapper mapper;
	
	@Override
	public void write(GroupBuyBoard gbb) {
		mapper.gbInsertBoard(gbb);
	}
	
	@Override
	public List<GroupBuyBoard> list() {
		return mapper.gbSeletListBoard();
	}
	
}

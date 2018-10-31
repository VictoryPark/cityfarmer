package com.cityfarmer.groupbuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;
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
	public List<GroupBuyBoard> list(GroupBuyBoard gbb) {
		return mapper.gbSeletListBoard(gbb);
	}
	
	@Override
	public int listCount() {
		return mapper.gbSelectBoardCount();
	}
	
	@Override
	public GroupBuyBoard detail(int no) {
		return mapper.gbSeletListBoardByNo(no);
	}
	
	@Override
	public void update(GroupBuyBoard gbb) {
		mapper.gbUpdateBoard(gbb);
	}
	
	@Override
	public void delete(int no) {
		mapper.gbDeleteBoard(no);
	}
	
	@Override
	public void writeComment(GroupBuyComment gbc) {
		mapper.gbcInsertComment(gbc);
	}
	
	@Override
	public List<GroupBuyComment> commentList(int no) {
		return mapper.gbcSelectComment(no);
	}
	
}

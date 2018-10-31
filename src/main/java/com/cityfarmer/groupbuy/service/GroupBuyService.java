package com.cityfarmer.groupbuy.service;

import java.util.List;

import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;


public interface GroupBuyService {
	
	void write(GroupBuyBoard gbb);
	List<GroupBuyBoard> list(GroupBuyBoard gbb);
	int listCount();
	GroupBuyBoard detail(int no);
	void update(GroupBuyBoard gbb);
	void delete(int no);
	
	void writeComment(GroupBuyComment gbc);
	List<GroupBuyComment> commentList(int no);
	
}

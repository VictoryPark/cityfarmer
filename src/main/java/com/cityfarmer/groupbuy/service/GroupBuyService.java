package com.cityfarmer.groupbuy.service;

import java.util.List;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;


public interface GroupBuyService {
	
	void write(GroupBuyBoard gbb);
	List<GroupBuyBoard> list(Page page);
	int listCount();
	GroupBuyBoard detail(int no);
	void update(GroupBuyBoard gbb);
	void delete(int no);
	
}

package com.cityfarmer.groupbuy.service;

import java.util.List;

import com.cityfarmer.repository.domain.GroupBuyBoard;


public interface GroupBuyService {
	
	void write(GroupBuyBoard gbb);
	List<GroupBuyBoard> list();
}

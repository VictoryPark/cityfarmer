package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.GroupBuyBoard;

public interface GroupBuyMapper {
	
	void gbInsertBoard(GroupBuyBoard gbb);
	List<GroupBuyBoard> gbSeletListBoard();

}

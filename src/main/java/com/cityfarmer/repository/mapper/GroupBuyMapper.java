package com.cityfarmer.repository.mapper;

import java.util.List;	

import com.cityfarmer.repository.domain.GroupBuyBoard;
import com.cityfarmer.repository.domain.Page;

public interface GroupBuyMapper {
	
	void gbInsertBoard(GroupBuyBoard gbb);
	List<GroupBuyBoard> gbSeletListBoard(Page page);
	int gbSelectBoardCount();

}

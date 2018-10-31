package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;

public interface GroupBuyMapper {
	
	void gbInsertBoard(GroupBuyBoard gbb); // 게시글 작성
	List<GroupBuyBoard> gbSeletListBoard(Page page); // 게시글 목록
	int gbSelectBoardCount(); // 게시글 숫자
	GroupBuyBoard gbSeletListBoardByNo(int no); // 게시글상세
	void gbUpdateBoard(GroupBuyBoard gbb); // 게시글 수정
	void gbDeleteBoard(int no); // 게시글 삭제

}

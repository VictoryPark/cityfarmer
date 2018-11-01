package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;

public interface GroupBuyMapper {
	
	void gbInsertBoard(GroupBuyBoard gbb); // 게시글 작성
	List<GroupBuyBoard> gbSeletListBoard(GroupBuyBoard gbb); // 게시글 목록
	int gbSelectBoardCount(); // 게시글 숫자
	GroupBuyBoard gbSeletListBoardByNo(int no); // 게시글상세
	void gbUpdateViewCnt(int no); // 조회수
	void gbUpdateBoard(GroupBuyBoard gbb); // 게시글 수정
	void gbDeleteBoard(int no); // 게시글 삭제
	
	// 코멘트
	List<GroupBuyComment> gbcSelectComment(int no); // 코멘트리스트
	void gbcInsertComment(GroupBuyComment gbc); // 코멘트작성
	void gbcDeleteComment(int cmtNo); // 코멘트 삭제
	void gbcUpdateComment(GroupBuyComment gbc); // 코멘트 수정

}

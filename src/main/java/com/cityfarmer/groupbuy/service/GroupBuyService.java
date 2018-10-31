package com.cityfarmer.groupbuy.service;

import java.util.List;

import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;


public interface GroupBuyService {
	
	
	void write(GroupBuyBoard gbb); // 글 등록
	List<GroupBuyBoard> list(GroupBuyBoard gbb); // 글 목록
	int listCount(); // 글 갯수
	GroupBuyBoard detail(int no); // 글 상세
	void update(GroupBuyBoard gbb); // 글 수정
	void delete(int no); // 글 삭제
	
	/* 코멘트 */
	void writeComment(GroupBuyComment gbc);	// 코멘트작성
	List<GroupBuyComment> commentList(int no); // 코멘트 리스트
	void deleteComment(int cmtNo); // 코멘트 삭제
}

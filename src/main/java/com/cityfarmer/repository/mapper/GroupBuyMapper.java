package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyFile;

public interface GroupBuyMapper {
	
	void gbInsertBoard(GroupBuyBoard gbb); // 게시글 작성
	void insertNewFile(GroupBuyFile file); // 파일 첨부
	void updateFile(GroupBuyFile file); // 파일 수정
	List<GroupBuyFile> gbSelectFileByNo(int gbNo); // 파일리스트
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
	int gbcCountComment(int gbNo); // 코멘트 개수

}

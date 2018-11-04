package com.cityfarmer.groupbuy.service;

import java.util.List;

import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyFile;


public interface GroupBuyService {
	
	
	void write(GroupBuyBoard gbb, List<GroupBuyFile> fileList); // 글 등록
	void uploadFile(GroupBuyFile file); // 파일 업로드
	List<GroupBuyFile> listFile(int gbNo); // 파일리스트
	void updateFile(GroupBuyFile file); // 파일 수정
	List<GroupBuyBoard> list(GroupBuyBoard gbb); // 글 목록
	int listCount(); // 글 갯수
	GroupBuyBoard detail(int no); // 글 상세
	void update(GroupBuyBoard gbb, List<GroupBuyFile> fileList); // 글 수정
	void delete(int no); // 글 삭제
	
	/* 코멘트 */
	void writeComment(GroupBuyComment gbc);	// 코멘트작성
	List<GroupBuyComment> commentList(int no); // 코멘트 리스트
	void deleteComment(int cmtNo); // 코멘트 삭제
	void updateComment(GroupBuyComment gbc); // 코멘트 수정
	int countComment(int gbNo); // 코멘트 개수
	
}

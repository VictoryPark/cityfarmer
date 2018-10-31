package com.cityfarmer.groupbuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;
import com.cityfarmer.repository.mapper.GroupBuyMapper;

@Service
public class GroupBuyServiceImpl implements GroupBuyService {
	
	@Autowired
	private GroupBuyMapper mapper;
	
	// 게시글 등록
	@Override
	public void write(GroupBuyBoard gbb) {
		mapper.gbInsertBoard(gbb);
	}
	
	// 게시글 목록
	@Override
	public List<GroupBuyBoard> list(GroupBuyBoard gbb) {
		return mapper.gbSeletListBoard(gbb);
	}
	
	// 게시글 개수
	@Override
	public int listCount() {
		return mapper.gbSelectBoardCount();
	}
	
	// 상세
	@Override
	public GroupBuyBoard detail(int no) {
		return mapper.gbSeletListBoardByNo(no);
	}
	
	// 수정
	@Override
	public void update(GroupBuyBoard gbb) {
		mapper.gbUpdateBoard(gbb);
	}
	
	// 삭제
	@Override
	public void delete(int no) {
		mapper.gbDeleteBoard(no);
	}
	
	/* 코멘트 */
	
	// 코멘트 작성
	@Override
	public void writeComment(GroupBuyComment gbc) {
		mapper.gbcInsertComment(gbc);
	}
	
	// 코멘트 리스트
	@Override
	public List<GroupBuyComment> commentList(int no) {
		return mapper.gbcSelectComment(no);
	}
	
	// 코멘트 삭제
	@Override
	public void deleteComment(int cmtNo) {
		mapper.gbcDeleteComment(cmtNo);
	}
	
}

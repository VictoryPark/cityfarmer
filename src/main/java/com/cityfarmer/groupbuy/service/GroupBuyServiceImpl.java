package com.cityfarmer.groupbuy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyBoard;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyComment;
import com.cityfarmer.repository.domain.groupbuy.GroupBuyFile;
import com.cityfarmer.repository.mapper.GroupBuyMapper;

@Service
public class GroupBuyServiceImpl implements GroupBuyService {
	
	@Autowired
	private GroupBuyMapper mapper;
	
	// 게시글 등록
	@Override
	public void write(GroupBuyBoard gbb, List<GroupBuyFile> fileList) {
		mapper.gbInsertBoard(gbb);
		if(fileList != null) {
			for(GroupBuyFile f : fileList) {
				uploadFile(f);
			}
		}		
	}
	
	// 파일 업로드
	@Override
	public void uploadFile(GroupBuyFile file) {
		// TODO Auto-generated method stub
		mapper.insertNewFile(file);
	}
	
	// 파일 수정
	@Override
	public void updateFile(GroupBuyFile file) {
		mapper.updateFile(file);
	}
	
	// 파일 리스트
	@Override
	public List<GroupBuyFile> listFile(int gbNo) {
		return mapper.gbSelectFileByNo(gbNo);
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
		mapper.gbUpdateViewCnt(no);
		return mapper.gbSeletListBoardByNo(no);
	}
	
	// 수정
	@Override
	public void update(GroupBuyBoard gbb, List<GroupBuyFile> fileList) {
		mapper.gbUpdateBoard(gbb);
		
		if(fileList != null) {
			for(GroupBuyFile f : fileList) {
				
				updateFile(f);
			}
		}	
	}
	
	// 삭제
	@Override
	public void delete(int no) {
		mapper.gbDeleteBoard(no);
	}
	
	// 검색
	@Override
	public List<GroupBuyBoard> search(GroupBuyBoard gbb) {
		return mapper.searchGBBoard(gbb);
	}
	
	// 검색결과 개수
	@Override
	public int searchCount(GroupBuyBoard gbb) {
		return mapper.searchGBBoardCount(gbb);
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
	
	// 코멘트 수정
	@Override
	public void updateComment(GroupBuyComment gbc) {
		mapper.gbcUpdateComment(gbc);
	}
	
	// 코멘트 개수
	@Override
	public int countComment(int gbNo) {
		return mapper.gbcCountComment(gbNo);
	}
	
}

package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.DiaryComment;
import com.cityfarmer.repository.domain.diary.DiaryFile;
import com.cityfarmer.repository.domain.diary.drPage;

public interface DiaryMapper {
	List<DiaryBoard> selectDiaryBoard(drPage page); // 게시글 목록
	void insertDiaryBoard(DiaryBoard diary); // 게시글 작성
	DiaryBoard selectDiaryBoardByNo(int no); // 게시글 상세
	int updateDiaryBoard(DiaryBoard diary); // 게시물 수정
	int deleteDiaryBoard(int no); // 게시물 삭제
	int selectDiaryBoardCount(); // 게시물숫자
	
	
	/***************댓글***********/
	List<DiaryComment> drcSelectComment(int no);
	void drcInsertComment(DiaryComment comment);
	void deleteDiaryComment(int drcNo);
	void updateDiaryComment(DiaryComment comment);
	int selectDiaryCommentCount(int drNo);
	
	/****************파일*****************/
	void updateDiaryFile(DiaryFile file); // 파일수정
	List<DiaryFile> selectDiaryFileByNo(int drNo); // 파일리스트
	void insertDiaryFile(DiaryFile file); // 파일첨부
	
	/*****************검색******************/
	List<DiaryBoard> searchDiaryBoard(DiaryBoard diary);
	int searchDiaryCount(DiaryBoard diary);
	}

	
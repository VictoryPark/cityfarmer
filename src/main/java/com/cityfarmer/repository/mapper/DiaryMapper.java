package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.DiaryComment;
import com.cityfarmer.repository.domain.diary.drPage;

public interface DiaryMapper {
	List<DiaryBoard> selectDiaryBoard(drPage page);
	void insertDiaryBoard(DiaryBoard diary);
	DiaryBoard selectDiaryBoardByNo(int no);
	int updateDiaryBoard(DiaryBoard diary);
	int deleteDiaryBoard(int no);
	int selectDiaryBoardCount();
	
	
	/***************댓글***********/
	List<DiaryComment> drcSelectComment(int no);
	void drcInsertComment(DiaryComment comment);
	void deleteDiaryComment(int drcNo);
	void updateDiaryComment(DiaryComment comment);
	int selectDiaryCommentCount(int drNo);
	
	}

	
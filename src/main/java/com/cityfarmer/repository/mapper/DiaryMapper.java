package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.diary.DiaryBoard;

public interface DiaryMapper {
	List<DiaryBoard> selectDiaryBoard();
	void insertDiaryBoard(DiaryBoard diary);
//	DiaryBoard selectDiaryBoardByBo(int no);
//	int deleteDiaryBoard(int no);
//	int updateDiaryBoard(DiaryBoard diary);
	}

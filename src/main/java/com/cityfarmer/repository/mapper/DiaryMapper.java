package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.diary.DiaryBoard;

public interface DiaryMapper {
	List<DiaryBoard> selectDiaryBoard(Page page);
	void insertDiaryBoard(DiaryBoard diary);
	DiaryBoard selectDiaryBoardByNo(int no);
	int updateDiaryBoard(DiaryBoard diary);
	int deleteDiaryBoard(int no);
	int selectDiaryBoardCount();
	}

package com.cityfarmer.diary.service;

import java.util.List;

import com.cityfarmer.repository.domain.diary.DiaryBoard;

public interface DiaryService {
	
	List<DiaryBoard> list();
	
	void write(DiaryBoard board);
	
	
}
package com.cityfarmer.diary.service;

import java.util.List;

import com.cityfarmer.repository.domain.DiaryBoard;

public interface DiaryService {
	
	List<DiaryBoard> list();
	
	void write(DiaryBoard board);
	
	
}
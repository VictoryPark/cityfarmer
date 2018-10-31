package com.cityfarmer.diary.service;

import java.util.List;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.diary.DiaryBoard;

public interface DiaryService {
	
	List<DiaryBoard> list(Page page);
	
	void writer(DiaryBoard board);
	
	DiaryBoard detail(int no);
	
	void update(DiaryBoard board);
	
	public DiaryBoard updateForm(int no);
	
	void delete(int no);
	
	int count();
	
	
}
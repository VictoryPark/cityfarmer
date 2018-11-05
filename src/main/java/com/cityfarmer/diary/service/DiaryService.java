package com.cityfarmer.diary.service;

import java.util.List;

import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.DiaryComment;
import com.cityfarmer.repository.domain.diary.drPage;

public interface DiaryService {
	
	List<DiaryBoard> list(drPage drpage);
	
	void writer(DiaryBoard board);
	
	DiaryBoard detail(int no);
	
	void update(DiaryBoard board);
	
	public DiaryBoard updateForm(int no);
	
	void delete(int no);
	
	int count();
	
	// 댓글 부분
	void writerComment(DiaryComment comment);
	List<DiaryComment> commentList(int no);
	void deleteDiaryComment(int drcNo);
	void updateDiaryComment(DiaryComment comment);
	int selectDiaryCommentCount(int drNo);
	
	
	
	
}
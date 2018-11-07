package com.cityfarmer.diary.service;

import java.util.List;

import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.DiaryComment;
import com.cityfarmer.repository.domain.diary.DiaryFile;
import com.cityfarmer.repository.domain.diary.drPage;

public interface DiaryService {
	
	List<DiaryBoard> list(drPage drpage);	
	void writer(DiaryBoard board, List<DiaryFile> fileList);
	DiaryBoard detail(int no);
	void update(DiaryBoard board, List<DiaryFile> fileList);
	public DiaryBoard updateForm(int no);
	void delete(int no);
	int count();
	
	// 댓글 부분
	void writerComment(DiaryComment comment);
	List<DiaryComment> commentList(int no);
	void deleteDiaryComment(int drcNo);
	void updateDiaryComment(DiaryComment comment);
	int selectDiaryCommentCount(int drNo);
	
	// 파일부분	
	void uploadFile(DiaryFile file); // 파일 업로드
	List<DiaryFile> listFile(int drNo); // 파일리스트
	void updateDiaryFile(DiaryFile file); // 파일 수정
	
	
}
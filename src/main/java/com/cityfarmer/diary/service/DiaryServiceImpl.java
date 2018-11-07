package com.cityfarmer.diary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.Page;
import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.domain.diary.DiaryComment;
import com.cityfarmer.repository.domain.diary.DiaryFile;
import com.cityfarmer.repository.domain.diary.drPage;
import com.cityfarmer.repository.mapper.DiaryMapper;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryMapper drmapper;
	
	@Override
	public void writer(DiaryBoard board, List<DiaryFile> fileList) {
		 drmapper.insertDiaryBoard(board);
		 if(fileList != null) {
			 for(DiaryFile f : fileList) {
				 uploadFile(f);
			 }
		 }
		
	}
	
	@Override
	public void uploadFile(DiaryFile file) {
		drmapper.insertDiaryFile(file);
	}
	
	@Override
	public void updateDiaryFile(DiaryFile file) {
		drmapper.updateDiaryFile(file);
	}
	
	@Override
	public List<DiaryFile> listFile(int drNo) {
		return drmapper.selectDiaryFileByNo(drNo);
	}
	
	@Override
	public List<DiaryBoard> list(drPage page) {
		return drmapper.selectDiaryBoard(page);
	}

	@Override
	public DiaryBoard detail(int no) {
		return drmapper.selectDiaryBoardByNo(no);
	}

	@Override
	public void update(DiaryBoard board, List<DiaryFile> fileList) {
		 drmapper.updateDiaryBoard(board);
		 
		 if(fileList != null) {
			 for(DiaryFile f : fileList) {
				 updateDiaryFile(f);
			 }
		 }
		
	}

	@Override
	public DiaryBoard updateForm(int no) {
		return drmapper.selectDiaryBoardByNo(no);
	}

	@Override
	public void delete(int no) {
		drmapper.deleteDiaryBoard(no);
		
	}

	@Override
	public int count() {
		return drmapper.selectDiaryBoardCount();
	}
	
	// 코멘트
	@Override
	public void writerComment(DiaryComment comment) {
		drmapper.drcInsertComment(comment);
		
	}

	@Override
	public List<DiaryComment> commentList(int no) {
		return drmapper.drcSelectComment(no);
	}

	@Override
	public void deleteDiaryComment(int drcNo) {
		drmapper.deleteDiaryComment(drcNo);
		
	}

	@Override
	public void updateDiaryComment(DiaryComment comment) {
		drmapper.updateDiaryComment(comment);
		
	}

	@Override
	public int selectDiaryCommentCount(int drNo) {
		return drmapper.selectDiaryCommentCount(drNo);
	}


}

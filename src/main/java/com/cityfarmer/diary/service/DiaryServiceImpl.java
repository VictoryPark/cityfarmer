package com.cityfarmer.diary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.diary.DiaryBoard;
import com.cityfarmer.repository.mapper.DiaryMapper;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryMapper drmapper;
	
	@Override
	public List<DiaryBoard> list() {
		return drmapper.selectDiaryBoard();
	}

	@Override
	public void write(DiaryBoard board) {
		
		
	}
	

}

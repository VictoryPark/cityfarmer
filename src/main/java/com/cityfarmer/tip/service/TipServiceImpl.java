package com.cityfarmer.tip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.TipBoard;
import com.cityfarmer.repository.mapper.TipMapper;

@Service
public class TipServiceImpl implements TipService {
	
	@Autowired
	private TipMapper mapper;

	// 게시판 전체글 조회
	@Override
	public List<TipBoard> selectBoard() {
		return mapper.selectBoard();
	}
	// 글등록
	@Override
	public void insertBoard(TipBoard board) {
		mapper.insertBoard(board);
	}
	// 상세글조회
	@Override
	public TipBoard selectBoardByNo(int no) {
		return mapper.selectBoardByNo(no);
	}
	
		
	
	
}

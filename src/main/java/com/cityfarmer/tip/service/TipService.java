package com.cityfarmer.tip.service;

import java.util.List;

import com.cityfarmer.repository.domain.TipBoard;

public interface TipService {
	//글등록
	void insertBoard(TipBoard board);
	// 전체 게시글 조회
	List<TipBoard> selectBoard();
	TipBoard selectBoardByNo(int no);

	
}

package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.TipBoard;

public interface TipMapper {
	//전체 게시글 조회
	List<TipBoard> selectBoard();
	//글상세조회
	TipBoard selectBoardByNo(int no);
	//글등록
	void insertBoard(TipBoard board);
	void deleteBoard(int no);
	void updateBoard(int no);
	
	
}

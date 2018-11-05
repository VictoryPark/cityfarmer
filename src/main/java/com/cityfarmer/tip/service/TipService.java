package com.cityfarmer.tip.service;

import java.util.List;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;

public interface TipService {
	
	List<TipBoard> selectBoard();
	int selectBoardCount();

	void insertBoard(TipBoard board);
	TipBoard selectBoardByNo(int no);
	void deleteBoard(int no);
	void update(TipBoard board);
	
	
	//´ñ±Û
	List<TipBoardComment> selectComment(int no);
	void deleteComment(int cNo);
	void insertComment(TipBoardComment tipBoardComment);
/*	void updateComment(TipBoardComment tipBoardComment);*/
/*	int selectCommentCountNo(int no);*/
	

	
}

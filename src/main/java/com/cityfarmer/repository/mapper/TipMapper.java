package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;

public interface TipMapper {
	
	List<TipBoard> selectBoard();
	int selectBoardCount();
	
	TipBoard selectBoardByNo(int no);
	void insertBoard(TipBoard board);
	void deleteBoard(int no);
	void updateBoard(TipBoard board);
	

	
	List<TipBoardComment> selectComment(int no);
	void insertComment(TipBoardComment tipBoardComment);
	void deleteComment(int no);
/*	void updateComment(TipBoardComment tipBoardComment);*/
	//´ñ±Û ÀüÃ¼ °¹¼ö
/*	int selectCommentCountNo(int no);*/
	
}

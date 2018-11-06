package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;
import com.cityfarmer.repository.domain.tip.TipFile;

public interface TipMapper {
	
	List<TipBoard> selectBoard(TipBoard board);
	int selectBoardCount();
	
	TipBoard selectBoardByNo(int no);
	void insertBoard(TipBoard board);
	void deleteBoard(int no);
	void updateBoard(TipBoard board);
	int updateBoardViewCnt(int no);
	

	List<TipBoardComment> selectComment(int no);
	void insertComment(TipBoardComment tipBoardComment);
	void deleteComment(int no);
	
	void insertTipFile(TipFile tipFile);
	TipFile selectTipFile(int no);

	
}

package com.cityfarmer.tip.service;

import java.util.List;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;
import com.cityfarmer.repository.domain.tip.TipFile;

public interface TipService {
	
	List<TipBoard> selectBoard(TipBoard board);
	int selectBoardCount();

	void insertBoard(TipBoard board, TipFile file);
	TipBoard selectBoardByNo(int no);
	void deleteBoard(int no);
	void update(TipBoard board);
	int updateBoardViewCnt(int no);
	
	

	List<TipBoardComment> selectComment(int no);
	void deleteComment(int cNo);
	void insertComment(TipBoardComment tipBoardComment);

	//파일등록
	
	void insertTipFile(TipFile file);
//	TipFile selectTipFile(int no);
	

	
}

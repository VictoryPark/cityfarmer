package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.tip.LikeTip;
import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;
import com.cityfarmer.repository.domain.tip.TipFile;

public interface TipMapper {
	
	List<TipBoard> selectBoard(TipBoard board);
	
	int selectBoardCount();//전체게시물 수
	
	TipBoard selectBoardByNo(int no);
	void insertBoard(TipBoard board);
	void deleteBoard(int no);
	void updateBoard(TipBoard board);
	int updateBoardViewCnt(int no);// 조회수 증가
	

	List<TipBoardComment> selectComment(int no);
	void insertComment(TipBoardComment tipBoardComment);
	void deleteComment(int no);
	
	void insertTipFile(TipFile tipFile);
	TipFile selectTipFile(int no);
	
	// 추천수조회- 아직구현 아니됨
	int CountLike(LikeTip likeTip);
	int selectCommentCountNo(int no);

	
}

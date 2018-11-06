package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeComment;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.domain.exchange.SearchVO;
import com.cityfarmer.repository.domain.exchange.ViewCnt;

public interface ExchangeMapper {

	int insertNewBoard(ExchangeBoard ex);
	
	void insertNewFile(ExchangeFile file);
	
	List<ExchangeBoard> selectAllBoard(ExchangeBoard param);
	
	ExchangeFile selectFileByExNo(int exNo);
	
	int selectBoardCount();
	
	ExchangeBoard selectBoardByExNo(int exNo);
	
	void updateBoard(ExchangeBoard board);
	
	void deleteBoard(int exNo);

	void insertNewComment(ExchangeComment comment);
	
	List<ExchangeComment> selectCommentListByExNo(int exNo);
	
	int selectCommentCount(int exNo);
	
	void deleteComment(int excNo);
	
	void updateComment(ExchangeComment comment);
	
	List<ExchangeComment> selectOneComment(int excNo);
	
	int selectBoardCountByWriterAndExNo(ViewCnt cnt);
	
	void updateViewCnt(int exNo);
	
	void insertReply(ExchangeComment comment);
	
	List<ExchangeComment> selectAllReplyOrderByRegister(int exNo);
	
	int updateY(int exNo);

	int updateN(int exNo);

	List<ExchangeBoard> selectBoardByTitle(SearchVO search);
	
	int selectBoardCountByTitle(SearchVO search);
	
	List<ExchangeBoard> selectBoardByWriter(SearchVO search);
	
	int selectBoardCountByWriter(SearchVO search);

	List<ExchangeComment> selectAllReplyOrderByDate(int exNo);
} //end mapper

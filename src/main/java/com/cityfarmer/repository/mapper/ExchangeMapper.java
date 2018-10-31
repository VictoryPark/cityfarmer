package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;

public interface ExchangeMapper {

	int insertNewBoard(ExchangeBoard ex);
	
	void insertNewFile(ExchangeFile file);
	
	List<ExchangeBoard> selectAllBoard(ExchangeBoard param);
	
	ExchangeFile selectFileByExNo(int exNo);
	
	int selectBoardCount();
	
	ExchangeBoard selectBoardByExNo(int exNo);
} //end mapper

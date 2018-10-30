package com.cityfarmer.repository.mapper;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;

public interface ExchangeMapper {

	int insertNewBoard(ExchangeBoard ex);
	
	void insertNewFile(ExchangeFile file);
} //end mapper

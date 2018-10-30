package com.cityfarmer.exchange.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.mapper.ExchangeMapper;

@Service
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeMapper mapper;
	
	
	@Override
	public int write(ExchangeBoard ex) {
		return mapper.insertNewBoard(ex);
	}


	@Override
	public void uploadFile(ExchangeFile file) {
		mapper.insertNewFile(file);
	} 

	
} //end class

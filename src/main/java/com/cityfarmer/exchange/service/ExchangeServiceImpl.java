package com.cityfarmer.exchange.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.ExchangeBoard;
import com.cityfarmer.repository.mapper.ExchangeMapper;

@Service
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeMapper mapper;
	
	
	@Override
	public int write(ExchangeBoard ex) {
		return mapper.insertNewExchange(ex);
	}

	
} //end class

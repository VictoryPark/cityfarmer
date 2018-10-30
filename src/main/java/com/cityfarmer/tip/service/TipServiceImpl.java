package com.cityfarmer.tip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.TipBoard;
import com.cityfarmer.repository.mapper.TipMapper;

@Service
public class TipServiceImpl implements TipService {
	
	@Autowired
	private TipMapper mapper;


	@Override
	public List<TipBoard> selectBoard() {
		
		return mapper.selectBoard();
	}
	
	/*@Override
	public void insertBoard(TipBoard board) {
		
		
	}*/
	
}

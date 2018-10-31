package com.cityfarmer.exchange.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.exchange.ExPageResult;
import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.mapper.ExchangeMapper;

@Service
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeMapper mapper;
	
	
	@Override
	public void write(ExchangeBoard board, ExchangeFile file) {
		mapper.insertNewBoard(board);
		System.out.println("board ex_no : " + board.getExNo());
		
		file.setExNo(board.getExNo());
		mapper.insertNewFile(file);
	}


	@Override
	public void uploadFile(ExchangeFile file) {
		mapper.insertNewFile(file);
	}


	@Override
	public Map<String, Object> list(int pageNo) {
		ExchangeBoard param = new ExchangeBoard();
		param.setPageNo(pageNo);
		
		Map<String, Object> map = new HashMap<>();
		
		List<ExchangeBoard> boardList = mapper.selectAllBoard(param);
		//List<ExchangeFile> fileList = new ArrayList<>();
		
		for(ExchangeBoard board : boardList) {
			System.out.println("board.getno : "+board.getExNo());
			
			ExchangeFile file = mapper.selectFileByExNo(board.getExNo());
			System.out.println("file : "+file);
			if(file ==null) continue;
			
			System.out.println(file.getExfPath()+ "/" + file.getExfSysName());
			board.setUrl(file.getExfPath() + "/" + file.getExfSysName());
		}
		
		int count = mapper.selectBoardCount();
		
		map.put("list", boardList);
		map.put("pageResult", new ExPageResult(pageNo, count));
		return map;
		
	}


	@Override
	public ExchangeBoard detail(int exNo) {
		ExchangeBoard board =  mapper.selectBoardByExNo(exNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		board.setRegDate(sdf.format(board.getExRegDate()));
		
		return board;
	}


	@Override
	public ExchangeBoard updateForm(int exNo) {
		return mapper.selectBoardByExNo(exNo);
	}


	@Override
	public void update(int exNo) {
		
	} 

	
} //end class

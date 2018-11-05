package com.cityfarmer.exchange.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.exchange.ExPageResult;
import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeComment;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.domain.exchange.ViewCnt;
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
			//System.out.println("board.getno : "+board.getExNo());
			
			ExchangeFile file = mapper.selectFileByExNo(board.getExNo());
			//System.out.println("file : "+file);
			if(file ==null) continue;
			
			System.out.println(file.getExfPath()+ "/" + file.getExfSysName());
			board.setUrl(file.getExfPath() + "/" + file.getExfSysName());
			board.setReply(mapper.selectCommentCount(board.getExNo()));
		}
		
		int count = mapper.selectBoardCount();
		
		map.put("list", boardList);
		map.put("pageResult", new ExPageResult(pageNo, count));
		return map;
		
	}


	@Override
	public Map<String, Object> detail(int exNo, String id) {
		Map<String, Object> map = new HashMap<>();
		ViewCnt cnt = new ViewCnt();
		cnt.setExNo(exNo);
		cnt.setId(id);
		
		if(mapper.selectBoardCountByWriter(cnt)==0) {
			mapper.updateViewCnt(exNo);
		}
		
		ExchangeBoard board =  mapper.selectBoardByExNo(exNo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		board.setRegDate(sdf.format(board.getExRegDate()));
		Integer count = mapper.selectCommentCount(exNo);
		
		map.put("board", board);
		map.put("count", count);
		return map;
	}


	@Override
	public ExchangeBoard updateForm(int exNo) {
		return mapper.selectBoardByExNo(exNo);
	}


	@Override
	public void update(ExchangeBoard board) {
		mapper.updateBoard(board);
	}


	@Override
	public void delete(int exNo) {
		mapper.deleteBoard(exNo);
	}


	@Override
	public List<ExchangeComment> writeComment(ExchangeComment comment) {
		mapper.insertNewComment(comment);
		return mapper.selectCommentListByExNo(comment.getExNo());
	}


	@Override
	public List<ExchangeComment> listComment(int exNo) {
		return mapper.selectAllReply(exNo);
	}


	@Override
	public List<ExchangeComment> deleteComment(ExchangeComment comment) {
		mapper.deleteComment(comment.getExcNo());
		return mapper.selectCommentListByExNo(comment.getExNo());
	}


	@Override
	public List<ExchangeComment> updateComment(ExchangeComment comment) {
		mapper.updateComment(comment);
		return mapper.selectCommentListByExNo(comment.getExNo());
	}


	@Override
	public List<ExchangeComment> writeReply(ExchangeComment comment) {
		mapper.insertReply(comment);
		return mapper.selectAllReply(comment.getExNo());
	}


	@Override
	public int updateY(int exNo) {
		return mapper.updateY(exNo);
	}
	
	@Override
	public int updateN(int exNo) {
		return mapper.updateN(exNo);
	}

	
} //end class

package com.cityfarmer.exchange.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.exchange.ExPageResult;
import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeComment;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.domain.exchange.SearchVO;
import com.cityfarmer.repository.domain.exchange.ViewCnt;
import com.cityfarmer.repository.mapper.ExchangeMapper;

@Service
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeMapper mapper;
	
	
	@Override
	public void writeAll(ExchangeBoard board, ExchangeFile file) {
		board.setExRegDate(new Date());
		mapper.insertNewBoard(board);
		System.out.println("board ex_no : " + board.getExNo());
		
		file.setExNo(board.getExNo());
		mapper.insertNewFile(file);
	}

	@Override
	public void write(ExchangeBoard board) {
		board.setExRegDate(new Date());
		mapper.insertNewBoard(board);
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
			
			board.setReply(mapper.selectCommentCount(board.getExNo()));
			ExchangeFile file = mapper.selectFileByExNo(board.getExNo());
			//System.out.println("file : "+file);
			if(file == null) continue;
			
			//System.out.println(file.getExfPath()+ "/" + file.getExfSysName());
			board.setUrl(file.getExfPath() + "/" + file.getExfSysName());
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
		
		if(mapper.selectBoardCountByWriterAndExNo(cnt)==0) {
			mapper.updateViewCnt(exNo);
		}
		
		ExchangeBoard board =  mapper.selectBoardByExNo(exNo);
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
	public Map<String, Object> writeComment(ExchangeComment comment) {
		comment.setExcRegDate(new Date());
		mapper.insertNewComment(comment);
		Map<String, Object> map = new HashMap<>();
		map.put("list", mapper.selectCommentListByExNo(comment.getExNo()));
		map.put("count", mapper.selectCommentCount(comment.getExNo()));
		return map;
	}


	@Override
	public List<ExchangeComment> listCommentByRegister(int exNo) {
		return mapper.selectAllReplyOrderByRegister(exNo);
	}


	@Override
	public Map<String, Object> deleteComment(ExchangeComment comment) {
		mapper.deleteComment(comment.getExcNo());
		Map<String, Object> map = new HashMap<>();
		map.put("list", mapper.selectCommentListByExNo(comment.getExNo()));
		map.put("count", mapper.selectCommentCount(comment.getExNo()));
		return map;
	}


	@Override
	public Map<String, Object> updateComment(ExchangeComment comment) {
		mapper.updateComment(comment);
		Map<String, Object> map = new HashMap<>();
		map.put("list", mapper.selectCommentListByExNo(comment.getExNo()));
		map.put("count", mapper.selectCommentCount(comment.getExNo()));
		return map;
	}


	@Override
	public Map<String, Object> writeReply(ExchangeComment comment) {
		mapper.insertReply(comment);
		Map<String, Object> map = new HashMap<>();
		map.put("list", mapper.selectAllReplyOrderByRegister(comment.getExNo()));
		map.put("count", mapper.selectCommentCount(comment.getExNo()));
		return map;
	}


	@Override
	public int updateY(int exNo) {
		return mapper.updateY(exNo);
	}
	
	@Override
	public int updateN(int exNo) {
		return mapper.updateN(exNo);
	}


	@Override
	public Map<String, Object> searchList(SearchVO search) {
		Map<String, Object> map = new HashMap<>();
		List<ExchangeBoard> boardList = null;
		int count = 0;
		//System.out.println("search : " + search);
		
		if(search.getType().equals("title")) {	
			boardList = mapper.selectBoardByTitle(search);
			count = mapper.selectBoardCountByTitle(search);
		} else if(search.getType().equals("writer")) {
			boardList = mapper.selectBoardByWriter(search);
			count = mapper.selectBoardCountByWriter(search);
		}
		
		//System.out.println("boardList : " + boardList);
		
		for(ExchangeBoard board : boardList) {
			//System.out.println("board.getno : "+board.getExNo());
			
			ExchangeFile file = mapper.selectFileByExNo(board.getExNo());
			//System.out.println("file : "+file);
			if(file ==null) continue;
			
			//System.out.println(file.getExfPath()+ "/" + file.getExfSysName());
			board.setUrl(file.getExfPath() + "/" + file.getExfSysName());
			board.setReply(mapper.selectCommentCount(board.getExNo()));
		}
		
		map.put("list", boardList);
		map.put("pageResult", new ExPageResult(search.getPageNo(), count));
		map.put("search", search);
		return map;
	}


	@Override
	public List<ExchangeComment> listCommentByDate(int exNo) {
		return mapper.selectAllReplyOrderByDate(exNo);
	}

	
} //end class

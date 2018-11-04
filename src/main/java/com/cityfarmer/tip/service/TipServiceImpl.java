package com.cityfarmer.tip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;
import com.cityfarmer.repository.mapper.TipMapper;

@Service
public class TipServiceImpl implements TipService {

	@Autowired
	private TipMapper mapper;

	@Override
	public List<TipBoard> selectBoard() {
		return mapper.selectBoard();
	}

	@Override
	public int selectBoardCount() {

		return mapper.selectBoardCount();
	}

	@Override
	public void insertBoard(TipBoard board) {
		mapper.insertBoard(board);
	}



	@Override
	public TipBoard selectBoardByNo(int no) {
		return mapper.selectBoardByNo(no);
	}

	@Override
	public void deleteBoard(int no) {
		mapper.deleteBoard(no);

	}

	@Override
	public void update(TipBoard board) {
		mapper.updateBoard(board);

	}
	// �뙎湲�

	@Override
	public List<TipBoardComment> selectComment(int no) {
	
		return mapper.selectComment(no);
	}

	@Override
	public void deleteComment(int cNo) {
	
		mapper.deleteComment(cNo);
		
	}

	@Override
	public void insertComment(TipBoardComment tipBoardComment) {
	mapper.insertComment(tipBoardComment);
		
	}
	/*@Override
	public void updateComment(TipBoardComment tipBoardComment) {
		mapper.updateComment(tipBoardComment);
		
	}
	*/
//댓글 전체갯수
	/*@Override
	public int selectCommentCountNo(int no) {
		System.out.println(mapper.selectCommentCountNo(no));
		return mapper.selectCommentCountNo(no);
	}*/
	



	

}

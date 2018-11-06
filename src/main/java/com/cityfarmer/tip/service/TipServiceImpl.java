package com.cityfarmer.tip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.domain.tip.TipBoardComment;
import com.cityfarmer.repository.domain.tip.TipFile;
import com.cityfarmer.repository.mapper.TipMapper;

@Service
public class TipServiceImpl implements TipService {

	@Autowired
	private TipMapper mapper;

	@Override
	public List<TipBoard> selectBoard(TipBoard board) {
		return mapper.selectBoard(board);
	}

	@Override
	public int selectBoardCount() {

		return mapper.selectBoardCount();
	}

	@Override
	public void insertBoard(TipBoard board, TipFile file) {
		
		mapper.insertBoard(board);
		file.setTipNo(board.getTipNo());
		mapper.insertTipFile(file);
	}



	@Override
	public TipBoard selectBoardByNo(int no) {
		mapper.updateBoardViewCnt(no);
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
	

	@Override
	public int updateBoardViewCnt(int no) {
		return mapper.updateBoardViewCnt(no);
	}

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
//파일 첨부
	@Override
	public void insertTipFile(TipFile file) {
	mapper.insertTipFile(file);
	}
	
//파일 갖고오기

	/*@Override
	public TipFile selectTipFile(int no) {
		mapper.selectTipFile(no);
		return mapper.selectTipFile(no);
	}
	*/
	
	
	
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

package com.cityfarmer.tip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.tip.TipBoard;
import com.cityfarmer.repository.mapper.TipMapper;

@Service
public class TipServiceImpl implements TipService {
	
	@Autowired
	private TipMapper mapper;

	// �Խ��� ��ü�� ��ȸ
	@Override
	public List<TipBoard> selectBoard() {
		return mapper.selectBoard();
	}
	// �۵��
	@Override
	public void insertBoard(TipBoard board) {
		mapper.insertBoard(board);
	}
	// �󼼱���ȸ
	@Override
	public TipBoard selectBoardByNo(int no) {
		return mapper.selectBoardByNo(no);
	}
	
		
	
	
}

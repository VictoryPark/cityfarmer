package com.cityfarmer.tip.service;

import java.util.List;

import com.cityfarmer.repository.domain.TipBoard;

public interface TipService {
	//�۵��
	void insertBoard(TipBoard board);
	// ��ü �Խñ� ��ȸ
	List<TipBoard> selectBoard();
	TipBoard selectBoardByNo(int no);

	
}

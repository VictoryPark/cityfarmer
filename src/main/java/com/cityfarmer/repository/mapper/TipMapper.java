package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.TipBoard;

public interface TipMapper {
	//��ü �Խñ� ��ȸ
	List<TipBoard> selectBoard();
	//�۵��
	TipBoard selectBoartByNo(int no);
	
	void insertBoard(TipBoard board);
	void deleteBoard(int no);
	void updateBoard(int no);
	
	
}

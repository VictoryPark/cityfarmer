package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.tip.TipBoard;

public interface TipMapper {
	//��ü �Խñ� ��ȸ
	List<TipBoard> selectBoard();
	//�ۻ���ȸ
	TipBoard selectBoardByNo(int no);
	//�۵��
	void insertBoard(TipBoard board);
	void deleteBoard(int no);
	void updateBoard(int no);
	
	
}

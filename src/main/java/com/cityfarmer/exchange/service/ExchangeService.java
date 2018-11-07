package com.cityfarmer.exchange.service;

import java.util.List;
import java.util.Map;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeComment;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;
import com.cityfarmer.repository.domain.exchange.SearchVO;

public interface ExchangeService {

	void writeAll(ExchangeBoard ex, ExchangeFile file);
	
	void write(ExchangeBoard board);

	void uploadFile(ExchangeFile file);

	Map<String, Object> list(int pageNo);

	Map<String, Object> detail(int exNo, String string);

	ExchangeBoard updateForm(int exNo);

	void update(ExchangeBoard board);

	void delete(int exNo);

	Map<String, Object> writeComment(ExchangeComment comment);

	List<ExchangeComment> listCommentByRegister(int exNo);

	Map<String, Object> deleteComment(ExchangeComment comment);

	Map<String, Object> updateComment(ExchangeComment comment);

	Map<String, Object> writeReply(ExchangeComment comment);

	int updateY(int exNo);

	int updateN(int exNo);

	Map<String, Object> searchList(SearchVO search);

	List<ExchangeComment> listCommentByDate(int exNo);

}

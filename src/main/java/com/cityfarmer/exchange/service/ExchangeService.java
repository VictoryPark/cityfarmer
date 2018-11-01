package com.cityfarmer.exchange.service;

import java.util.List;
import java.util.Map;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeComment;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;

public interface ExchangeService {

	void write(ExchangeBoard ex, ExchangeFile file);

	void uploadFile(ExchangeFile file);

	Map<String, Object> list(int pageNo);

	Map<String, Object> detail(int exNo);

	ExchangeBoard updateForm(int exNo);

	void update(ExchangeBoard board);

	void delete(int exNo);

	List<ExchangeComment> writeComment(ExchangeComment comment);

	List<ExchangeComment> listComment(ExchangeComment comment);

	List<ExchangeComment> deleteComment(ExchangeComment comment);

}

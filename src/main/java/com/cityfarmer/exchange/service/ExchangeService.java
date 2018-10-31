package com.cityfarmer.exchange.service;

import java.util.Map;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;

public interface ExchangeService {

	void write(ExchangeBoard ex, ExchangeFile file);

	void uploadFile(ExchangeFile file);

	Map<String, Object> list(int pageNo);

	ExchangeBoard detail(int exNo);

	ExchangeBoard updateForm(int exNo);

	void update(ExchangeBoard board);

	void delete(int exNo);

}

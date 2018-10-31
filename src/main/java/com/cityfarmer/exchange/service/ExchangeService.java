package com.cityfarmer.exchange.service;

import com.cityfarmer.repository.domain.exchange.ExchangeBoard;
import com.cityfarmer.repository.domain.exchange.ExchangeFile;

public interface ExchangeService {

	int write(ExchangeBoard ex, ExchangeFile file);

	void uploadFile(ExchangeFile file);

}

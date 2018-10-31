package com.cityfarmer.repository.domain.exchange;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExchangeFile {

	private int exfNo;
	private int exNo;
	private String exfOriName;
	private String exfSysName;
	private String exfPath;
	private long exfSize;
	private String url;
	
} //end class

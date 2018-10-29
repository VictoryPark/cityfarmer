package com.cityfarmer.repository.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExchangeBoard {

	private int exNo;
	private String writer;
	private String exTitle;
	private String exContent;
	private Date exRegDate;
	private String exComplete;
	private int exViewCnt;
} //end class

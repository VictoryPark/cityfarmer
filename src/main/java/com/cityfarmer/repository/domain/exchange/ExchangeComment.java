package com.cityfarmer.repository.domain.exchange;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExchangeComment {

	private int excNo;
	private int exNo;
	private String excWriter;
	private String excContent;
	private Date excRegDate;
	private int excRef;
	private int excParentNo;
	private String regDateString;
} //end class

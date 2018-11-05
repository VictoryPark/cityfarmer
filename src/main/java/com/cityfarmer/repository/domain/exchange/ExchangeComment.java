package com.cityfarmer.repository.domain.exchange;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date excRegDate;
	private int excRef;
	private int excParentNo;
	//private String regDateString;
} //end class

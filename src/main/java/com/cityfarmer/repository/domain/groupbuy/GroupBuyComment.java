package com.cityfarmer.repository.domain.groupbuy;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class GroupBuyComment {
	
	private int gbcNo;
	private int gbNo;
	private String gbcWriter;
	private String gbcContent;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date gbcRegDate;
	
}

package com.cityfarmer.repository.domain.tip;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TipBoardComment {
	private int tipNo;
	private int tipcNo;
	private String tipcWriter;
	private String tipcContent;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date tipcRegDate;

}

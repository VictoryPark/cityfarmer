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
	private Date tipcRegDate;

}

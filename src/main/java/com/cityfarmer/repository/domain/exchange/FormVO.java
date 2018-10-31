package com.cityfarmer.repository.domain.exchange;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FormVO {

	private String writer;
	private String title;
	private String content;
	private String fileUrl;
	private String oriName;
	private String sysName;
	private String path;
	private int size;
	
} //end class

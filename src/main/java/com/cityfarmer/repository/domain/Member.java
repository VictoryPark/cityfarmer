package com.cityfarmer.repository.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member {

	private int memberNo;
	private String id;
	private String name;
	private String pass;
	private String filePath;
	private String fileName;
	
} //end class

package com.cityfarmer.repository.domain.groupbuy;

import java.util.Date;

import lombok.Data;

@Data
public class GroupBuyComment {
	
	int gbcNo;
	int gbNo;
	String gbcWriter;
	String gbcContent;
	Date gbcRegDate;
	
}

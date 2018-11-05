package com.cityfarmer.repository.domain.groupbuy;

import lombok.Data;

@Data
public class GroupBuyFile {

	private int gbfNo;
	private int gbNo;
	private String gbfOriName;
	private String gbfSysName;
	private String gbfPath;
	private long gbfSize;
	private String url;
}

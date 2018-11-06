package com.cityfarmer.repository.domain.exchange;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


public class SearchVO {
	
	private String type;
	private String keyword;
	private int pageNo;
	
	public int getBegin() {
		return (pageNo-1) * 6 + 1;
	}

	public int getEnd() {
		return pageNo * 6;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "SearchVO [type=" + type + ", keyword=" + keyword + ", pageNo=" + pageNo + "]";
	}
	
	
} //end class

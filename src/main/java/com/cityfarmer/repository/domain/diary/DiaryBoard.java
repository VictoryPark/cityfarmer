package com.cityfarmer.repository.domain.diary;

import java.util.Date;

public class DiaryBoard {
	private int drNo;
	private String drTitle;
	private String writer;
	private String drContent;
	private Date drRegDate;
	private int pageNo;
	private String searchType;
	private String keyword;
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getDrNo() {
		return drNo;
	}
	public void setDrNo(int drNo) {
		this.drNo = drNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDrTitle() {
		return drTitle;
	}
	public void setDrTitle(String drTitle) {
		this.drTitle = drTitle;
	}
	public String getDrContent() {
		return drContent;
	}
	public void setDrContent(String drContent) {
		this.drContent = drContent;
	}
	public Date getDrRegDate() {
		return drRegDate;
	}
	public void setDrRegDate(Date drRegDate) {
		this.drRegDate = drRegDate;
	}
	
	public int getBegin() {
		return (pageNo - 1) * 10 + 1;
	}
	public int getEnd() {
		return pageNo * 10;
	}
	
	

	
	
	
	
	
	
	
}
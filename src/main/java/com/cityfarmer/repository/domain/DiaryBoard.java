package com.cityfarmer.repository.domain;

import java.util.Date;

public class DiaryBoard {
	private int drNo;
	private String drTitle;
	private String writer;
	private String drContent;
	private Date drRegDate;
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
	
	
}
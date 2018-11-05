package com.cityfarmer.repository.domain.diary;

import java.util.Date;

public class DiaryComment {
	private int drcNo;
	private int drNo;
	private String drcWriter;
	private String drcContent;
	private Date drcRegdate;
	public int getDrcNo() {
		return drcNo;
	}
	public void setDrcNo(int drcNo) {
		this.drcNo = drcNo;
	}
	public int getDrNo() {
		return drNo;
	}
	public void setDrNo(int drNo) {
		this.drNo = drNo;
	}
	public String getDrcWriter() {
		return drcWriter;
	}
	public void setDrcWriter(String drcWriter) {
		this.drcWriter = drcWriter;
	}
	public String getDrcContent() {
		return drcContent;
	}
	public void setDrcContent(String drcContent) {
		this.drcContent = drcContent;
	}
	public Date getDrcRegdate() {
		return drcRegdate;
	}
	public void setDrcRegdate(Date drcRegdate) {
		this.drcRegdate = drcRegdate;
	}
	
	

}

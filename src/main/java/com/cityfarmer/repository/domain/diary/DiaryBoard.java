package com.cityfarmer.repository.domain.diary;

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
	
	
//  댓글 부분
	
	/*private int drcNo;
	private String drcWriter;
	private String drcContent;
	private Date drcRegdate;
	
	public int getDrcNo() {
		return drcNo;
	}
	public void setDrcNo(int drcNo) {
		this.drcNo = drcNo;
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
	
	@Override
	public String toString() {
		return "DiaryBoard [drNo=" + drNo + ", drTitle=" + drTitle + ", writer=" + writer + ", drContent=" + drContent
				+ ", drRegDate=" + drRegDate + ", drcNo=" + drcNo + ", drcWriter=" + drcWriter + ", drcContent="
				+ drcContent + ", drcRegdate=" + drcRegdate + "]";
	}
	*/
	
	
	
	
	
	
	
}
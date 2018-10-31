package com.cityfarmer.repository.domain.gallery;

import java.util.Date;

public class GalleryBoard {
	private int count;
	private int gaNo;
	private String writer;
	private String gaTitle;
	private String gaContent;
	private int gaRecCnt;
	private int gaViewCnt;
	private Date gaRegDate;
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getGaNo() {
		return gaNo;
	}
	public void setGaNo(int gaNo) {
		this.gaNo = gaNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getGaTitle() {
		return gaTitle;
	}
	public void setGaTitle(String gaTitle) {
		this.gaTitle = gaTitle;
	}
	public String getGaContent() {
		return gaContent;
	}
	public void setGaContent(String gaContent) {
		this.gaContent = gaContent;
	}
	public int getGaRecCnt() {
		return gaRecCnt;
	}
	public void setGaRecCnt(int gaRecCnt) {
		this.gaRecCnt = gaRecCnt;
	}
	public int getGaViewCnt() {
		return gaViewCnt;
	}
	public void setGaViewCnt(int gaViewCnt) {
		this.gaViewCnt = gaViewCnt;
	}
	public Date getGaRegDate() {
		return gaRegDate;
	}
	public void setGaRegDate(Date gaRegDate) {
		this.gaRegDate = gaRegDate;
	}
//	-----------------------page---------------------------------------------
	private int pageNo;
	private int begin;
	private int end;
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	//#{begin} -> board.xml
	public int getBegin() {
		return (pageNo - 1 )* 10 + 1;
	}
	
	//#{end} -> board.xml
	public int getEnd() {
		return pageNo * 10;
	}
	

}

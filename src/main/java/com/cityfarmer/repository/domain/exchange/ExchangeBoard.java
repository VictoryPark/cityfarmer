package com.cityfarmer.repository.domain.exchange;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
public class ExchangeBoard {

	private int exNo;
	private String writer;
	private String exTitle;
	private String exContent;
	private Date exRegDate;
	private String exComplete;
	private int exViewCnt;
	private String fileUrl;
	private int pageNo;
//	private int begin;
//	private int end;
	
	
	public int getExNo() {
		return exNo;
	}
	public void setExNo(int exNo) {
		this.exNo = exNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getExTitle() {
		return exTitle;
	}
	public void setExTitle(String exTitle) {
		this.exTitle = exTitle;
	}
	public String getExContent() {
		return exContent;
	}
	public void setExContent(String exContent) {
		this.exContent = exContent;
	}
	public Date getExRegDate() {
		return exRegDate;
	}
	public void setExRegDate(Date exRegDate) {
		this.exRegDate = exRegDate;
	}
	public String getExComplete() {
		return exComplete;
	}
	public void setExComplete(String exComplete) {
		this.exComplete = exComplete;
	}
	public int getExViewCnt() {
		return exViewCnt;
	}
	public void setExViewCnt(int exViewCnt) {
		this.exViewCnt = exViewCnt;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (pageNo-1) * 6 + 1;
	}
//	public void setBegin(int begin) {
//		this.begin = begin;
//	}
	public int getEnd() {
		return pageNo * 6;
	}
//	public void setEnd(int end) {
//		this.end = end;
//	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	
	
} //end class

package com.cityfarmer.repository.domain;

import java.util.Date;

public class TipBoard {

	private int tipNo;
	private String writer;
	private String tipTitle;
	private String tipContent;
	private int tipViewCnt;
	private Date tipRegDate;
	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTipTitle() {
		return tipTitle;
	}
	public void setTipTitle(String tipTitle) {
		this.tipTitle = tipTitle;
	}
	public String getTipContent() {
		return tipContent;
	}
	public void setTipContent(String tipContent) {
		this.tipContent = tipContent;
	}
	public int getTipViewCnt() {
		return tipViewCnt;
	}
	public void setTipViewCnt(int tipViewCnt) {
		this.tipViewCnt = tipViewCnt;
	}
	public Date getTipRegDate() {
		return tipRegDate;
	}
	public void setTipRegDate(Date tipRegDate) {
		this.tipRegDate = tipRegDate;
	}
	@Override
	public String toString() {
		return "TipBoard [tipNo=" + tipNo + ", writer=" + writer + ", tipTitle=" + tipTitle + ", tipContent="
				+ tipContent + ", tipViewCnt=" + tipViewCnt + ", tipRegDate=" + tipRegDate + "]";
	}
	
	
	
	
	
	

}

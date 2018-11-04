package com.cityfarmer.repository.domain.tip;

import java.util.Date;

public class TipBoard {

	private int tipNo;
	private int tipcNo;
	
	private String writer;
	private String tipTitle;
	private String tipContent;
	private int tipViewCnt;
	private Date tipRegDate;
	
	//댓글 삭제를 위해 tipcNo불러주기
	public int getTipcNo() {
		return tipcNo;
	}
	public void setTipcNo(int tipcNo) {
		this.tipcNo = tipcNo;
	}
	
	
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

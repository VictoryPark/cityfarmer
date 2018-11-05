package com.cityfarmer.repository.domain.gallery;

import java.util.Date;

public class GalleryComment {
	
	
	private int gaNo;
	private int gacNo;
	private String gacWriter;
	private String gacContent;
	private Date gacRegDate;
	private String regDateString;

	public String getRegDateString() {
		return regDateString;
	}
	public void setRegDateString(String regDateString) {
		this.regDateString = regDateString;
	}
	public int getGaNo() {
		return gaNo;
	}
	public void setGaNo(int gaNo) {
		this.gaNo = gaNo;
	}
	public int getGacNo() {
		return gacNo;
	}
	public void setGacNo(int gacNo) {
		this.gacNo = gacNo;
	}
	public String getGacWriter() {
		return gacWriter;
	}
	public void setGacWriter(String gacWriter) {
		this.gacWriter = gacWriter;
	}
	public String getGacContent() {
		return gacContent;
	}
	public void setGacContent(String gacContent) {
		this.gacContent = gacContent;
	}
	public Date getGacRegDate() {
		return gacRegDate;
	}
	public void setGacRegDate(Date gacRegDate) {
		this.gacRegDate = gacRegDate;
	}
	
}

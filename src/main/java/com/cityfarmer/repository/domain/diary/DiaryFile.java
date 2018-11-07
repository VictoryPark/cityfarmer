package com.cityfarmer.repository.domain.diary;

public class DiaryFile {
	private int drcNo;
	private int drNo;
	private String drfOriName;
	private String drfSysName;
	private String drfPath;
	private long drfSize;
	private String url;
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
	public String getDrfOriName() {
		return drfOriName;
	}
	public void setDrfOriName(String drfOriName) {
		this.drfOriName = drfOriName;
	}
	public String getDrfSysName() {
		return drfSysName;
	}
	public void setDrfSysName(String drfSysName) {
		this.drfSysName = drfSysName;
	}
	public String getDrfPath() {
		return drfPath;
	}
	public void setDrfPath(String drfPath) {
		this.drfPath = drfPath;
	}
	public long getDrfSize() {
		return drfSize;
	}
	public void setDrfSize(long drfSize) {
		this.drfSize = drfSize;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	

}
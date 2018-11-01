package com.cityfarmer.repository.domain.gallery;

public class GalleryFile {

	private int gafNo;
	private int gaNo;
	private String gafOriName;
	private String gafSysName;
	private String gafPath;
	private long gafSize;
	private String url;

	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getGafNo() {
		return gafNo;
	}
	public void setGafNo(int gafNo) {
		this.gafNo = gafNo;
	}
	public int getGaNo() {
		return gaNo;
	}
	public void setGaNo(int gaNo) {
		this.gaNo = gaNo;
	}
	public String getGafOriName() {
		return gafOriName;
	}
	public void setGafOriName(String gafOriName) {
		this.gafOriName = gafOriName;
	}
	public String getGafSysName() {
		return gafSysName;
	}
	public void setGafSysName(String gafSysName) {
		this.gafSysName = gafSysName;
	}
	public String getGafPath() {
		return gafPath;
	}
	public void setGafPath(String gafPath) {
		this.gafPath = gafPath;
	}
	public long getGafSize() {
		return gafSize;
	}
	public void setGafSize(long gafSize) {
		this.gafSize = gafSize;
	}

	
}

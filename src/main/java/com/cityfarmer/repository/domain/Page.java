package com.cityfarmer.repository.domain;

public class Page {
	// 페이지 번호
	private int pageNo;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	// #{begin} -> board.xml
	public int getBegin() {
		return (pageNo - 1) * 10 + 1;
	}
	// #{end} -> board.xml
	public int getEnd() {
		return pageNo * 10;
	}
}

























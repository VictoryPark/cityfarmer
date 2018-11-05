package com.cityfarmer.repository.domain.groupbuy;

import java.util.Date;

import lombok.Data;

@Data
public class GroupBuyBoard {
	private int gbNo; // 시퀀스
	private String writer; // 로긴한 유저 아이디
	private String gbTitle; 
	private String gbContent;
	private Date gbRegDate;	// 기본값
	private int gbViewCnt; // 기본값
	private String gbStartDay; // 글 작성일
	private String gbEndDay; // 선택일
	private String gbStartTime; // 글 작성시간
	private String gbEndTime; // 종료 시간
	private int pageNo;
	private String searchType;
	private String keyword;
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (pageNo - 1) * 10 + 1;
	}
	public int getEnd() {
		return pageNo * 10;
	}
}



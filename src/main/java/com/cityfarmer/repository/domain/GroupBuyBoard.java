package com.cityfarmer.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GroupBuyBoard {
	int gbNo; // 시퀀스
	String writer; // 로긴한 유저 아이디
	String gbTitle; 
	String gbContent;
	Date gbRegDate;	// 기본값
	int gbViewCnt; // 기본값
	String gbStartDay; // 글 작성일
	String gbEndDay; // 선택일
	String gbStartTime; // 글 작성시간
	String gbEndTime; // 종료 시간
}



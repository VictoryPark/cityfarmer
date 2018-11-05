package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.Login;
import com.cityfarmer.repository.domain.Member;

public interface MemberMapper {

	public void insertNewMemberNofile(Member member);
	
	public Member selectMemberwithIdandPass(Login login);

	public List<String> selectId();
} //end classs

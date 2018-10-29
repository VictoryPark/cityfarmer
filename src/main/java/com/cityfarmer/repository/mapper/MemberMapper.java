package com.cityfarmer.repository.mapper;

import com.cityfarmer.repository.domain.Login;
import com.cityfarmer.repository.domain.Member;

public interface MemberMapper {

	public void insertNewMemberNofile(Member member);
	
	public Member selectMemberwithIdandPass(Login login);
} //end classs

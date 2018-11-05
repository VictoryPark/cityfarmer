package com.cityfarmer.member.service;

import com.cityfarmer.repository.domain.Login;
import com.cityfarmer.repository.domain.Member;

public interface MemberService {

	void signup(Member member);

	Member login(Login login);

	boolean checkId(String id);

}

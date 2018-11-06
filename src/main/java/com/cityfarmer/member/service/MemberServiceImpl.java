package com.cityfarmer.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.Login;
import com.cityfarmer.repository.domain.Member;
import com.cityfarmer.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void signup(Member member) {
		mapper.insertNewMemberNofile(member);
	} //회원가입

	@Override
	public Member login(Login login) {
		return mapper.selectMemberwithIdandPass(login);
	} //로그인

	@Override
	public boolean checkId(String id) {
		List<String> idList = mapper.selectId();
		//System.out.println("id : " + id);
		//System.out.println("idList : " + idList);
		boolean result = false;
		for(String oriId : idList) {
			//System.out.println("oriId : " + oriId.intern());
			if(oriId.equals(id)) {
				result = true;
				break;
			}
		}
		return result;
	}

}

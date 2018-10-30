package com.cityfarmer.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cityfarmer.member.service.MemberService;
import com.cityfarmer.repository.domain.Login;
import com.cityfarmer.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/signup.cf")
	//회원가입
	public String signup(Member member) {
		service.signup(member);
		
		return "redirect:/start.cf";
	}
	
	@RequestMapping("/login.cf")
	public String login(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
		
		System.out.println("member id : "+ member.getId());
		if(member != null) {
			session.setAttribute("user", member);
			return "redirect:/main.cf";
		}
		
		return "redirect:/start.cf";
	}
}

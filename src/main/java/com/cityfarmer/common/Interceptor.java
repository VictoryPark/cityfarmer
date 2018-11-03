package com.cityfarmer.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cityfarmer.repository.domain.Member;



public class Interceptor extends HandlerInterceptorAdapter{

	@Override
	//마이 페이지 넘기기 '전' 에 확인하기때문에 preHandle
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
					
		HttpSession session = request.getSession();
		
		Member m = (Member) session.getAttribute("user");
		if(m != null) {
			return true;
		}
		System.out.println("인증 인터셉터에 로그인 부분이 안되었음이 걸렸음..");
		response.sendRedirect("/cityFarmer/start.cf");
		return false;
	}
}

package com.cityfarmer.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cityfarmer.repository.domain.Member;

public class LoginCheckFilter implements Filter {
	
	// 로그인 없이 접근할 수 있는 페이지 URI 리스트
	private List<String> list = new ArrayList<>();
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		String pages = config.getInitParameter("pages");
//		System.out.println(pages);
		String[] arr = pages.split(";");
		for (String page : arr) {
//			System.out.println(page.trim());
			list.add(page.trim());
		} // for
	} // init

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 사용자가 요청한 페이지 URI 가져오기
		HttpServletRequest hReq = (HttpServletRequest)request;
		HttpServletResponse hRes = (HttpServletResponse)response;
		
		String uri = hReq.getRequestURI();
		//System.out.println("uri : " + uri);
		
		String contextPath = hReq.getContextPath();
		//System.out.println("contextPath : " + contextPath);
		
		uri = uri.substring(contextPath.length());
		//System.out.println("변경후 uri : " + uri);
		
		// 1. 로그인이 필요한 페이지에 대해서 로그인이 되어 있는지 체크하고
		//    list 안에 uri가 포함되어 있는지 확인한다.
		//    포함되어 있다면 호출한 페이지로 이동시킨다.
		//    포함되어 있지 않다면 반드시 로그인 해야 하는 페이지다.
		// list.indexOf(uri)의 결과가 -1 이라면 로그인이 되어야 하는 페이지 이다.
		int index = list.indexOf(uri);
		
		// 2. 만약, 로그인이 안되어 있다면 로그인폼("/login/login-form.do)으로 이동시키고
		// session 객체에 "user"의 이름으로 객체가 등록되어 있는지 확인한다.
		if (index == -1) {
			HttpSession session = hReq.getSession();
			Member user = (Member)session.getAttribute("user");
			
			// 만약, 로그인이 필요한 페이지인데 로그인을 하지 않은 상태로 접근한 경우
			if (user == null) {
				// 로그인 폼으로 페이지를 이동
				hRes.sendRedirect(contextPath +"/login-form.j");
				return;
			} // inner if
		} // outer if
		
		// 3. 로그인 되어있다면 호풀한 페이지로 이동.
		chain.doFilter(request, response);
	} // doFilter

	
} // end class

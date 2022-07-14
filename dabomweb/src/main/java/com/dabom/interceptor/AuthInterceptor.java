package com.dabom.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.dabom.dto.Member;


public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginuser");
		
		String uri = request.getRequestURI();
		
		if(member == null) {
			if (uri.equals("/dabomweb/") || uri.equals("/dabomweb/home")) {
				response.sendRedirect("/dabomweb/nonMembersHome");
				return false;
			}
			response.sendRedirect("/dabomweb/account/login");
			return false;
		}else {
		return true; 
		}
	}
	
}
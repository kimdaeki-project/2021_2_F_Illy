package com.c.illy.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class LoginFail implements AuthenticationFailureHandler {
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		  if (exception instanceof UsernameNotFoundException) {
		  request.setAttribute("loginFailMsg", "존재하지 않는 사용자입니다."); }
		  
		  else if(exception instanceof BadCredentialsException) {
			  request.setAttribute("loginFailMsg", "아이디나 비밀번호가 맞지 않습니다. 다시 확인해 주세요.");
		  }

		request.getRequestDispatcher("/member/login").forward(request, response);
	}
	
}
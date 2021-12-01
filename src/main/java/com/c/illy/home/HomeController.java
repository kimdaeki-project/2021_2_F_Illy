package com.c.illy.home;

import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.c.illy.member.MemberVO;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		Enumeration<String> en = session.getAttributeNames();
		 while (en.hasMoreElements()) {
			String string = (String) en.nextElement();
		}
		Object object = session.getAttribute("SPRING_SECURITY_CONTEXT");

		SecurityContextImpl sc =(SecurityContextImpl)object;
		Authentication authentication = sc.getAuthentication();
		MemberVO memberVO = (MemberVO)authentication.getPrincipal();
		return "index";
	}

	// -------------------------------------------------sideBar create cookie 
	@GetMapping("/sideBar")
	public void sideBar(HttpServletResponse response,String sideBar) {
		Cookie cookie = new Cookie("sideBar","on"); 
		if(sideBar==null) {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
	}
	
	
	
	
	
}

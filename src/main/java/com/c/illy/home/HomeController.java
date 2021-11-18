package com.c.illy.home;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home() {
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

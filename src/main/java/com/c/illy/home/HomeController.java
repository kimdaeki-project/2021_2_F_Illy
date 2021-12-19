package com.c.illy.home;

import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.c.illy.member.MemberVO;
import com.c.illy.product.ProductService;
import com.c.illy.product.ProductVO;
import com.c.illy.util.Pager;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;

	@GetMapping("/")
	public String home(Model model, ProductVO productVO, Pager pager, @AuthenticationPrincipal MemberVO memberVO) throws Exception {

		model.addAttribute("listAllProduct", productService.getListProduct(productVO, pager));
		pager.setSort("review_star DESC");
		model.addAttribute("BestlistAllProduct", productService.getListProduct(productVO, pager));
		model.addAttribute("member", memberVO);
		
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

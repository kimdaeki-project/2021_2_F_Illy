package com.c.illy.admin;

import java.net.http.HttpRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@GetMapping("adIndex")
	public void main() {
	}

	@GetMapping("insertProduct")
	public void insertProduct(Model model, String type) {
		model.addAttribute("type", type);
	}
	
}

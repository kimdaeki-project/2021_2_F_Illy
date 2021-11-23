package com.c.illy.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@GetMapping("bestReview")
	public String getSelectBestReview()throws Exception{
		return "board/bestReview"; 
	}
	
	
	
	
	
	
	
	
	
}

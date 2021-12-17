package com.c.illy.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	
	@GetMapping("bestReview")
	public String getSelectBestReview()throws Exception{
		return "review/bestReview"; 
	}
	
	@GetMapping("reviewAll")
	public ModelAndView getSelecReviewAll(ModelAndView mv)throws Exception{
		//List<ReviewVO> ar = reviewService.getReviewList();
		mv.setViewName("review/reviewAll");
		//mv.addObject("RList", ar);
		return mv; 
	}
	
	
	
	
	
	
	
	
}

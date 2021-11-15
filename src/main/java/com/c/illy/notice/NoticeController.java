package com.c.illy.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@GetMapping("selectList")
	public ModelAndView getSelectList()throws Exception{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("board/list");
		return mv; 
		
	}
	
	
	
	
	
}

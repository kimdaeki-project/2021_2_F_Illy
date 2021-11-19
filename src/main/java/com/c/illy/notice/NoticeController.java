package com.c.illy.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService; 

// --------------------------------------------------------------------- Notice	
	//공지사항 리스트 불러오기 
	@GetMapping("list")
	public ModelAndView getSelectList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NoticeVO> ar = noticeService.getSelectList();
		mv.setViewName("board/noticeList");
		mv.addObject("List", ar);
		return mv; 	
	}
	
	
	
	
	
	
	
	
	
	
	
// --------------------------------------------------------------------- Faq	
	//Faq 리스트 불러오기 
	@GetMapping("faqList")
	public String getFaqList()throws Exception{
		return "board/faqList";
	}
	
	
	
	
	
}

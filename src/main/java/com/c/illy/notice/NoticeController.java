package com.c.illy.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.c.illy.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService; 

// --------------------------------------------------------------------- Notice	
	//공지사항 리스트 불러오기 
	@GetMapping("list")
	public ModelAndView getSelectList(Pager pager,ModelAndView mv)throws Exception{
		List<NoticeVO> ar = noticeService.getSelectList(pager);
		List<NoticeVO> arTop=noticeService.getSelectListTop();
		mv.setViewName("board/noticeList");
		mv.addObject("List", ar);
		mv.addObject("ListTop", arTop);
		mv.addObject("pager", pager);
		return mv; 	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// --------------------------------------------------------------------- Faq	
	//Faq 리스트 불러오기 
	@GetMapping("faqList")
	public String getFaqList()throws Exception{
		return "board/faqList";
	}
	
	
	
	
	
}

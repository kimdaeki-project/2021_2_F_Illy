package com.c.illy.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.c.illy.faq.FaqService;
import com.c.illy.faq.FaqVO;
import com.c.illy.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService; 
	
	@Autowired
	private FaqService faqService;

// --------------------------------------------------------------------- Notice	영역
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
	
		
	
	
	
// --------------------------------------------------------------------- Faq 영역	
	//Faq 리스트 불러오기 
	@GetMapping("faqList")
	public ModelAndView getFaqList(Pager pager,ModelAndView mv)throws Exception{
		List<FaqVO> ar = faqService.getFaqList(pager);
		mv.setViewName("board/faqList");
		mv.addObject("FList", ar);
		mv.addObject("pager", pager);
		return mv;
	}
	
	
	@GetMapping("faqTypeList")
	public ModelAndView getFaqTypeList(Pager pager,ModelAndView mv)throws Exception{
		List<FaqVO> ar = faqService.getFaqList(pager); 
		mv.addObject("FList", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/faqTypeList");
		return mv;
	}
	
	/*
	 * @GetMapping("faqTypePager") public ModelAndView getFaqTypePager(Pager
	 * pager,ModelAndView mv)throws Exception{ List<FaqVO> ar =
	 * faqService.getFaqList(pager); mv.addObject("pager", pager);
	 * mv.setViewName("board/pager"); return mv; }
	 */
	
	
	
	
	
	
	
	
}

package com.c.illy.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService; 
	
	@GetMapping("qnaList")
	public ModelAndView getQnaList(ModelAndView mv)throws Exception{
		List<QnaVO> ar = qnaService.getQnaList();
		mv.setViewName("board/qnaList");
		mv.addObject("QList", ar);
		return mv; 
	}
	
	
	
	
	
}

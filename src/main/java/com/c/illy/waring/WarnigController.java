package com.c.illy.waring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/warning/**")
public class WarnigController {
	
	@GetMapping("/joinWarning")
	public ModelAndView joinWarning() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("warning/urlRequest");
		return mv;
	}
}

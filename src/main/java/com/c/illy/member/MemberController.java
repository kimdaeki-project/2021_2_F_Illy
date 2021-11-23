package com.c.illy.member;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("member/**")
public class MemberController {
	@Autowired
	private MemberRepository memberRepository;

	@GetMapping("join_agreement")
	public ModelAndView join_agreement() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join_agreement");
		return mv;
	}

	@GetMapping("join_agreement_detail")
	public ModelAndView join_agreement_detail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join_agreement_detail");
		return mv;
	}

	@GetMapping("join_agreement_detail2")
	public ModelAndView join_agreement_detail2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join_agreement_detail2");
		return mv;
	}

	@GetMapping("join")
	public String join(Model model) {
		MemberVO memberVO = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		return "/member/join";
	}

	// 회원가입 form 검증
	@PostMapping("join")
	public String join(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join");
		memberRepository.setInsert(memberVO);
		if (bindingResult.hasErrors()) {
			return "/member/join";
		}
		memberRepository.setInsert(memberVO);
		return "redirect:/";
	}
}

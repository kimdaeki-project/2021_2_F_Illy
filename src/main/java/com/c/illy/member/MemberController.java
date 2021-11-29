package com.c.illy.member;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.servlet.ModelAndView;

import com.c.illy.address.AddressRepository;
import com.c.illy.address.AddressService;
import com.c.illy.address.AddressVO;

@Controller
@RequestMapping("member/**")
public class MemberController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private AddressService addressService;
	
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
		AddressVO addressVO = new AddressVO();
		model.addAttribute("addressVO", addressVO);
		return "/member/join";
	}

	// 회원가입 form 검증
	@PostMapping("join")
	public String join(@Valid AddressVO addressVO, BindingResult bindingResult, HttpServletRequest request) throws Exception {
		if (bindingResult.hasErrors()) {
			return "/member/join";
		}
		
		memberService.setInsert(addressVO);
		
		// api로 받아온 우편번호, 주소, 참고항목, 상세정보를 address 변수에 합침
		addressService.setAddress(addressVO,request);
		return "redirect:/";
	}
	
	
	// Ajax 아이디 중복검사
	@GetMapping("checkId")
	public ModelAndView checkId(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(request.getParameter("username"));
		memberVO = memberService.usernameSelect(memberVO);
		mv.setViewName("member/common/checkId");
		mv.addObject("checkId", memberVO);
		return mv;
	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("findId")
	public String findId() {
		return "member/find_id";
	}
}

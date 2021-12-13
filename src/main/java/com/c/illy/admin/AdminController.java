package com.c.illy.admin;

import java.net.http.HttpRequest;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.c.illy.faq.FaqService;
import com.c.illy.faq.FaqVO;
import com.c.illy.notice.NoticeFileVO;
import com.c.illy.notice.NoticeService;
import com.c.illy.notice.NoticeVO;
import com.c.illy.product.ProductService;
import com.c.illy.product.coffee.CoffeeService;
import com.c.illy.product.coffee.CoffeeVO;
import com.c.illy.product.machine.MachineService;
import com.c.illy.product.machine.MachineVO;
import com.c.illy.qna.QnaService;
import com.c.illy.qna.QnaVO;
import com.c.illy.util.Pager;

@Controller
@RequestMapping("admin")
@Transactional(rollbackFor = Exception.class)
public class AdminController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CoffeeService coffeeService;
	@Autowired
	private MachineService machineService;
	@Autowired
	private NoticeService noticeService; 
	@Autowired
	private FaqService faqService;
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("adIndex")
	public void main() {
	}
	
	@GetMapping("insertCoffee")
	public String insertCoffeePage(Model model, @ModelAttribute CoffeeVO coffeeVO) {
		model.addAttribute("type", "coffee");
		return "admin/insertProduct";
	}
	
	@GetMapping("insertMachine")
	public String insertMachinesPage(Model model, @ModelAttribute MachineVO machineVO) {
		model.addAttribute("type", "machine");
		return "admin/insertProduct";
	}
//	
//	@GetMapping("insertAccessories")
//	public String insertAccessories(Model model, CoffeeVO coffeeVO) {
//		model.addAttribute("type", "Coffee");
//		model.addAttribute("CoffeeVO", coffeeVO);
//		return "admin/insertProduct";
//	}

	@PostMapping("insertMachine")
	public String setInsertMachine(@Valid MachineVO machineVO, BindingResult bindingResult, Model model, MultipartFile[] multipartFiles) throws Exception {
		if (bindingResult.hasErrors()) {
			model.addAttribute("type", "machine");
			return "admin/insertProduct";
		}
		
		productService.setInsertProduct(machineVO, multipartFiles);
		machineService.setInsertProduct(machineVO);
		
		return "redirect:/admin/adIndex";
	}

	@PostMapping("insertCoffee")
	public String setInsertCoffee(@Valid CoffeeVO coffeeVO, BindingResult bindingResult, Model model, MultipartFile[] multipartFiles) throws Exception {
		if (bindingResult.hasErrors()) {
			model.addAttribute("type", "coffee");
			return "admin/insertProduct";
		}
		
		productService.setInsertProduct(coffeeVO, multipartFiles);
		coffeeService.setInsertProduct(coffeeVO);
		
		return "redirect:/admin/adIndex";
	}
	
	
	//--------------------------------다영 추가 
	//----------------------------------------------------------------NOTICE
	//공지사항 리스트 불러오기 
	@GetMapping("board/adNoticeList")
	public ModelAndView getSelectList(Pager pager,ModelAndView mv)throws Exception{
		List<NoticeVO> ar = noticeService.getSelectList(pager);
		List<NoticeVO> arTop=noticeService.getSelectListTop();
		mv.setViewName("admin/board/adNoticeList");
		mv.addObject("List", ar);
		mv.addObject("ListTop", arTop);
		mv.addObject("pager", pager);
		return mv; 	
	}
	 
	//공지사항 삭제 
	@GetMapping("board/deleteNotice")
	public String setDelete(NoticeVO noticeVO)throws Exception{
		noticeService.setDelete(noticeVO);
		return "admin/board/adNoticeList";
	}	
	//글 하나 조회
	@GetMapping("board/adNoticeSelect")
	public ModelAndView noticeSelect(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeVO=noticeService.getSelectOne(noticeVO);
		mv.setViewName("admin/board/adNoticeSelect");
		mv.addObject("noticeVO", noticeVO);
		return mv; 
	}
	
	//공지사항 추가하기(경로매핑) 
	@GetMapping("board/insertNotice")
	public String insertNotice(NoticeVO noticeVO)throws Exception{
		return "admin/board/insertNotice";
	}
	
	//공지사항 추가하기 
	@PostMapping("board/insertNotice")
	public String addNotice(@Valid NoticeVO noticeVO,BindingResult bindingResult,MultipartFile[] multipartFiles)throws Exception{
		if(bindingResult.hasErrors()) {
			return "admin/board/insertNotice";
		}
		noticeService.addNotice(noticeVO, multipartFiles);
		return "admin/board/adNoticeList";
	}
	
	//공지사항 수정하기 
	@GetMapping("board/updateNotice")
	public String noticeUpdate(NoticeVO noticeVO, Model model)throws Exception{
		noticeVO=noticeService.getSelectOne(noticeVO);
		model.addAttribute("noticeVO", noticeVO);
		return "admin/board/updateNotice";
	}
	
	@PostMapping("board/updateNotice")
	public String noticeUpdae(NoticeVO noticeVO)throws Exception{
		int result=noticeService.noticeUpdate(noticeVO);
		return "admin/board/adNoticeSelect?notice_id="+noticeVO.getNotice_id();
	}
	
	//----------------------------------------------------------------FAQ
	//Faq 리스트 불러오기 
	@GetMapping("board/adFaqList")
	public ModelAndView getFaqList(Pager pager,ModelAndView mv)throws Exception{
		/*
		 * List<FaqVO> ar = faqService.getFaqList(pager);
		 * mv.setViewName("board/faqList"); mv.addObject("FList", ar);
		 * mv.addObject("pager", pager);
		 */
		 mv.setViewName("admin/board/adFaqList");
		return mv;
	}
	//Faq 리스트 불러오기_ajax
	@GetMapping("/board/faqTypeList")
	public ModelAndView getFaqTypeList(Pager pager,ModelAndView mv)throws Exception{
		List<FaqVO> ar = faqService.getFaqList(pager); 
		mv.addObject("FList", ar);
		mv.addObject("pager", pager);
		mv.setViewName("/board/faqTypeList");
		return mv;
	}
	
	//Faq 삭제하기 
	@GetMapping("board/faqDelete")
	@ResponseBody
	public void faqDelete(FaqVO faqVO)throws Exception{
		faqService.faqDelete(faqVO);
	}
	
	//Faq추가하기(경로매핑) 
	@GetMapping("board/insertFaq")
	public String addFaq()throws Exception{
		return "admin/board/insertFaq";
	}
	
	//Faq추가하기
	@PostMapping("board/insertFaq")
	public String addFaq(FaqVO faqVo)throws Exception{
		faqService.addFaq(faqVo);
		return "admin/board/adFaqList";
	}
	
	//Faq수정하기(경로매핑) 
	@GetMapping("board/updateFaq")
	public String updateFaq(FaqVO faqVO,Model model)throws Exception{
		faqVO=faqService.faqSelectOne(faqVO);
		model.addAttribute("faqVO", faqVO);
		return "admin/board/updateFaq";
	}
	
	//Faq 수정하기(데이터 저장)
	@PostMapping("board/updateFaq")
	public String updateFaq(FaqVO faqVO)throws Exception{
		faqService.faqUpdate(faqVO);
		return "admin/board/adFaqList";
	}
	
	
	//----------------------------------------------------------------QNA
	//qna list 불러오기 
	@GetMapping("board/adQnaList")
	public ModelAndView getQnaList(Pager pager,ModelAndView mv)throws Exception{
		List<QnaVO> ar = qnaService.getAdQnaList(pager);
		
		mv.setViewName("admin/board/adQnaList");
		mv.addObject("pager", pager);
		mv.addObject("QList", ar);
		return mv;
	}
	
	
	
	
	
	
}

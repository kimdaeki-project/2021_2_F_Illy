package com.c.illy.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.c.illy.member.MemberVO;

@Controller
@RequestMapping("/address/**")
public class AddressController {

	@Autowired
	private AddressService addressService;
	
	//나의 배송지 list
	@GetMapping("myAddressList") 
	public ModelAndView getMyAddressList(MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<AddressVO> ar2 = addressService.getAddressList(memberVO);
		
		mv.addObject("addressList", ar2);
		mv.setViewName("address/addressAjax");
		return mv;
	}
	
	//나의 배송지 삭제하기
	@RequestMapping("myAddressDel")
	@ResponseBody
	public ModelAndView setMyAddressDelete(AddressVO addressVO, MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = addressService.setMyAddressDelete(addressVO);
		
		List<AddressVO> ar2 = addressService.getAddressList(memberVO);
		
		mv.addObject("addressList", ar2);
		mv.setViewName("address/addressAjax");
		return mv;
	}
	
	//나의 배송지 수정하기
	@GetMapping("myAddressUpdate")
	public ModelAndView setMyAddressUpdate(AddressVO addressVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("addressVO", addressVO);
		mv.setViewName("address/addressUpdateAjax");
		return mv;
	}
	@PostMapping("myAddressUpdate")
	public ModelAndView setMyAddressUpdate(AddressVO addressVO, MemberVO memberVO) throws Exception {
		int result = addressService.setMyAddressUpdate(addressVO);
		
		ModelAndView mv = new ModelAndView();
		System.out.println(memberVO.getMember_id());
		List<AddressVO> ar2 = addressService.getAddressList(memberVO);
		mv.addObject("addressList", ar2);
		mv.setViewName("address/addressAjax");
		return mv;
	}
	
	//update시 기본배송지 수정
	@PostMapping("myDefaultAddressUpdate")
	public ModelAndView setMyDefaultAddressUpdate(AddressVO addressVO, MemberVO memberVO) throws Exception {
		
		  int result = addressService.setMyDefaultAddressInsert(addressVO);  //기존 기본배송지 일반배송지로 변경
		  result = addressService.setMyAddressUpdate(addressVO);
		 
		ModelAndView mv = new ModelAndView();
		
		List<AddressVO> ar2 = addressService.getAddressList(memberVO);
		mv.addObject("addressList", ar2);
		mv.setViewName("address/addressAjax");
		return mv;
	}
	
	
	
	//나의 배송지 추가하기
	@RequestMapping("myAddressInsert")
	@ResponseBody
	public ModelAndView setMyAddressInsert(ModelAndView mv, AddressVO addressVO) throws Exception {
		mv.addObject("addressVO", addressVO);
		mv.setViewName("address/addressInsertAjax");
		return mv;
	}
	
	@PostMapping("myAddressInsert")
	public ModelAndView setMyAddressInsert(AddressVO addressVO, MemberVO memberVO) throws Exception {
		int result = addressService.setPaymentAddress(addressVO);
		
		ModelAndView mv = new ModelAndView();
		
		List<AddressVO> ar2 = addressService.getAddressList(memberVO);
		mv.addObject("addressList", ar2);
		mv.setViewName("address/addressAjax");
		return mv;
	}
	
	//insert시 기본배송지 수정
	@PostMapping("myDefaultAddressInsert")
	public ModelAndView setMyDefaultAddressInsert(AddressVO addressVO, MemberVO memberVO) throws Exception {
		int result = addressService.setMyDefaultAddressInsert(addressVO); //기존 기본배송지 일반배송지로 변경
		result = addressService.setPaymentAddress(addressVO);
		
		ModelAndView mv = new ModelAndView();
		
		List<AddressVO> ar2 = addressService.getAddressList(memberVO);
		mv.addObject("addressList", ar2);
		mv.setViewName("address/addressAjax");
		return mv;
	}
	
}

package com.c.illy.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c.illy.cart.CartProductVO;
import com.c.illy.cart.CartService;
import com.c.illy.member.MemberVO;

@Controller
@RequestMapping("payment")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private CartService cartService;
	
	@GetMapping("paymentList")
	public void getPaymentList(MemberVO memberVO, Model model) throws Exception {
		List<CartProductVO> ar = cartService.getCartListCheck(memberVO);
		
		model.addAttribute("paymentList", ar);
	}
}

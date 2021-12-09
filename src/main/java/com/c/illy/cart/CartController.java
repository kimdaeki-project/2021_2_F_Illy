package com.c.illy.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.illy.member.MemberVO;
import com.c.illy.payment.PaymentVO;
import com.c.illy.util.Pager;

@Controller
@RequestMapping("/cart/**")
public class CartController {

	@Autowired
	private CartService cartService;
	
	
	@RequestMapping("setCart")
	@ResponseBody
	public int setCart(CartVO cartVO, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		int result = cartService.setCart(cartVO, memberVO); // 장바구니에 상품 등록
		
		return result;
	}
	
	//일반구매 - 장바구니 리스트
	@GetMapping("normalBasket")
	public void getNormalBasket(Model model, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		
		model.addAttribute("member", memberVO);
	}
	//정기배송 - 장바구니 리스트
	@GetMapping("regularBasket")
	public void getregularBasket() throws Exception {
		
	}
	
	//ajax_장바구니 리스트
	@GetMapping("cartMain")
	public void getAjaxBasket(Model model, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		
		List<CartProductVO> carts = cartService.getNormalBasket(memberVO);
		
		int count = carts.size();
		
		model.addAttribute("member", memberVO);
		model.addAttribute("count", count);
		model.addAttribute("carts", carts);
	}
	
	
	//수량변경
	@GetMapping("updateCount")
	public String setUpdateNum(CartVO cartVO, Model model, MemberVO memberVO) throws Exception {
		int result = cartService.setUpdateNum(cartVO);
		
		List<CartProductVO> carts = cartService.getNormalBasket(memberVO);
		
		int count = carts.size();
		model.addAttribute("count", count);
		model.addAttribute("carts", carts);
		
		return "cart/cartMain";
	}
	
	//선택상품 삭제
	@GetMapping("setDelete")
	public String setDelete(HttpServletRequest request, Model model, MemberVO memberVO) throws Exception {
		
		String [] cart_id = request.getParameterValues("delArray");
		
		for(int i=0; i<cart_id.length;i++) {
			CartVO cartVO = new CartVO();
			cartVO.setCart_id(Integer.parseInt(cart_id[i]));
			int result = cartService.setDelete(cartVO);
		}
		
		List<CartProductVO> carts = cartService.getNormalBasket(memberVO);
		
		int count = carts.size();
		model.addAttribute("count", count);
		model.addAttribute("carts", carts);
		
		return "cart/cartMain";
	}
	
	//전체상품선택
	@GetMapping("setCheckAll")
	public String setCheckAll(CartVO cartVO, Model model, MemberVO memberVO) throws Exception {
		cartService.setCheckAll(cartVO);
		
		model.addAttribute("carts", cartService.getNormalBasket(memberVO));
		model.addAttribute("count", cartService.getNormalBasket(memberVO).size());
		
		return "cart/normalBasket";
	}
	
	//상품개별선택
	@GetMapping("setCheckOne")
	public String setCheckOne(CartVO cartVO, Model model, MemberVO memberVO) throws Exception {
		cartService.setCheckOne(cartVO);
		
		model.addAttribute("carts", cartService.getNormalBasket(memberVO));
		model.addAttribute("count", cartService.getNormalBasket(memberVO).size());
		
		return "cart/normalBasket";
	}
	
	//주문취소 - point 감소, 쿠폰사용 취소
	@GetMapping("setPaymentCancel")
	public String setPaymentCancel(@AuthenticationPrincipal MemberVO memberVO, Model model, PaymentVO paymentVO, CartVO cartVO, Pager pager) throws Exception {
		int result = cartService.setPaymentCancel(paymentVO, memberVO);
		
		List<PaymentVO> list = cartService.getMyPageOrderPager(paymentVO, cartVO, pager);
					
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "member/myPageOrder/myPageOrderAjax";
	}
	
	//환불 - point 감소, point 감소, 쿠폰사용 취소
	@GetMapping("setPaymentRefund")
	public String setPaymentRefund(@AuthenticationPrincipal MemberVO memberVO, Model model, PaymentVO paymentVO, CartVO cartVO, Pager pager) throws Exception {
		int result = cartService.setPaymentRefund(paymentVO, memberVO);
		
		List<PaymentVO> list = cartService.getMyPageOrderPager(paymentVO, cartVO, pager);
					
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		return "member/myPageOrder/myPageOrderAjax";
	}
	
	//주문취소 - point 감소, 쿠폰사용 취소
	@RequestMapping("setPaymentCancelDetail")
	@ResponseBody
	public String setPaymentCancelDetail(@AuthenticationPrincipal MemberVO memberVO, Model model, PaymentVO paymentVO) throws Exception {
		int result = cartService.setPaymentCancel(paymentVO, memberVO);
		
		return "주문취소가 정상처리 되었습니다.";
	}
	
	//환불 - point 감소, point 감소, 쿠폰사용 취소
	@RequestMapping("setPaymentRefundDetail")
	@ResponseBody
	public String setPaymentRefundDetail(@AuthenticationPrincipal MemberVO memberVO, Model model, PaymentVO paymentVO) throws Exception {
		int result = cartService.setPaymentRefund(paymentVO, memberVO);
		
		return "환불처리가 정상처리 되었습니다.";
	}
}

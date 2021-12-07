package com.c.illy.payment;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.c.illy.address.AddressService;
import com.c.illy.address.AddressVO;
import com.c.illy.cart.CartProductVO;
import com.c.illy.cart.CartService;
import com.c.illy.coupon.CouponService;
import com.c.illy.coupon.CouponVO;
import com.c.illy.member.MemberService;
import com.c.illy.member.MemberVO;
import com.c.illy.product.ProductService;
import com.c.illy.product.ProductVO;

@Controller
@RequestMapping("/payment/**")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private ProductService productService;
	
	
	@GetMapping("paymentList")
	public void getPaymentList(@AuthenticationPrincipal MemberVO memberVO, Model model) throws Exception {
		couponService.setDeadlineState(); //쿠폰상태 - 사용기간만료
		
		List<CartProductVO> ar = cartService.getCartListCheck(memberVO); //상품List
		List<CouponVO> coupon = couponService.getCouponList(memberVO); //modal - 쿠폰적용
		List<AddressVO> ar2 = addressService.getAddressList(memberVO); //modal _ 배송지관리
		AddressVO addressVO = addressService.getAddressLatest(memberVO); //최근배송지
		AddressVO addressVO2 = addressService.getDefaultAddress(memberVO); //기본배송지
		AddressVO addressVO3 = addressService.getJoinAddress(memberVO); //내 정보에 있는 주소
		
		model.addAttribute("addressJoin", addressVO3);
		model.addAttribute("addressDefault", addressVO2);
		model.addAttribute("addressVO", addressVO);
		model.addAttribute("memberVO", memberService.usernameSelect(memberVO));
		model.addAttribute("paymentList", ar);
		model.addAttribute("addressList", ar2);
		model.addAttribute("coupon", coupon);
	}
	
	@RequestMapping("insertPayment")
	@ResponseBody
	public Integer setPaymentInsert(CouponVO couponVO, PaymentVO paymentVO, MemberVO memberVO, Model model, AddressVO addressVO) throws Exception {
		
		addressVO.setMember_id(paymentVO.getMember_id());
		int result = addressService.setPaymentAddress(addressVO); //배송받을 주소 insert
		
		addressVO = addressService.getAddressOne();
		paymentVO.setAddress_id(addressVO.getAddress_id());
		result = paymentService.setPayment(paymentVO); //결제완료
		
		paymentVO = paymentService.getPaymentOne();
		
		result = cartService.setPaymentID(paymentVO); //결제상태 update
		result = memberService.setAddBean(memberVO); //결제 후 포인트 적립
		
		if(couponVO.getCoupon_id() != 0) {
			//쿠폰 사용 시 쿠폰 상태 update
			couponVO.setMember_id(paymentVO.getMember_id());
			result = couponService.setUseState(couponVO);
		}
		
		return paymentVO.getPayment_id();
	}
	
	@GetMapping("paymentEnd")
	public void getPaymentEnd(Model model, PaymentVO paymentVO) throws Exception {

		List<CartProductVO> ar = cartService.getPaymentCart(paymentVO); //결제완료 상품 list
		
		model.addAttribute("cartList", ar);
		model.addAttribute("addressVO", addressService.getAddressOne());
		model.addAttribute("paymentVO", paymentService.getPaymentOne());
	}
	
	@GetMapping("naverpay")
	public void naverpayPopup(Model model, ProductVO productVO, Integer cnt) throws Exception {
		model.addAttribute("productVO", productService.getSelectProductOne(productVO));
		model.addAttribute("cnt", cnt);
	}
	@GetMapping("naverpayResultTest")
	public void naverpayResultTest(String paymentId) throws Exception {
		HttpURLConnection httpURLConnection = null;
//		URL url = "https://dev.apis.naver.com/naverpay-partner/naverpay/payments/v2/apply/payment";
		System.out.println(paymentId);
	}
}

package com.c.illy.cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberRepository;
import com.c.illy.member.MemberVO;
import com.c.illy.payment.PaymentVO;
import com.c.illy.util.Pager;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private MemberRepository memberRepository;

	public List<CartProductVO> getNormalBasket(MemberVO memberVO) throws Exception {
		return cartRepository.getNormalBasket(memberVO);
	}
	
	public List<CartProductVO> getDirectPayment(MemberVO memberVO) throws Exception {
		return cartRepository.getDirectPayment(memberVO);
	}
	
	public List<PaymentVO> getMyPageOrderPager(PaymentVO paymentVO, CartVO cartVO, Pager pager) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment", paymentVO);
		map.put("cart", cartVO);
		
		pager.setPerPage(10);
		pager.makeRow();

		Long totalCount = cartRepository.getMyPageOrderCount(map);
		pager.makeNum(totalCount);

		map.put("pager", pager);
		System.out.println("========");
		System.out.println("member_id: " + paymentVO.getMember_id());
		System.out.println("pn: " + pager.getPn());
		System.out.println("totalCount: " + totalCount);

		return cartRepository.getMyPageOrderPager(map);
	}
	
	public Long getMyPageOrderCount(PaymentVO paymentVO, CartVO cartVO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("payment", paymentVO);
		map.put("cart", cartVO);

		return cartRepository.getMyPageOrderCount(map);
	}
	
	public PaymentVO getMyPageOrderDetail(PaymentVO paymentVO) throws Exception {
		return cartRepository.getMyPageOrderDetail(paymentVO);
	}

	public List<CartProductVO> getCartListCheck(MemberVO memberVO) throws Exception {

		return cartRepository.getCartListCheck(memberVO);
	}

	public List<CartProductVO> getPaymentCart(PaymentVO paymentVO) throws Exception {
		return cartRepository.getPaymentCart(paymentVO);
	}

	public int setUpdateNum(CartVO cartVO) throws Exception {
		return cartRepository.setCountUpdate(cartVO);
	}

	public int setDelete(CartVO cartVO) throws Exception {
		return cartRepository.setDelete(cartVO);
	}

	public int setCheckAll(CartVO cartVO) throws Exception {
		return cartRepository.setCheckAll(cartVO);
	}

	public int setPaymentID(PaymentVO paymentVO, CartVO cartVO) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment", paymentVO);
		map.put("cart", cartVO);
		
		System.out.println("========");
		System.out.println("cart_state: " + cartVO.getCart_state()+", member_id: "+paymentVO.getMember_id()+", payment_id: "+paymentVO.getPayment_id());

		return cartRepository.setPaymentID(map);
	}

	public int setCheckOne(CartVO cartVO) throws Exception {
		return cartRepository.setCheckOne(cartVO);
	}
	
	public int setPaymentDelivery(PaymentVO paymentVO) throws Exception {
		return cartRepository.setPaymentDelivery(paymentVO);
	}

	public int setPaymentDone(PaymentVO paymentVO) throws Exception {
		return cartRepository.setPaymentDone(paymentVO);
	}

	public int setPaymentCancel(PaymentVO paymentVO, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		memberVO = memberRepository.getSelect(memberVO);
		Integer point = memberVO.getMember_point() - Integer.parseInt(paymentVO.getPayment_add_point()); //구매할 때 적립받은 포인트 차감
		memberVO.setMember_point(point);
		memberRepository.setAddBean(memberVO); //포인트 차감 후 update
		
		return cartRepository.setPaymentCancel(paymentVO);
	}

	public int setPaymentRefund(PaymentVO paymentVO, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		memberVO = memberRepository.getSelect(memberVO);
		Integer point = memberVO.getMember_point() - Integer.parseInt(paymentVO.getPayment_add_point()); //구매할 때 적립받은 포인트 차감
		memberVO.setMember_point(point);
		memberRepository.setAddBean(memberVO); //포인트 차감 후 update
		
		return cartRepository.setPaymentRefund(paymentVO);
	}
	
	public int setPaymentCart(CartVO cartVO, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		if(cartVO.getMember_id() == null) {
			cartVO.setMember_id(memberVO.getMember_id());
		}
		return cartRepository.setPaymentCart(cartVO);
	}
	
	public int setDirectPayment(MemberVO memberVO) throws Exception {
		return cartRepository.setDirectPayment(memberVO);
	}
}

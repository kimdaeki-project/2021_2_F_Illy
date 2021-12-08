package com.c.illy.cart;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.member.MemberVO;
import com.c.illy.payment.PaymentVO;

@Mapper
public interface CartRepository {
	//장바구니 담기
	public int setCart(CartVO cartVO) throws Exception;
	
	//일반배송 장바구니 리스트
	public List<CartProductVO> getNormalBasket(MemberVO memberVO) throws Exception;
	
	//주문/배송 조회 리스트 - Pager
	public List<PaymentVO> getMyPageOrderPager(HashMap<String, Object> map) throws Exception;
	
	//바로구매 통한 구매상품 리스트 출력
	public List<CartProductVO> getDirectPayment(MemberVO memberVO) throws Exception;
	
	// 주문/배송 조회 리스트 count
	public Long getMyPageOrderCount(HashMap<String, Object> map) throws Exception;
	
	// 주문/배송 상세 리스트
	public PaymentVO getMyPageOrderDetail(PaymentVO paymentVO) throws Exception;
	
	//선택상품 주문
	public List<CartProductVO> getCartListCheck(MemberVO memberVO) throws Exception;
	
	//결제완료 상품
	public List<CartProductVO> getPaymentCart(PaymentVO paymentVO) throws Exception;
	
	//수량변경
	public int setCountUpdate(CartVO cartVO) throws Exception;
	
	//선택삭제
	public int setDelete(CartVO cartVO) throws Exception;
	
	//전체선택
	public int setCheckAll(CartVO cartVO) throws Exception;
	
	//상품선택
	public int setCheckOne(CartVO cartVO) throws Exception;
	
	//결제상태 변경 - 주문완료
	public int setPaymentID(HashMap<String, Object> map) throws Exception;
	
	//결제상태 변경 - 주문취소
	public int setPaymentCancel(PaymentVO paymentVO) throws Exception;
	
	//주문상태 변경 - 배송중
	public int setPaymentDelivery(PaymentVO paymentVO) throws Exception;
	
	//주문상태 변경 - 배송완료
	public int setPaymentDone(PaymentVO paymentVO) throws Exception;

	//주문상태 변경 - 환불
	public int setPaymentRefund(PaymentVO paymentVO) throws Exception;
	
	//바로구매 담기
	public int setPaymentCart(CartVO cartVO) throws Exception;
	
	//바로구매 cart_state 변경
	public int setDirectPayment(MemberVO memberVO) throws Exception;
}

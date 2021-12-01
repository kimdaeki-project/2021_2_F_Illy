package com.c.illy.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.member.MemberVO;
import com.c.illy.payment.PaymentVO;

@Mapper
public interface CartRepository {
	
	//일반배송 장바구니 리스트
	public List<CartProductVO> getNormalBasket(MemberVO memberVO) throws Exception;
	
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
	
	//결제상태 변경
	public int setPaymentID(PaymentVO paymentVO) throws Exception;

}

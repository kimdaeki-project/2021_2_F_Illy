package com.c.illy.payment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.cart.CartProductVO;

@Mapper
public interface PaymentRepository {

	public int setPayment(PaymentVO paymentVO) throws Exception;
	
	public PaymentVO getPaymentOne() throws Exception;
	
	//결제완료 상품
	public List<CartProductVO> getPaymentCart(PaymentVO paymentVO) throws Exception;

	//주문/배송 조회 리스트 - Pager
	public List<PaymentVO> getMyPageOrderPager(HashMap<String, Object> map) throws Exception;
	
	// 주문/배송 조회 리스트 count
	public Long getMyPageOrderCount(HashMap<String, Object> map) throws Exception;
	
	// 주문/배송 상세 리스트
	public PaymentVO getMyPageOrderDetail(PaymentVO paymentVO) throws Exception;
}

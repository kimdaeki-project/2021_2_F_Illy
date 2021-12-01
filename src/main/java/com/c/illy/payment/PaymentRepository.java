package com.c.illy.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.cart.CartProductVO;
import com.c.illy.member.MemberVO;

@Mapper
public interface PaymentRepository {

	public int setPayment(PaymentVO paymentVO) throws Exception;
	
	public PaymentVO getPaymentOne() throws Exception;
}

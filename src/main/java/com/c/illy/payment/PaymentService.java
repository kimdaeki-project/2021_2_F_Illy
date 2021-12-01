package com.c.illy.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.cart.CartProductVO;
import com.c.illy.member.MemberVO;

@Service
public class PaymentService {

	@Autowired
	private PaymentRepository paymentRepository;
	
	public int setPayment(PaymentVO paymentVO) throws Exception {
		return paymentRepository.setPayment(paymentVO);
	}
	
	public PaymentVO getPaymentOne() throws Exception {
		return paymentRepository.getPaymentOne();
	}
	
}

package com.c.illy.payment;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.cart.CartProductVO;
import com.c.illy.cart.CartVO;
import com.c.illy.util.Pager;

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
	
	public List<CartProductVO> getPaymentCart(PaymentVO paymentVO) throws Exception {
		return paymentRepository.getPaymentCart(paymentVO);
	}

	public List<PaymentVO> getMyPageOrderPager(PaymentVO paymentVO, CartVO cartVO, Pager pager) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment", paymentVO);
		map.put("cart", cartVO);
		
		pager.setPerPage(10);
		pager.makeRow();

		Long totalCount = paymentRepository.getMyPageOrderCount(map);
		pager.makeNum(totalCount);

		map.put("pager", pager);
		System.out.println("========");
		System.out.println("member_id: " + paymentVO.getMember_id());
		System.out.println("pn: " + pager.getPn());
		System.out.println("totalCount: " + totalCount);

		return paymentRepository.getMyPageOrderPager(map);
	}
	
	public Long getMyPageOrderCount(PaymentVO paymentVO, CartVO cartVO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("payment", paymentVO);
		map.put("cart", cartVO);

		return paymentRepository.getMyPageOrderCount(map);
	}
	
	public PaymentVO getMyPageOrderDetail(PaymentVO paymentVO) throws Exception {
		return paymentRepository.getMyPageOrderDetail(paymentVO);
	}
}

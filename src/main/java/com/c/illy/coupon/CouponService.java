package com.c.illy.coupon;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberVO;
import com.c.illy.payment.PaymentVO;
import com.c.illy.util.Pager;

@Service
public class CouponService {
	
	@Autowired
	private CouponRepository couponRepository;
	
	public List<CouponVO> getCouponList(MemberVO memberVO) throws Exception {
		return couponRepository.getCouponList(memberVO);
	}
	
	public List<CouponVO> getCouponPager(Pager pager, CouponVO couponVO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("coupon", couponVO);
		
		pager.setPerPage(10);
		pager.makeRow();

		Long totalCount = couponRepository.getCouponCount(map);
		pager.makeNum(totalCount);

		map.put("pager", pager);
		System.out.println("========");
		System.out.println("member_id: " + couponVO.getMember_id());
		System.out.println("pn: " + pager.getPn());
		System.out.println("totalCount: " + totalCount);
		System.out.println("coupon_state: "+couponVO.getCoupon_state());
		
		return couponRepository.getCouponPager(map);
	}
	
	public Long getCouponCount(CouponVO couponVO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("coupon", couponVO);
		return couponRepository.getCouponCount(map);
	}
	
	public int setUseState(CouponVO couponVO) throws Exception {
		return couponRepository.setUseState(couponVO);
	}
	
	public int setDeadlineState() throws Exception {
		return couponRepository.setDeadlineState();
	}
}

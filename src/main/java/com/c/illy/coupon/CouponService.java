package com.c.illy.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberVO;

@Service
public class CouponService {
	
	@Autowired
	private CouponRepository couponRepository;
	
	public List<CouponVO> getCouponList(MemberVO memberVO) throws Exception {
		return couponRepository.getCouponList(memberVO);
	}
	
	public int setUseState(CouponVO couponVO) throws Exception {
		return couponRepository.setUseState(couponVO);
	}
}

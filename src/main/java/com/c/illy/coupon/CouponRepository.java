package com.c.illy.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.member.MemberVO;

@Mapper
public interface CouponRepository {

	public List<CouponVO> getCouponList(MemberVO memberVO) throws Exception;
	
	public int setUseState(CouponVO couponVO) throws Exception;
}

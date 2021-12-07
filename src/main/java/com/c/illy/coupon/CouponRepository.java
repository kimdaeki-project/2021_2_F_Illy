package com.c.illy.coupon;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.member.MemberVO;

@Mapper
public interface CouponRepository {

	public List<CouponVO> getCouponList(MemberVO memberVO) throws Exception;
	
	//my page 쿠폰 불러오기
	public List<CouponVO> getCouponPager(HashMap<String, Object> map) throws Exception;
	
	public Long getCouponCount(HashMap<String, Object> map) throws Exception;
	
	public int setUseState(CouponVO couponVO) throws Exception;
	
	//쿠폰상태 변경 - 사용만료
	public int setDeadlineState() throws Exception;
}

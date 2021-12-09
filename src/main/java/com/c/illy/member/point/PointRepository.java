package com.c.illy.member.point;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.member.MemberVO;

@Mapper
public interface PointRepository {

	//포인트 내역 적립
	public int setPointHistory(PointVO pointVO) throws Exception;
	
	//포인트 내역 출력
	public List<PointVO> getPointHistory(MemberVO memberVO) throws Exception;
}

package com.c.illy.member.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberVO;

@Service
public class PointService {

	@Autowired
	private PointRepository pointRepository;
	
	public int setPointHistory(PointVO pointVO) throws Exception {
		return pointRepository.setPointHistory(pointVO);
	}
	
	public List<PointVO> getPointHistory(MemberVO memberVO) throws Exception {
		return pointRepository.getPointHistory(memberVO);
	}
}

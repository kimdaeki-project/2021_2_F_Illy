package com.c.illy.member.point;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberVO;
import com.c.illy.util.Pager;

@Service
public class PointService {

	@Autowired
	private PointRepository pointRepository;
	
	public List<PointVO> getPointHistory(MemberVO memberVO, PointVO pointVO, Pager pager) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("point", pointVO);
		
		pager.setPerPage(10);
		pager.makeRow();

		Long totalCount = pointRepository.getPointHistoryCount(map);
		pager.makeNum(totalCount);

		map.put("pager", pager);
		
		return pointRepository.getPointHistory(map);
	}
	
	public Long getPointHistoryCount(PointVO pointVO) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("point", pointVO);
		
		return pointRepository.getPointHistoryCount(map);
	}
}

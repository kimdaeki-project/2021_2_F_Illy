package com.c.illy.wish;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberVO;
import com.c.illy.util.Pager;

@Service
public class WishService {

	@Autowired
	private WishRepository wishRepository;
	
	public List<WishVO> getWishList(Pager pager, MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getMember_id());
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member", memberVO);
		
		pager.setPerPage(10);
		pager.makeRow();

		Long totalCount = wishRepository.getWishListCount(memberVO);
		pager.makeNum(totalCount);

		map.put("pager", pager);
		
		return wishRepository.getWishList(map);
	}
	
	public int setWish(WishVO wishVO) throws Exception {
		
		return wishRepository.setWish(wishVO);
	}
	
	public int setCnt(WishVO wishVO) throws Exception {
		return wishRepository.setCnt(wishVO);
	}
	
	public int setDelete(WishVO wishVO) throws Exception {
		return wishRepository.setDelete(wishVO);
	}
}

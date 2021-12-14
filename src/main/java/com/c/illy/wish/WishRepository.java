package com.c.illy.wish;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.member.MemberVO;

@Mapper
public interface WishRepository {
	
	//찜리스트
	public List<WishVO> getWishList(HashMap<String, Object> map) throws Exception;
	
	//찜리스트 카운트
	public Long getWishListCount(MemberVO memberVO) throws Exception;
	

	//찜하기
	public int setWish(WishVO wishVO) throws Exception;
	
	//찜리스트 수량변경
	public int setCnt(WishVO wishVO) throws Exception;
	
	//찜리스트 삭제
	public int setDelete(WishVO wishVO) throws Exception;
}

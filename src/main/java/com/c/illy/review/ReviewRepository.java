package com.c.illy.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.util.Pager;

@Mapper
public interface ReviewRepository {
	//전체 리뷰 불러오기
	public List<ReviewVO> getReviewList(Pager pager)throws Exception;
	
	//리뷰 토탈 카운트 
	public Long reviewTotalCount(Pager pager)throws Exception;
	
	//리뷰 하나 조회하기 
	public List<ReviewVO> reviewSelectOne(Integer cart_id)throws Exception;
	
	//리뷰작성하기 
	public int reviewInsert(ReviewVO reviewVO)throws Exception;
	
	//파일 첨부 
	public int reviewFileInsert(ReviewFileVO reviewFileVO)throws Exception;
	
	//리뷰 수정하기 
	public int reviewUpdate(ReviewVO reviewVO)throws Exception;
	
	//리뷰 삭제하기 
	public int reviewDelete(ReviewVO reviewVO)throws Exception;
	
}

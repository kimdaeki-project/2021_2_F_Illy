package com.c.illy.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewRepository {

	public List<ReviewVO> getReviewList()throws Exception;
	
	//리뷰작성하기 
	public int reviewInsert(ReviewVO reviewVO)throws Exception;
	
	//파일 첨부 
	public int reviewFileInsert(ReviewFileVO reviewFileVO)throws Exception;
	
	//리뷰 수정하기 
	public int reviewUpdate(ReviewVO reviewVO)throws Exception;
	
	//리뷰 삭제하기 
	public int reviewDelete(ReviewVO reviewVO)throws Exception;
	
}

package com.c.illy.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewRepository {

	public List<ReviewVO> getReviewList()throws Exception;
	
}

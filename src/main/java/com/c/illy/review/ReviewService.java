package com.c.illy.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;
	
	public List<ReviewVO> getReviewList()throws Exception{
		return reviewRepository.getReviewList();
	}
	
	
	
	
}

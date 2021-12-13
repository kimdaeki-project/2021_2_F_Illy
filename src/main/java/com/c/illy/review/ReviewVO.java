package com.c.illy.review;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private Integer review_id; 
	private Integer review_star;
	private String review_title; 
	private String review_contents; 
	private Integer payment_id; 
	private Date review_regDate;
	
	
}

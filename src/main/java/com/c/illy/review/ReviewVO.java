package com.c.illy.review;

import java.sql.Date;
import java.util.List;

import com.c.illy.cart.CartVO;
import com.c.illy.member.MemberVO;
import com.c.illy.product.ProductVO;

import lombok.Data;

@Data
public class ReviewVO {

	private Integer review_id; 
	private Integer review_star;
	private String review_title; 
	private String review_contents; 
	private Integer cart_id; 
	private Date review_regDate;
	
	private List<ReviewFileVO> fileList; 
	
	private CartVO cartVO;
	private ProductVO productVO;
	private MemberVO memberVO;
}
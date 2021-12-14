package com.c.illy.cart;

import java.util.List;

import com.c.illy.member.MemberVO;
import com.c.illy.product.ProductVO;

import lombok.Data;

@Data
public class CartProductVO {
	
	private Integer cart_id;
	private Integer member_id;
	private Integer product_id;
	private Integer payment_id;
	private Integer cart_cnt;
	private String cart_state;
	private String product_name;
	private Integer product_price;
	private String productFile_name;
	private String product_categoryCode;	//(커피 : 001, 머신 : 002)
	
}

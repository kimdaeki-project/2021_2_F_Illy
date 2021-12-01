package com.c.illy.cart;

import java.util.List;

import com.c.illy.member.MemberVO;
import com.c.illy.product.ProductVO;

import lombok.Data;

@Data
public class CartProductVO {
	
	private Integer cart_id;
	private Integer member_id;
	private String product_id;
	private Integer cart_cnt;
	private String cart_state;
	private String product_name;
	private Integer product_price;
	private String productFile_name;
	
}

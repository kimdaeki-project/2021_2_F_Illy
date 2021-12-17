package com.c.illy.cart;

import java.util.List;

import com.c.illy.member.MemberVO;
import com.c.illy.product.ProductVO;

import lombok.Data;

@Data
public class CartVO {
	
	private Integer cart_id;
	private Integer member_id;
	private Integer product_id;
	private Integer cart_cnt;
	private String cart_state;
	private Integer payment_id;
	private Integer cart_review_state;

	
	public String getCart_state() {
		if(this.cart_state==null||this.cart_state.equals("")) {
			this.cart_state=null;
		}
		return this.cart_state;
	}
}

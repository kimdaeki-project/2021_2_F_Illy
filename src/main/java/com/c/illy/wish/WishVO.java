package com.c.illy.wish;

import com.c.illy.product.ProductFileVO;
import com.c.illy.product.ProductVO;

import lombok.Data;

@Data
public class WishVO {

	
	private Integer wish_id;
	private Integer member_id;
	private Integer product_id;
	private Integer wish_cnt;
	
	private ProductVO productVO;
	private ProductFileVO productFileVO;
}

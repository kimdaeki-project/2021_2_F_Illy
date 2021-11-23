package com.c.illy.product;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private int product_id;
	private String product_name;
	private int product_price;
	private String product_type;
	private Date product_regDate;
}

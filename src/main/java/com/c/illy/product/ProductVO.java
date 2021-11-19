package com.c.illy.product;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private Integer			product_id;
    private String			product_name; //상품명
    private Integer			product_price; //가격
    private String			product_type; //식품유형 or 재질 or 소재
    private Date			product_regDate; //등록일

    private String			product_manufacturer; //제조사
    private String			product_origin; //원산지 or 제조국
    private String			product_importer; //수입판매원

}

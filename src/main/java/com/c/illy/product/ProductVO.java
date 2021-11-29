package com.c.illy.product;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class ProductVO {

	private Integer			product_id;
	@NotBlank(message = "필수 항목 입니다")
    private String			product_name;			//상품명
	@NotNull(message = "필수 항목 입니다")
    private Integer			product_price;			//가격
    private String			product_detail;			//상품상세정보
	@NotBlank(message = "필수 항목 입니다")
    private String			product_type;			//식품유형 or 재질 or 소재
    private Date			product_regDate;		//등록일

	@NotBlank(message = "필수 항목 입니다")
    private String			product_manufacturer;	//제조사
	@NotBlank(message = "필수 항목 입니다")
    private String			product_origin;			//원산지 or 제조국
	@NotBlank(message = "필수 항목 입니다")
    private String			product_importer;		//수입판매원
	
	private List<ProductFileVO> productFileVOs;

}

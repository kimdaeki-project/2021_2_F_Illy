package com.c.illy.product.coffee;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.c.illy.product.ProductVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CoffeeVO extends ProductVO {
	
	@NotBlank(message = "필수 항목 입니다")
	private String			coffee_material;	//원재료명 및 함량
	@NotBlank(message = "필수 항목 입니다")
    private String			coffee_capacity;	//용량
	@NotNull(message = "필수 항목 입니다")
    private Double			coffee_caffeine;	//카페인함량
	
	private String			coffee_shelfLife;	//유통기한	
	private Integer			coffee_portion;		//캡슐커피, 스틱커피 개수
	private String			coffee_stickSize;	//스틱커피 사이즈
    
}

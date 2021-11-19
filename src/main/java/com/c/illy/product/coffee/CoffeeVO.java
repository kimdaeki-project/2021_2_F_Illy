package com.c.illy.product.coffee;

import com.c.illy.product.ProductVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CoffeeVO extends ProductVO {
	
	private String			coffee_type; //cpa, bean, grind, stick
	private String			coffee_material; //원재료명 및 함량
    private Long			coffee_capacity; //용량
    private String			coffee_shelfLife; //유통기한
    private String			coffee_caffeine; //카페인함량    
    
}

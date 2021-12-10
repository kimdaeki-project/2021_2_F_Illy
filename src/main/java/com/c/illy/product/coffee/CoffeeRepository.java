package com.c.illy.product.coffee;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.product.ProductRepository;
import com.c.illy.product.ProductVO;

@Mapper
public interface CoffeeRepository extends ProductRepository {
	
	public CoffeeVO getSelectCoffeeOne(ProductVO productVO) throws Exception;

}

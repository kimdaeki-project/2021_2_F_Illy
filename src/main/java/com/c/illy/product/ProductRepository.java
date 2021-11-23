package com.c.illy.product;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductRepository {
	
	public int setInsertProduct(ProductVO productVO) throws Exception;

}

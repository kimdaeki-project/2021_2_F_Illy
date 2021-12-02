package com.c.illy.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductRepository {
	
	public int setInsertProduct(ProductVO productVO) throws Exception;
	public int setInsertProductFile(ProductFileVO productFileVO) throws Exception;
	public List<ProductVO> getListProduct(String cateCd) throws Exception;
	public List<CategoryCntVO> getCategoryCnt(String cateCd) throws Exception;

}

package com.c.illy.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductRepository {
	
	public int setInsertProduct(ProductVO productVO) throws Exception;
	public int setInsertProductFile(ProductFileVO productFileVO) throws Exception;
	public List<ProductVO> getListProduct(ProductVO productVO) throws Exception;
	public CategoryCntVO getCategoryAllCnt(ProductVO productVO) throws Exception;
	public List<CategoryCntVO> getCategoryCnt(ProductVO productVO) throws Exception;
	public ProductVO getSelectProductOne(ProductVO productVO) throws Exception;
	public List<ProductFileVO> getSelectProductFileList(ProductVO productVO) throws Exception;

}

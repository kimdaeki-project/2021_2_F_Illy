package com.c.illy.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.util.Pager;

@Mapper
public interface ProductRepository {
	
	public int setInsertProduct(ProductVO productVO) throws Exception;
	public int setInsertProductFile(ProductFileVO productFileVO) throws Exception;
	public int setUpdateProduct(ProductVO productVO) throws Exception;
	public List<ProductVO> getListProduct(Pager pager) throws Exception;
	public Long getTotalCount(ProductVO productVO) throws Exception;
	public CategoryCntVO getCategoryAllCnt(ProductVO productVO) throws Exception;
	public List<CategoryCntVO> getCategoryCnt(ProductVO productVO) throws Exception;
	public ProductVO getSelectProductOne(ProductVO productVO) throws Exception;
	public List<ProductFileVO> getSelectProductFileList(ProductVO productVO) throws Exception;
	public int setDeleteProductFile(String productFile_id) throws Exception;
	public int setupdateProductState(ProductVO productVO) throws Exception;

}

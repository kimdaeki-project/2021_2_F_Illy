package com.c.illy.product.machine;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.product.ProductRepository;
import com.c.illy.product.ProductVO;

@Mapper
public interface MachineRepository extends ProductRepository {
	
	public MachineVO getSelectMachineOne(ProductVO productVO) throws Exception;

}

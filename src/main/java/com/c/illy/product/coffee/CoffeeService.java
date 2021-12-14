package com.c.illy.product.coffee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.product.ProductService;
import com.c.illy.product.ProductVO;

@Service
public class CoffeeService extends ProductService {
	
	@Autowired
	private CoffeeRepository coffeeRepository;
	
	@Override
	public int setInsertProduct(ProductVO productVO) throws Exception {
		return coffeeRepository.setInsertProduct(productVO);
	}	
	@Override
	public int setUpdateProduct(ProductVO productVO) throws Exception {
		return coffeeRepository.setUpdateProduct(productVO);
	}

	public CoffeeVO getSelectCoffeeOne(ProductVO productVO) throws Exception {
		return coffeeRepository.getSelectCoffeeOne(productVO);
	}

}

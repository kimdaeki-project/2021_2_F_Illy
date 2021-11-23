package com.c.illy.product.coffee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.product.ProductService;
import com.c.illy.product.ProductVO;

@Service
public class CoffeeService {
	
	@Autowired
	private CoffeeRepository coffeeRepository;
	
	public int setInsertProduct(ProductVO productVO) throws Exception {
		return coffeeRepository.setInsertProduct(productVO);
	}

}

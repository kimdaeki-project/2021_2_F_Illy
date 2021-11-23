package com.c.illy.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public int setInsertProduct(ProductVO productVO) throws Exception {
		productRepository.setInsertProduct(productVO);
		return 0;		
	};

}

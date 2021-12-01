package com.c.illy.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("list")
	public String list(Model model, String cateCd) throws Exception {
		model.addAttribute("listAllProduct", productService.getListProduct(cateCd));
		model.addAttribute("cateCd", cateCd);
		return "/product/list";
	}

}

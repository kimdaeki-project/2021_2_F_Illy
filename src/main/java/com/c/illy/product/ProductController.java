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
	public String list(Model model, ProductVO productVO) throws Exception {
		model.addAttribute("listAllProduct", productService.getListProduct(productVO));
		model.addAttribute("categoryCnt", productService.getCategoryCnt(productVO));
		model.addAttribute("cateCd", productVO);
		return "/product/list";
	}
	
	@GetMapping("select")
	public String select(Model model, ProductVO productVO) throws Exception {
		model.addAttribute("listAllProduct", productService.getListProduct(productVO));
		model.addAttribute("productVO", productService.getSelectProductOne(productVO));
		model.addAttribute("productFileVOList", productService.getSelectProductFileList(productVO));
		return "/product/select";
	}

}

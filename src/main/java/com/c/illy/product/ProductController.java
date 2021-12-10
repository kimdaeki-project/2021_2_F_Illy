package com.c.illy.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.c.illy.product.coffee.CoffeeService;
import com.c.illy.product.machine.MachineService;

@Controller
@RequestMapping("product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CoffeeService coffeeService;
	@Autowired
	private MachineService machineService;
	
	@GetMapping("list")
	public String list(Model model, ProductVO productVO) throws Exception {
		model.addAttribute("listAllProduct", productService.getListProduct(productVO));
		model.addAttribute("categoryAllCnt", productService.getCategoryAllCnt(productVO));
		model.addAttribute("categoryCnt", productService.getCategoryCnt(productVO));
		model.addAttribute("parameterCateCode", productVO.getProduct_categoryCode());
		return "/product/list";
	}
	
	@GetMapping("select")
	public String select(Model model, ProductVO productVO) throws Exception {
		String categoryCode = productVO.getProduct_categoryCode();
		String prefixCode = categoryCode.substring(0, 3);
		if (prefixCode.equals("001")) {	model.addAttribute("productVO", coffeeService.getSelectCoffeeOne(productVO)); }
		if (prefixCode.equals("002")) {	model.addAttribute("productVO", machineService.getSelectMachineOne(productVO)); }
		
		model.addAttribute("listAllProduct", productService.getListProduct(productVO));
		model.addAttribute("productFileVOList", productService.getSelectProductFileList(productVO));
		return "/product/select";
	}

}

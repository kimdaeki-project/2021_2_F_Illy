package com.c.illy.admin;

import java.io.File;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.c.illy.product.ProductService;
import com.c.illy.product.ProductVO;
import com.c.illy.product.coffee.CoffeeService;
import com.c.illy.product.coffee.CoffeeVO;
import com.c.illy.product.machine.MachineService;
import com.c.illy.product.machine.MachineVO;

@Controller
@RequestMapping("admin")
@Transactional(rollbackFor = Exception.class)
public class AdminController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CoffeeService coffeeService;
	@Autowired
	private MachineService machineService;
	
	@GetMapping("adIndex")
	public void main() {
	}
	
	@GetMapping("list")
	public String list(Model model, ProductVO productVO) throws Exception {
		model.addAttribute("listAllProduct", productService.getListProduct(productVO));
		model.addAttribute("categoryAllCnt", productService.getCategoryAllCnt(productVO));
		model.addAttribute("categoryCnt", productService.getCategoryCnt(productVO));
		model.addAttribute("parameterCateCode", productVO.getProduct_categoryCode());
		return "/admin/adminListProduct";
	}
//━━━━━━━━━━━━━━━━━━━━━━━━━insertCoffee━━━━━━━━━━━━━━━━━━━━━━━━━
	@GetMapping("insertCoffee")
	public String insertCoffeePage(Model model, @ModelAttribute CoffeeVO coffeeVO) throws Exception {
		ProductVO productVO = new ProductVO();
		productVO.setProduct_categoryCode("001");
		model.addAttribute("categoryCnt", productService.getCategoryCnt(productVO));
		model.addAttribute("category", "coffee");
		return "admin/insertProduct";
	}
	@PostMapping("insertCoffee")
	public String setInsertCoffee(@Valid CoffeeVO coffeeVO, BindingResult bindingResult, Model model, MultipartFile[] multipartFiles) throws Exception {
		if (bindingResult.hasErrors()) {
			return insertCoffeePage(model, coffeeVO);
		}
		
		coffeeVO = productService.productDetailReplace(coffeeVO);
		productService.setInsertProduct(coffeeVO, multipartFiles);
		coffeeService.setInsertProduct(coffeeVO);
		
		return "redirect:/admin/list?product_categoryCode=001";
	}
////////////////////////////////////////////////////////////////////////////////

//━━━━━━━━━━━━━━━━━━━━━━━━━insertMachine━━━━━━━━━━━━━━━━━━━━━━━━━
	@GetMapping("insertMachine")
	public String insertMachinesPage(Model model, @ModelAttribute MachineVO machineVO) throws Exception{
		ProductVO productVO = new ProductVO();
		productVO.setProduct_categoryCode("002");
		model.addAttribute("categoryCnt", productService.getCategoryCnt(productVO));
		model.addAttribute("category", "machine");
		return "admin/insertProduct";
	}
	@PostMapping("insertMachine")
	public String setInsertMachine(@Valid MachineVO machineVO, BindingResult bindingResult, Model model, MultipartFile[] multipartFiles) throws Exception {
		if (bindingResult.hasErrors()) {
			return insertMachinesPage(model, machineVO);
		}

		machineVO = productService.productDetailReplace(machineVO);
		productService.setInsertProduct(machineVO, multipartFiles);
		machineService.setInsertProduct(machineVO);
		
		return "redirect:/admin/list?product_categoryCode=002";
	}
////////////////////////////////////////////////////////////////////////////////

//━━━━━━━━━━━━━━━━━━━━━━━━━updateCoffee━━━━━━━━━━━━━━━━━━━━━━━━━
	@GetMapping("updateCoffee")
	public String updateCoffeePage(Model model, @ModelAttribute CoffeeVO coffeeVO) throws Exception{
		ProductVO productVO = new ProductVO();
		productVO.setProduct_categoryCode("001");
		model.addAttribute("categoryCnt", productService.getCategoryCnt(productVO));
		model.addAttribute("category", "coffee");
		model.addAttribute("productVO", coffeeService.getSelectCoffeeOne(coffeeVO));
		model.addAttribute("productFileVOList", productService.getSelectProductFileList(coffeeVO));
		
		return "admin/updateProduct";
	}	
	@PostMapping("updateCoffee")
	public String setUpdateCoffee(@Valid CoffeeVO coffeeVO, BindingResult bindingResult, Model model, MultipartFile[] multipartFiles, String productFile_id) throws Exception{
		if (bindingResult.hasErrors()) {
			ProductVO productVO = new ProductVO();
			productVO.setProduct_categoryCode("001");
			model.addAttribute("categoryCnt", productService.getCategoryCnt(productVO));
			model.addAttribute("category", "coffee");
			model.addAttribute("productVO", productService.productDetailReplace(coffeeVO));
			model.addAttribute("productFileVOList", productService.getSelectProductFileList(coffeeVO));
			return "admin/updateProduct";
		}
		
		coffeeVO = productService.productDetailReplace(coffeeVO);
		productService.setDeleteProductFile(productFile_id);
		productService.setUpdateProduct(coffeeVO, multipartFiles);
		coffeeService.setUpdateProduct(coffeeVO);

		return "redirect:/admin/list?product_categoryCode=001";
	}
////////////////////////////////////////////////////////////////////////////////
	
//	
//	@GetMapping("insertAccessories")
//	public String insertAccessories(Model model, CoffeeVO coffeeVO) {
//		model.addAttribute("type", "Coffee");
//		model.addAttribute("CoffeeVO", coffeeVO);
//		return "admin/insertProduct";
//	}
	
}

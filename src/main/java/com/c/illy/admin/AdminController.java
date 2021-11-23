package com.c.illy.admin;

import java.net.http.HttpRequest;

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
import org.springframework.web.servlet.ModelAndView;

import com.c.illy.product.ProductService;
import com.c.illy.product.coffee.CoffeeService;
import com.c.illy.product.coffee.CoffeeVO;

@Controller
@RequestMapping("admin")
@Transactional(rollbackFor = Exception.class)
public class AdminController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CoffeeService coffeeService;
	
	@GetMapping("adIndex")
	public void main() {
	}
	
	@GetMapping("insertCoffee")
	public String insertCoffeePage(Model model, @ModelAttribute CoffeeVO coffeeVO) {
		model.addAttribute("type", "coffee");
		return "admin/insertProduct";
	}
	
//	@GetMapping("insertMachines")
//	public String insertMachinesPage(Model model, CoffeeVO coffeeVO) {
//		model.addAttribute("type", "Coffee");
//		model.addAttribute("CoffeeVO", coffeeVO);
//		return "admin/insertProduct";
//	}
//	
//	@GetMapping("insertAccessories")
//	public String insertAccessories(Model model, CoffeeVO coffeeVO) {
//		model.addAttribute("type", "Coffee");
//		model.addAttribute("CoffeeVO", coffeeVO);
//		return "admin/insertProduct";
//	}

	@PostMapping("insertCoffee")
	public String setInsertCoffee(@Valid CoffeeVO coffeeVO, BindingResult bindingResult, Model model/* , MultipartFile[] multipartFile */) throws Exception {
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("type", "coffee");
			return "admin/insertProduct";
		}

		productService.setInsertProduct(coffeeVO);
		coffeeService.setInsertProduct(coffeeVO);
		
		return "admin/adIndex";
	}
	
}

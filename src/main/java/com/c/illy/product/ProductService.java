package com.c.illy.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.c.illy.product.coffee.CoffeeRepository;
import com.c.illy.product.coffee.CoffeeVO;
import com.c.illy.product.machine.MachineVO;
import com.c.illy.util.FileManager;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private CoffeeRepository coffeeRepository;
	@Autowired
	private FileManager fileManager;

	public int setInsertProduct(ProductVO productVO) throws Exception {
		return 0;
	};
	public int setUpdateProduct(ProductVO productVO) throws Exception {
		return 0;
	};

	public int setInsertProduct(ProductVO productVO, MultipartFile[] multipartFiles) throws Exception {
		productRepository.setInsertProduct(productVO);

		int index = 0;
		for (MultipartFile file : multipartFiles) {
			if (file.getSize() == 0L) {
				continue;
			}

			System.out.println("[ProductService] UPLOAD FILE " + (index++) + " : " + file.getOriginalFilename());

			// 이미지 저장
//			String fileName = fileManager.getUseServletContext("/upload/notice", file);	
//			String fileName = fileManager.getUseResourceLoader("upload/notice", file);
			String fileName = fileManager.getUseClassPathResource("upload/product", file);
			// *** 이미지 저장 위치 [workspace]\[project]\target\classes\static

			// 이미지 DB insert
			ProductFileVO productFileVO = new ProductFileVO();
			productFileVO.setProduct_id(productVO.getProduct_id());
			productFileVO.setProductFile_name(fileName);
			productFileVO.setProductFile_oriName(file.getOriginalFilename());
			productRepository.setInsertProductFile(productFileVO);
		}

		return 0;
	};

	public int setUpdateProduct(ProductVO productVO, MultipartFile[] multipartFiles) throws Exception {
		productRepository.setUpdateProduct(productVO);

		int index = 0;
		for (MultipartFile file : multipartFiles) {
			if (file.getSize() == 0L) {
				continue;
			}

			System.out.println("[ProductService] UPLOAD FILE " + (index++) + " : " + file.getOriginalFilename());

			// 이미지 저장
//			String fileName = fileManager.getUseServletContext("/upload/notice", file);	
//			String fileName = fileManager.getUseResourceLoader("upload/notice", file);
			String fileName = fileManager.getUseClassPathResource("upload/product", file);
			// *** 이미지 저장 위치 [workspace]\[project]\target\classes\static

			// 이미지 DB insert
			ProductFileVO productFileVO = new ProductFileVO();
			productFileVO.setProduct_id(productVO.getProduct_id());
			productFileVO.setProductFile_name(fileName);
			productFileVO.setProductFile_oriName(file.getOriginalFilename());
			productRepository.setInsertProductFile(productFileVO);
		}

		return 0;
	};

	public List<ProductVO> getListProduct(ProductVO productVO) throws Exception {
		return productRepository.getListProduct(productVO);
	}

	public CategoryCntVO getCategoryAllCnt(ProductVO productVO) throws Exception {
		return productRepository.getCategoryAllCnt(productVO);
	}

	public List<CategoryCntVO> getCategoryCnt(ProductVO productVO) throws Exception {
		return productRepository.getCategoryCnt(productVO);
	}
	
	public ProductVO getSelectProductOne(ProductVO productVO) throws Exception {
		return productRepository.getSelectProductOne(productVO);
	}
	
	public List<ProductFileVO> getSelectProductFileList(ProductVO productVO) throws Exception {
		return productRepository.getSelectProductFileList(productVO);
	}
	
	public CoffeeVO productDetailReplace(CoffeeVO coffeeVO) throws Exception {
		coffeeVO.setProduct_detail(coffeeVO.getProduct_detail().replace("\"", "'"));
		return coffeeVO;
	}
	
	public MachineVO productDetailReplace(MachineVO machineVO) throws Exception {
		machineVO.setProduct_detail(machineVO.getProduct_detail().replace("\"", "'"));
		return machineVO;
	}
	
	public int setDeleteProductFile(String productFile_id) throws Exception {
		if(productFile_id == null) { return 0; }
		String productFile_idArr[] = productFile_id.split(",");
		for(String id : productFile_idArr) {
			productRepository.setDeleteProductFile(id);
		}
		return 0;
	}

}

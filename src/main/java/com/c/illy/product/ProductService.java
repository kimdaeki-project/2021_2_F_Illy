package com.c.illy.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.c.illy.util.FileManager;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private FileManager fileManager;
	
	public int setInsertProduct(ProductVO productVO) throws Exception { return 0; };
	
	public int setInsertProduct(ProductVO productVO, MultipartFile[] multipartFiles) throws Exception {
		productRepository.setInsertProduct(productVO);
		
		for(MultipartFile file:multipartFiles) {
			if(file.getSize() == 0L) { continue; }
			
			System.out.println("[ProductService] UPLOAD FILE : " + file.getOriginalFilename());
			
			//이미지 저장
//			String fileName = fileManager.getUseServletContext("/upload/notice", file);	
//			String fileName = fileManager.getUseResourceLoader("upload/notice", file);
			String fileName = fileManager.getUseClassPathResource("upload/product", file);
			//*** 이미지 저장 위치 [workspace]\[project]\target\classes\static

			//이미지 DB insert
			ProductFileVO productFileVO = new ProductFileVO();
			productFileVO.setProduct_id(productVO.getProduct_id());
			productFileVO.setProductFile_name(fileName);
			productFileVO.setProductFile_oriName(file.getOriginalFilename());
			productRepository.setInsertProductFile(productFileVO);
		}
		
		return 0;
	};

}

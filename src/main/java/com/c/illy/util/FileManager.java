package com.c.illy.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	@Autowired
	private ResourceLoader resourceLoader;
	@Autowired
	private ServletContext servletContext;
	
	public String getUseClassPathResource(String filePath, MultipartFile multipartFile) throws Exception {
		
		String path = "static";
		ClassPathResource classPathResource = new ClassPathResource(path);
		File file = new File(classPathResource.getFile(), filePath);
		
		//폴더생성
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//파일이름 설정
		String fileName="";
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		
		file = new File(file, fileName);
		
		//파일저장
		multipartFile.transferTo(file);
		
		return fileName;
		
	}
	
	public String getUseResourceLoader(String filePath, MultipartFile multipartFile) throws Exception {
		
		String path = "classpath:/static/";
		File file = new File(resourceLoader.getResource(path).getFile(), filePath);
		
		//폴더생성
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//파일이름 설정
		String fileName="";
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		
		file = new File(file, fileName);
		
		//파일저장
		multipartFile.transferTo(file);
		
		return fileName;
		
	}
	
	public String getUseServletContext(String filePath, MultipartFile multipartFile) throws Exception {
		
		//파일경로 설정
		filePath = servletContext.getRealPath(filePath);
		File file = new File(filePath);
		
		//폴더생성
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//파일이름 설정
		String fileName="";
		fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		
		
		file = new File(file, fileName);
		
		//파일저장
		multipartFile.transferTo(file);
		
		return fileName;
		
	}

}

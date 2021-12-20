package com.c.illy.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.c.illy.notice.NoticeFileVO;
import com.c.illy.qna.QnaFileVO;

@Component("fileDown2")
public class FileDown2 extends AbstractView {

    @Autowired
    private ResourceLoader resourceLoader;

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

   		//1. 파일이  저장된  경로 설정
		ClassPathResource classPathResource = new ClassPathResource("static"); //[D:\Ssangyong\workspaceProjectIlly\ProjectIlly\target\classes\static]
    	String path = (String)model.get("path"); //[/upload/qna/]
		
		
        //2. 저장된 경로와 저장된 파일명 합치기
		QnaFileVO qnaFileVO =(QnaFileVO)model.get("fileVO");
		path = path+qnaFileVO.getQnaFile_name();
		
        //3. 위의 정보를 담는 파일 객체 생성
		File file = new File(classPathResource.getFile(), path);

		System.out.println("[FileDown.java]" + file); //RESULT MESSAGE
		
		//한글 처리
		response.setCharacterEncoding("UTF-8");
		
		//총 파일의 크기
		response.setContentLengthLong(file.length());
		
		//다운로드시 파일 이름을 인코딩 처리
		String fileName = URLEncoder.encode(qnaFileVO.getQnaFile_oriName(), "UTF-8");
		
		//header 설정
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"" );
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		//HDD에서 파일을 읽고
		FileInputStream fi = new FileInputStream(file);
		//Client로 전송 준비
		OutputStream os = response.getOutputStream();
		
		//전송
		FileCopyUtils.copy(fi, os);
		
		os.close();
		fi.close();
    }
}   
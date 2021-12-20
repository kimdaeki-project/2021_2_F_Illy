package com.c.illy.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.c.illy.notice.NoticeFileVO;
import com.c.illy.product.ProductVO;
import com.c.illy.util.FileManager;
import com.c.illy.util.Pager;

@Service
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository; 
	
	@Autowired
	private FileManager fileManager;
	
	//qna 리스트 불러오기
	public List<QnaVO> getQnaList(Pager pager,QnaVO qnaVO)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaVO", qnaVO);
		pager.makeRow();
		Long totalCount=qnaRepository.getTotalCount(map);
		pager.makeNum(totalCount); 
		map.put("pager", pager);
		return qnaRepository.getQnaList(map);
	}
	
	//qna product 조회하기 
	public List<ProductVO> getQnaProduct(Pager pager)throws Exception{
		pager.makeRow();
		Long totalCount=qnaRepository.getPrdTotalCount(pager);
		System.out.println(pager.getPerPage());
		System.out.println(pager.getStartRow());
		System.out.println(pager.getSearch());
		System.out.println(pager.getCode());
		System.out.println(pager.getKind());
		System.out.println(totalCount);
		pager.makeNum(totalCount);
		pager.setCount(totalCount);
		return qnaRepository.getQnaProduct(pager);
	} 
	
	//qna 글 하나 조회하기 
	public QnaVO qnaSelectOne(QnaVO qnaVO)throws Exception{
		return qnaRepository.qnaSelectOne(qnaVO);
	}
	
	//qna 추가하기 
	public int qnaInsert(QnaVO qnaVO,MultipartFile[] multipartFiles)throws Exception{
		qnaRepository.qnaInsert(qnaVO);
		for(MultipartFile file:multipartFiles) {
			if(file.getSize()==0L) {
				continue; 
			}
			String fileName=fileManager.getUseClassPathResource("upload/qna", file);
			//*** 이미지 저장 위치 [workspace]\[project]\target\classes\static
			QnaFileVO qnaFileVO = new QnaFileVO();
			qnaFileVO.setQna_id(qnaVO.getQna_id());
			qnaFileVO.setQnaFile_name(fileName);
			qnaFileVO.setQnaFile_oriName(file.getOriginalFilename());
			qnaRepository.qnaFileInsert(qnaFileVO);
		}
		return 0; 
	}
	
	//파일 다운로드
	public QnaFileVO fileDown2(QnaFileVO qnaFileVO)throws Exception{
		return qnaRepository.fileDown2(qnaFileVO);
	}
	
	//qna수정하기
	public int qnaUpdate(QnaVO qnaVO)throws Exception{
		return qnaRepository.qnaUpdate(qnaVO);
	}
	
	//qna 삭제하기 
	public int qnaDelete(QnaVO qnaVO)throws Exception{
		return qnaRepository.qnaDelete(qnaVO);
	}
	
	//----------------------------------------------------------------admin
	public List<QnaVO> getAdQnaList(Pager pager)throws Exception{
		pager.makeRow();
		Long totalCount=qnaRepository.getAdTotalCount(pager);
		pager.makeNum(totalCount);
		return qnaRepository.getAdQnaList(pager);	
	}
	
	//답변달기
	public int writeAnswer(QnaVO qnaVO)throws Exception{
		return qnaRepository.writeAnswer(qnaVO);
	}
	
	//답변취소 
	public int prevAnswer(QnaVO qnaVO)throws Exception{
		return qnaRepository.prevAnswer(qnaVO);
	}
	

}

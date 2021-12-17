package com.c.illy.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.product.ProductVO;
import com.c.illy.util.Pager;

@Mapper
public interface QnaRepository {

	// qna list 조회하기
	public List<QnaVO> getQnaList(Map<String, Object> map)throws Exception;
	
	//totalCount 조회 
	public Long getTotalCount(Map<String, Object> map)throws Exception;

	//qna product 조회하기
	public List<ProductVO> getQnaProduct(Pager pager)throws Exception;
	
	//qna productList totalCount 조회
	public Long getPrdTotalCount(Pager pager)throws Exception;
	
	//qna 글 하나 조회하기
	public QnaVO qnaSelectOne(QnaVO qnaVO)throws Exception;
	
	//파일 다운로드
	public QnaFileVO fileDown(QnaFileVO qnaFileVO)throws Exception;
	
	//qna 추가하기 
	public int qnaInsert(QnaVO qnaVO)throws Exception;
	
	//qna 파일 첨부
	public int qnaFileInsert(QnaFileVO qnaFileVO)throws Exception;
	
	//qna 수정
	public int qnaUpdate(QnaVO qnaVO)throws Exception;
	
	//qna 삭제 
	public int qnaDelete(QnaVO qnaVO)throws Exception;
	
	//--------------------------------------------------------------admin
	public List<QnaVO> getAdQnaList(Pager pager)throws Exception;
	
	public Long getAdTotalCount(Pager pager)throws Exception;
	
	//답변달기 
	public int writeAnswer(QnaVO qnaVO)throws Exception;
	
	//답변취소
	public int prevAnswer(QnaVO qnaVO)throws Exception;
	
}


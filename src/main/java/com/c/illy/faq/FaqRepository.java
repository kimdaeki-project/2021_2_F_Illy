package com.c.illy.faq;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.util.Pager;
@Mapper
public interface FaqRepository {

//--------------------------------------------------------------------FAQ 영역

	//FAQ 리스트 불러오기 
	public List<FaqVO> getFaqList(Pager pager)throws Exception;

	//totalCount 받아오기 
	public Long getTotalCount(Pager pager)throws Exception;
	
	//FAQ 글 하나 조회하기 
	public FaqVO faqSelectOne(FaqVO faqVO)throws Exception;
	
	//FAQ 추가하기 
	public int addFaq(FaqVO faqVO)throws Exception;
	
	//FAQ 삭제하기 
	public int faqDelete(FaqVO faqVO)throws Exception;
	
	//FAQ 수정하기 
	public int faqUpdate(FaqVO faqVO)throws Exception;
	
		
		
		
		
}

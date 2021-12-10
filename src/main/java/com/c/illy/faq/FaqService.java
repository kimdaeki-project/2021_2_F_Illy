package com.c.illy.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.util.Pager;
@Service
public class FaqService {

	@Autowired
	private FaqRepository faqRepository;

	//Faq 리스트 불러오기 
	public List<FaqVO> getFaqList(Pager pager)throws Exception{
		pager.makeRow();
		Long totalCount=faqRepository.getTotalCount(pager);
		pager.makeNum(totalCount);
		return faqRepository.getFaqList(pager);
	}
	
	//Faq 글 하나 조회하기 
	public FaqVO faqSelectOne(FaqVO faqVO)throws Exception{
		return faqRepository.faqSelectOne(faqVO);
	}

	//Faq 추가하기 
	public int addFaq(FaqVO faqVO)throws Exception{
		return faqRepository.addFaq(faqVO);
	}
	
	//Faq 삭제하기
	public int faqDelete(FaqVO faqVO)throws Exception{
		return faqRepository.faqDelete(faqVO);
	}
	
	//Faq 수정하기 
	public int faqUpdate(FaqVO faqVO)throws Exception{
		return faqRepository.faqUpdate(faqVO);
	}
	
	
	
	
}

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

	
	
}

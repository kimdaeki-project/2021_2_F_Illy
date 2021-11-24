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
	
	//타입별로 리스트 불러오기 
	public List<FaqVO> getFaqTypeList(Pager pager)throws Exception;
		
		
		
		
		
		
}

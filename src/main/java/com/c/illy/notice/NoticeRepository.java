package com.c.illy.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.faq.FaqVO;
import com.c.illy.util.Pager;

@Mapper
public interface NoticeRepository {

	//공통
	
	//totalCount 받아오기 
	public Long getTotalCount(Pager pager)throws Exception;
	
	
	//--------------------------------------------------------------------NOTICE 영역
	
	//공지사항 리스트 상단 불러오기 
	public List<NoticeVO> getSelectListTop()throws Exception;
	
	//공지사항 리스트 불러오기 
	public List<NoticeVO> getSelectList(Pager pager)throws Exception;
	
	
	
	
	
}

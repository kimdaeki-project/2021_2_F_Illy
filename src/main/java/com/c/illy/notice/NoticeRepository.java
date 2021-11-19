package com.c.illy.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeRepository {

	//공지사항 리스트 불러오기 
	public List<NoticeVO> getSelectList()throws Exception;
	
	
	
	
}

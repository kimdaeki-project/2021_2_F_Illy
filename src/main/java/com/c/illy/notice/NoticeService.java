package com.c.illy.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;
	
	//공지사항 리스트 불러오기 
	public List<NoticeVO> getSelectList()throws Exception{
		return noticeRepository.getSelectList();
	}
	
	
	
	
	
}

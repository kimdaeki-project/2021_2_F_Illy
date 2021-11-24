package com.c.illy.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.faq.FaqVO;
import com.c.illy.util.Pager;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;
	
	//-----------------------------------------------------------------Notice 영역
	
	//공지사항 상단 리스트 불러오기 
	public List<NoticeVO> getSelectListTop()throws Exception{
		return noticeRepository.getSelectListTop();
	}
	//공지사항 리스트 불러오기 
	public List<NoticeVO> getSelectList(Pager pager)throws Exception{
		pager.makeRow();
		Long totalCount=noticeRepository.getTotalCount(pager);
		pager.makeNum(totalCount);
		return noticeRepository.getSelectList(pager);
	}
	
	
	
	
	
	
	
}

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
	
	//공지사항 글 하나 조회하기 
	public NoticeVO getSelectOne(NoticeVO noticeVO)throws Exception;
	
	//공지사항 추가하기 
	public int addNotice(NoticeVO noticeVO)throws Exception;
	
	//공지사항 파일 첨부 
	public int addFileInsert(NoticeFileVO noticeFileVO)throws Exception;
	
	//공지사항 수정하기 
	public int noticeUpdate(NoticeVO noticeVO)throws Exception;
	
	//공지사항 삭제 
	public int setDelete(NoticeVO noticeVO)throws Exception;
	
	//공지사항 조회수 업데이트 
	public int setHitUpdate(NoticeVO noticeVO)throws Exception;
	
	
}

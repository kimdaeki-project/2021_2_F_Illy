package com.c.illy.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.c.illy.faq.FaqVO;
import com.c.illy.util.FileManager;
import com.c.illy.util.Pager;

@Service
public class NoticeService {

	@Autowired
	private NoticeRepository noticeRepository;
	
	@Autowired
	private FileManager fileManager; 
	
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
	
	//공지사항 글 하나 조회하기 
	public NoticeVO getSelectOne(NoticeVO noticeVO)throws Exception{
		noticeRepository.setHitUpdate(noticeVO);
		return noticeRepository.getSelectOne(noticeVO);
	}
	
	//파일 다운로드
	public NoticeFileVO fileDown(NoticeFileVO noticeFileVO)throws Exception{
		return noticeRepository.fileDown(noticeFileVO);
	}
	
	//공지사항 추가하기 
	public int addNotice(NoticeVO noticeVO,MultipartFile [] multipartFiles)throws Exception{
		noticeRepository.addNotice(noticeVO);
		
		for(MultipartFile file:multipartFiles) {
			if(file.getSize()==0L) {
				continue; 
			}
			String fileName=fileManager.getUseClassPathResource("upload/notice", file);
			//*** 이미지 저장 위치 [workspace]\[project]\target\classes\static
			NoticeFileVO noticeFileVO = new NoticeFileVO();
			noticeFileVO.setNotice_id(noticeVO.getNotice_id());
			noticeFileVO.setNoticeFile_name(fileName);
			noticeFileVO.setNoticeFile_oriName(file.getOriginalFilename());
			noticeRepository.addFileInsert(noticeFileVO);
		}
		return 0; 
	}
	
	//공지사항 수정하기
	public int noticeUpdate(NoticeVO noticeVO)throws Exception{
		return noticeRepository.noticeUpdate(noticeVO);
	}
	
	//공지사항 삭제하기
	public int setDelete(NoticeVO noticeVO)throws Exception{
		return noticeRepository.setDelete(noticeVO);
	}
	
	
	
	
	
}

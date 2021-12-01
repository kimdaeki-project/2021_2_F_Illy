package com.c.illy.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository; 
	
	public List<QnaVO> getQnaList()throws Exception{
		return qnaRepository.getQnaList();
	}
	
	
	
}

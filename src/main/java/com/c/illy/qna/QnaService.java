package com.c.illy.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository; 
	
	public List<QnaVO> getQnaList(QnaVO qnaVO)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaVO", qnaVO);
		/* map.put("pager", pager); */
		return qnaRepository.getQnaList(map);
	}

}

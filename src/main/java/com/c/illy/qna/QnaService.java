package com.c.illy.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.util.Pager;

@Service
public class QnaService {

	@Autowired
	private QnaRepository qnaRepository; 
	
	public List<QnaVO> getQnaList(Pager pager,QnaVO qnaVO)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaVO", qnaVO);
		pager.makeRow();
		Long totalCount=qnaRepository.getTotalCount(map);
		pager.makeNum(totalCount); 
		map.put("pager", pager);
		return qnaRepository.getQnaList(map);
	}

}

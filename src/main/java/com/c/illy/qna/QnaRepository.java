package com.c.illy.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaRepository {

	public List<QnaVO> getQnaList(Map<String, Object> map)throws Exception;
	
	public List<QnaVO> getListForDate(QnaVO qnaVO)throws Exception;
	
}

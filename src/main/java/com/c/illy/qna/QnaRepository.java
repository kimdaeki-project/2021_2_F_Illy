package com.c.illy.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.util.Pager;

@Mapper
public interface QnaRepository {

	// qna list 조회하기
	public List<QnaVO> getQnaList(Map<String, Object> map)throws Exception;
	
	//totalCount 조회 
	public Long getTotalCount(Map<String, Object> map)throws Exception;
	
}

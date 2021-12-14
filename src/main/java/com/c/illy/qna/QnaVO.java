package com.c.illy.qna;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.Null;


import lombok.Data;

@Data
public class QnaVO {
	private Integer qna_id; 
	private String qna_type; 
	private String qna_title; 
	private String qna_contents; 
	private Date qna_regDate;
	private Integer product_id; 
	private Integer member_id; 
	private String qna_phone;
	private String qna_state; 
	private String qna_answer;
	private Date qna_answer_regDate;
	
	private List<QnaFileVO> fileList; 
	
	//임의의 변수 선언(날짜 조회용)
	private String start_date;
	private String end_date;
	
	
	//start_date값 형태 조정해주는 선언-그냥 기본 getter만 하면 형태가 맞지 않아서 mapper에 적용이 안됨
	public String getStart_date() {
		if(this.start_date==null||this.start_date.equals("")) {
			this.start_date=null;
		}
		return this.start_date;
	}
	
	
	
}

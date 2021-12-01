package com.c.illy.qna;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	private Integer qna_id; 
	private String qna_type; 
	private String qna_type_code; 
	private String qna_title; 
	private String qna_contents; 
	private Date qna_regDate;
	private Integer product_id; 
	private Integer member_id; 
	private String qna_state; 
	
	
	
	
	
	
}

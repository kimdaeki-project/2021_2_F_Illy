package com.c.illy.notice;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {

	private Integer notice_id; 
	private String notice_title; 
	private String notice_contents; 
	private Date notice_regDate; 
	private String notice_type; 
	private Integer notice_hits; 
	private Integer notice_top; 
	
	private List<NoticeFileVO> fileList; 
	
	
}

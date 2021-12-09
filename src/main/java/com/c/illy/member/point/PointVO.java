package com.c.illy.member.point;

import java.sql.Date;

import lombok.Data;

@Data
public class PointVO {

	private Integer point_id;
	private Integer member_id;
	private Date point_date;
	private String point_type;
	private String point_history;
	private Integer point_addOrUse;
	private Integer point_totalPoint;
	
	// --------------------------------------날짜 관련
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

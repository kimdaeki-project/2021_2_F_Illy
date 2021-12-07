package com.c.illy.coupon;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {

	private Integer coupon_id;
	private String coupon_name;
	private String coupon_state;
	private Integer coupon_discount;
	private Date coupon_get;
	private Date coupon_validity;
	private Integer member_id;
	
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

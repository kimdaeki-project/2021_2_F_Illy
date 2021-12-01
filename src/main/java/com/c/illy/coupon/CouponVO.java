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
}

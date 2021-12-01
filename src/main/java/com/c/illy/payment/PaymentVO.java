package com.c.illy.payment;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private Integer payment_id;
	private Integer member_id;
	private Integer address_id;
	private String payment_comment;
	private String payment_type;
	private String payment_total;
	private Date payment_date;
	private String payment_name;
	private String payment_delivery;
	private String payment_email;
	private String payment_phone;
	private String payment_product_total;
	private String payment_use_point;
	private String payment_use_coupon;
	private String payment_add_point;
	private String payment_total_discount;
}

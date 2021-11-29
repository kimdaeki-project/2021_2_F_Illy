package com.c.illy.payment;

import java.sql.Date;

import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class PaymentVO{

	private Integer payment_id;
	private Integer member_id;
	private String payment_comment;
	private Integer payment_use_point;
	private String payment_type;
	private Integer payment_total;
	private Date payment_date;
	private Integer cart_id;
}

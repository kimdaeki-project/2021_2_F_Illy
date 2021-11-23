package com.c.illy.payment;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private int payment_id;
	private int member_id;
	private String payment_comment;
	private int payment_use_point;
	private String payment_type;
	private int payment_total;
	private Date payment_date;
	private int cart_id;
}

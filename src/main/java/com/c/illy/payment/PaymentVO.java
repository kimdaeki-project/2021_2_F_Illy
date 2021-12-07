package com.c.illy.payment;

import java.sql.Date;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.c.illy.address.AddressVO;
import com.c.illy.cart.CartProductVO;

import lombok.Data;

@Data
public class PaymentVO{

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
	
	//join - resultMap 사용
	private List<CartProductVO> carts;
	private AddressVO addressVO;
	

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

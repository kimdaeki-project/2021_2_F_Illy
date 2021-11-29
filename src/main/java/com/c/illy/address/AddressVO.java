package com.c.illy.address;

import javax.validation.constraints.NotBlank;

import com.c.illy.member.MemberVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddressVO extends MemberVO {
	private Integer address_id;
	private String address_name;
	private String address_recipient_name;
	private String address_recipient_phone;
	private String address;
	private Integer address_default;
	@NotBlank(message = "필수항목 입니다.")
	private String main_address;
	private String address_reference;
	private String address_detail;
	@NotBlank(message = "필수항목 입니다.")
	private String address_postcode;
}

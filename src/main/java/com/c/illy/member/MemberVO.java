package com.c.illy.member;

import java.sql.Date;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import com.c.illy.Board.BoardVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO extends BoardVO{
	@NotBlank(message = "필수항목 입니다.")
	private String address_num;

	@NotBlank(message = "필수항목 입니다.")
	private String address_detail;

	private String address_reference;

	@NotBlank(message = "필수항목 입니다.")
	private String main_address;
}

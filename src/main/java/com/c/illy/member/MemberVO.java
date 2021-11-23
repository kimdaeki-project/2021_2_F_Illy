package com.c.illy.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private int member_id;
	private String username;
	private String password;
	private String member_name;
	private String member_email;
	private String member_phone;
	private Date member_birth;
	private int member_point;

}

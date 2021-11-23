package com.c.illy.address;

import com.c.illy.member.MemberVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddressVO extends MemberVO {
	private String address;
}

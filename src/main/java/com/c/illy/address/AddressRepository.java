package com.c.illy.address;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.c.illy.member.MemberVO;

@Mapper
public interface AddressRepository {
	public int setAddress(AddressVO AddressVO);
}

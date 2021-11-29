package com.c.illy.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberRepository {

	public int setInsert(MemberVO memberVO);
	
	public MemberVO usernameSelect(MemberVO memberVO);
	
	public int setMemberRoleInsert(Map<String, Object> map);
}

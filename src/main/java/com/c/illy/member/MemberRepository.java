package com.c.illy.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;


@Mapper
public interface MemberRepository {


	public int setInsert(MemberVO memberVO);
	
	/* ijy */
	public int setAddBean(MemberVO memberVO) throws Exception;
	
	public MemberVO getSelect(MemberVO memberVO) throws Exception;
	/* ijy */
	
	public MemberVO usernameSelect(MemberVO memberVO);
	
	public int setMemberRoleInsert(Map<String, Object> map);
	
	public MemberVO find_username(String username);
	
	public MemberVO find_id_useEmail(MemberVO memberVO);
}

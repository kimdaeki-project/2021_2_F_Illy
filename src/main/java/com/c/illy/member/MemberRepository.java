package com.c.illy.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.c.illy.address.AddressVO;


@Mapper
public interface MemberRepository {


	public int setInsert(MemberVO memberVO);
	
	/* ijy */
	public int setAddBean(MemberVO memberVO) throws Exception;
	
	public MemberVO getSelect(MemberVO memberVO) throws Exception;
	/* ijy */
	
	/* ldy */
	public MemberVO getSelectUsername(Integer member_id) throws Exception;
	/* ldy */
	
	public MemberVO usernameSelect(MemberVO memberVO);
	
	public int setMemberRoleInsert(Map<String, Object> map);
	
	public MemberVO find_username(String username);
	
	public MemberVO find_id(MemberVO memberVO);
	
	public MemberVO find_pw(MemberVO memberVO);
	
	public Integer update_member(AddressVO addressVO);
	
	public Integer delete_member(MemberVO memberVO);
	
	public Integer change_password(String old_password, String new_password);
	
	public MemberVO findEmail(MemberVO memberVO);

	public Integer update_email(MemberVO memberVO);
}

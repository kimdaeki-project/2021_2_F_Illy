package com.c.illy.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService implements UserDetailsService{


	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder bCryptPasswordEncoder;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("hi");
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		memberVO = memberRepository.find_username(username);
		return memberVO;
	}
	
	public int setAddBean(MemberVO memberVO) throws Exception {
		return memberRepository.setAddBean(memberVO);
	}

	public int setInsert(MemberVO memberVO) throws Exception{	
		System.out.println(memberVO.getPassword());
		memberVO.setPassword(bCryptPasswordEncoder.encode(memberVO.getPassword()));
		System.out.println(memberVO.getPassword());
		memberVO.setEnabled(true);
		int result  = memberRepository.setInsert(memberVO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("username", memberVO.getUsername());
		map.put("num", 2);
		result = memberRepository.setMemberRoleInsert(map);
		return result;
		
	}
	
	public MemberVO usernameSelect(MemberVO memberVO) {
		return memberRepository.usernameSelect(memberVO);
	}
	
	public MemberVO find_id_useEmail(MemberVO memberVO) {
		return memberRepository.find_id_useEmail(memberVO);
	}
	
}

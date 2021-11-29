package com.c.illy.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
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
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		memberVO = memberRepository.usernameSelect(memberVO);
		return memberVO;
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
	
}

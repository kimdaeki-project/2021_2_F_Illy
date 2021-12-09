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

import com.c.illy.member.point.PointRepository;
import com.c.illy.member.point.PointVO;
import com.c.illy.payment.PaymentVO;


@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService implements UserDetailsService{


	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private PointRepository pointRepository;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		System.out.println("hi");
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		memberVO = memberRepository.find_username(username);
		return memberVO;
	}
	
	public int setAddBean(MemberVO memberVO, PaymentVO paymentVO) throws Exception {
		int point = memberVO.getMember_point() + Integer.parseInt(paymentVO.getPayment_use_point()); // 사용 포인트 차감 전
		PointVO pointVO = new PointVO();
		
		if(!paymentVO.getPayment_add_point().equals("0")) {
			pointVO.setMember_id(paymentVO.getMember_id());
			pointVO.setPoint_date(paymentVO.getPayment_date());
			pointVO.setPoint_type("add");
			pointVO.setPoint_history("(상품 구매) 포인트 적립");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_add_point()));
			pointVO.setPoint_totalPoint(point);
			
			pointRepository.setPointHistory(pointVO);
		}
		point = point - Integer.parseInt(paymentVO.getPayment_use_point()); //구매할 때 사용한 포인트 차감
		
		if(!paymentVO.getPayment_use_point().equals("0")) {
			pointVO.setMember_id(paymentVO.getMember_id());
			pointVO.setPoint_date(paymentVO.getPayment_date());
			pointVO.setPoint_type("use");
			pointVO.setPoint_history("(상품 구매) 포인트 사용");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_use_point()));
			pointVO.setPoint_totalPoint(memberVO.getMember_point());
			
			pointRepository.setPointHistory(pointVO);
		}
		
		return memberRepository.setAddBean(memberVO);
	}
	public MemberVO getSelect(MemberVO memberVO) throws Exception {
		return memberRepository.getSelect(memberVO);
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
	
	public MemberVO find_id(MemberVO memberVO) {
		return memberRepository.find_id(memberVO);
	}
	
}

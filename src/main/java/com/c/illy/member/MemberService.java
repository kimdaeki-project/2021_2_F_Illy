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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.c.illy.address.AddressVO;
import com.c.illy.member.point.PointRepository;
import com.c.illy.member.point.PointVO;
import com.c.illy.payment.PaymentVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class MemberService implements UserDetailsService {

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
		int point = memberVO.getMember_point() - Integer.parseInt(paymentVO.getPayment_add_point());
		PointVO pointVO = new PointVO();
		
		if(!paymentVO.getPayment_use_point().equals("0")) {
			pointVO.setMember_id(paymentVO.getMember_id());
			pointVO.setPoint_date(paymentVO.getPayment_date());
			pointVO.setPoint_type("use");
			pointVO.setPoint_history("(상품 구매) 포인트 사용");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_use_point()));
			pointVO.setPoint_totalPoint(point);
			
			pointRepository.setPointHistory(pointVO);
		}
		
		if(!paymentVO.getPayment_add_point().equals("0")) {
			pointVO.setMember_id(paymentVO.getMember_id());
			pointVO.setPoint_date(paymentVO.getPayment_date());
			pointVO.setPoint_type("add");
			pointVO.setPoint_history("(상품 구매) 포인트 적립");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_add_point()));
			pointVO.setPoint_totalPoint(memberVO.getMember_point());
			
			pointRepository.setPointHistory(pointVO);
		}
		
		return memberRepository.setAddBean(memberVO);
	}

	public MemberVO getSelect(MemberVO memberVO) throws Exception {
		return memberRepository.getSelect(memberVO);
	}

	public int setInsert(MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getPassword());
		memberVO.setPassword(bCryptPasswordEncoder.encode(memberVO.getPassword()));
		System.out.println(memberVO.getPassword());
		memberVO.setEnabled(true);
		int result = memberRepository.setInsert(memberVO);

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

	public boolean find_pw(HttpServletRequest httpServletRequest) {
		String username = httpServletRequest.getParameter("username");
		String password = httpServletRequest.getParameter("password");
		MemberVO memberVO = new MemberVO();
		memberVO.setUsername(username);
		memberVO = memberRepository.find_pw(memberVO);
		boolean passwordCheck = bCryptPasswordEncoder.matches(password, memberVO.getPassword());
		System.out.println(passwordCheck);
		return passwordCheck;
	}

	public boolean find_pw(HttpServletRequest httpServletRequest, MemberVO memberVO) {
		String password = httpServletRequest.getParameter("nowPassword");
		memberVO = memberRepository.find_pw(memberVO);
		boolean passwordCheck = bCryptPasswordEncoder.matches(password, memberVO.getPassword());
		return passwordCheck;
	}

	public boolean delete_pw(HttpServletRequest request, MemberVO memberVO) {
		memberVO.setPassword(request.getParameter("password"));
		memberVO = memberRepository.find_pw(memberVO);
		boolean passwordCheck = bCryptPasswordEncoder.matches(request.getParameter("password"), memberVO.getPassword());
		if (passwordCheck) {
			int ch = memberRepository.delete_member(memberVO);
			System.out.println(ch);
			return passwordCheck;
		}
		return passwordCheck;
	}

	public Integer update_member(AddressVO addressVO, HttpServletRequest request, MemberVO memberVO) {
		addressVO.setMember_id(memberVO.getMember_id());
		addressVO.setMember_email(request.getParameter("member_email"));

		return memberRepository.update_member(addressVO);
	}

	public Integer change_password(MemberVO memberVO, HttpServletRequest request) {
		String new_password = request.getParameter("password");
		String old_password = memberVO.getPassword();
		
		
		new_password = bCryptPasswordEncoder.encode(new_password);
		old_password = bCryptPasswordEncoder.encode(old_password);

		return memberRepository.change_password(old_password, new_password);
	}

}

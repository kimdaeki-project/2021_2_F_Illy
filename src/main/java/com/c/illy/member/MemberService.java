package com.c.illy.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
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
import com.c.illy.util.RandomCode;

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
		int point = memberVO.getMember_point() + Integer.parseInt(paymentVO.getPayment_use_point()); // 사용 포인트 차감 전
		PointVO pointVO = new PointVO();

		if (!paymentVO.getPayment_add_point().equals("0")) {
			pointVO.setMember_id(paymentVO.getMember_id());
			pointVO.setPoint_date(paymentVO.getPayment_date());
			pointVO.setPoint_type("add");
			pointVO.setPoint_history("(상품 구매) 포인트 적립");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_add_point()));
			pointVO.setPoint_totalPoint(point);

			pointRepository.setPointHistory(pointVO);
		}
		point = point - Integer.parseInt(paymentVO.getPayment_use_point()); // 구매할 때 사용한 포인트 차감

		if (!paymentVO.getPayment_use_point().equals("0")) {
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
			return passwordCheck;
		}
		return passwordCheck;
	}

	public Integer update_member(AddressVO addressVO, HttpServletRequest request, MemberVO memberVO) {
		addressVO.setMember_id(memberVO.getMember_id());
		addressVO.setMember_email(request.getParameter("member_email"));
		addressVO.setAddress_postcode(request.getParameter("address_postcode"));
		addressVO.setMain_address(request.getParameter("main_address"));
		addressVO.setAddress_detail(request.getParameter("address_detail"));
		addressVO.setAddress_reference(request.getParameter("address_reference"));
		addressVO.setAddress(request.getParameter("address_postcode")+request.getParameter("main_address")+request.getParameter("address_reference")+request.getParameter("address_detail"));
		Integer updateAddress = memberRepository.update_member(addressVO);
		memberVO.setMember_email(request.getParameter("member_email"));
		Integer updateEmail = memberRepository.update_email(memberVO);
		
		if(updateAddress == 1  && updateEmail ==1) {
			return 1;
		}
		
		return 0;
	}

	public Integer change_password(MemberVO memberVO, HttpServletRequest request) {
		String new_password = request.getParameter("password");
		String old_password = memberVO.getPassword();

		new_password = bCryptPasswordEncoder.encode(new_password);
		/* old_password = bCryptPasswordEncoder.encode(old_password); */

		return memberRepository.change_password(old_password, new_password);
	}

	public MemberVO findEmail(MemberVO memberVO) {
		return memberRepository.findEmail(memberVO);
	}

	public boolean sendMail(HttpServletRequest request, HttpServletResponse response, MemberVO memberVO) {
		RandomCode randomCode = new RandomCode();
		String randomePassword = randomCode.makeRandomPassword();
		String old_password = memberVO.getPassword();
		String new_password = bCryptPasswordEncoder.encode(randomePassword);
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;

		SimpleEmail email1 = new SimpleEmail();
		email1.setHostName("smtp.naver.com");
		email1.setSmtpPort(465);
		email1.setAuthentication("zhzhdkspt", "keykang123");
		email1.setSSLOnConnect(true);
		email1.setStartTLSEnabled(true);
		String response1 = "fail";
		boolean result = false;

		try {
			email1.setFrom("zhzhdkspt@naver.com", "강동욱", "utf-8");
			email1.addTo(memberVO.getMember_email(), memberVO.getMember_name(), "utf-8");
			email1.setSubject("임시 비밀번호 입니다.");
			email1.setMsg("새로운 임시 비밀번호 입니다. " + randomePassword);
			try {
				out = response.getWriter();
				response1 = email1.send();
				memberRepository.change_password(old_password, new_password);
				result = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (EmailException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String sendCode(HttpServletRequest request, HttpServletResponse response) {
		RandomCode randomCode = new RandomCode();
		String ranCode = randomCode.makeRandomCode();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;

		SimpleEmail email1 = new SimpleEmail();
		email1.setHostName("smtp.naver.com");
		email1.setSmtpPort(465);
		email1.setAuthentication("zhzhdkspt", "keykang123");
		email1.setSSLOnConnect(true);
		email1.setStartTLSEnabled(true);
		String response1 = "fail";
		boolean result = false;

		try {
			email1.setFrom("zhzhdkspt@naver.com", "강동욱", "utf-8");
			email1.addTo(request.getParameter("member_email"), "utf-8");
			email1.setSubject("인증코드 입니다.");
			email1.setMsg("인증코드 입니다. " + ranCode);
			try {
				out = response.getWriter();
				response1 = email1.send();
				result = true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (EmailException e) {
			e.printStackTrace();
			return "fales";
		}
		return ranCode;
	}

}

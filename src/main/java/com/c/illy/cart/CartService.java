package com.c.illy.cart;

import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;

import com.c.illy.coupon.CouponRepository;
import com.c.illy.license.LicenseRepository;
import com.c.illy.license.LicenseVO;
import com.c.illy.member.MemberRepository;
import com.c.illy.member.MemberVO;
import com.c.illy.member.point.PointRepository;
import com.c.illy.member.point.PointVO;
import com.c.illy.payment.PaymentVO;
import com.c.illy.util.Pager;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private CouponRepository couponRepository;
	@Autowired
	private LicenseRepository licenseRepository;
	@Autowired
	private PointRepository pointRepository;

	
	public int setCart(CartVO cartVO, MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getMember_id());
		if(cartVO.getMember_id() == null) {
			cartVO.setMember_id(memberVO.getMember_id());
		}
		
		return cartRepository.setCart(cartVO);
	}

	public List<CartProductVO> getNormalBasket(MemberVO memberVO) throws Exception {
		return cartRepository.getNormalBasket(memberVO);
	}
	
	public List<CartProductVO> getDirectPayment(MemberVO memberVO) throws Exception {
		return cartRepository.getDirectPayment(memberVO);
	}
	
	public List<PaymentVO> getMyPageOrderPager(PaymentVO paymentVO, CartVO cartVO, Pager pager) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment", paymentVO);
		map.put("cart", cartVO);
		
		pager.setPerPage(10);
		pager.makeRow();

		Long totalCount = cartRepository.getMyPageOrderCount(map);
		pager.makeNum(totalCount);

		map.put("pager", pager);
		System.out.println("========");
		System.out.println("member_id: " + paymentVO.getMember_id());
		System.out.println("pn: " + pager.getPn());
		System.out.println("totalCount: " + totalCount);

		return cartRepository.getMyPageOrderPager(map);
	}
	
	public Long getMyPageOrderCount(PaymentVO paymentVO, CartVO cartVO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("payment", paymentVO);
		map.put("cart", cartVO);

		return cartRepository.getMyPageOrderCount(map);
	}
	
	public PaymentVO getMyPageOrderDetail(PaymentVO paymentVO) throws Exception {
		return cartRepository.getMyPageOrderDetail(paymentVO);
	}

	public List<CartProductVO> getCartListCheck(MemberVO memberVO) throws Exception {

		return cartRepository.getCartListCheck(memberVO);
	}

	public List<CartProductVO> getPaymentCart(PaymentVO paymentVO) throws Exception {
		return cartRepository.getPaymentCart(paymentVO);
	}

	public int setUpdateNum(CartVO cartVO) throws Exception {
		return cartRepository.setCountUpdate(cartVO);
	}

	public int setDelete(CartVO cartVO) throws Exception {
		return cartRepository.setDelete(cartVO);
	}

	public int setCheckAll(CartVO cartVO) throws Exception {
		return cartRepository.setCheckAll(cartVO);
	}

	public int setPaymentID(PaymentVO paymentVO, CartVO cartVO, HttpServletRequest request) throws Exception {
		//머신 구매 시 시리얼넘버 생성
		String [] serialArray = request.getParameterValues("serialArray");
		System.out.println(serialArray.length);
		
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss"); //현재날짜(시간포함)
		
		for(int i=0; i<serialArray.length;i+=4) {
			if(serialArray[i].substring(0, 3).equals("002")) {
				Integer product_id = Integer.parseInt(serialArray[i+1]);
				Integer member_id = Integer.parseInt(serialArray[i+2]);
				Integer cart_id = Integer.parseInt(serialArray[i+3]);
				
				String serialNumber = "ILLY"+fourteen_format.format(date_now)+"M"+cart_id;
				System.out.println("serialNumber: "+serialNumber);
				LicenseVO licenseVO = new LicenseVO();
				licenseVO.setSerial_number(serialNumber);
				licenseVO.setProduct_id(product_id);
				licenseVO.setMember_id(member_id);
				licenseVO.setCart_id(cart_id);
				
				licenseRepository.setSerialNumber(licenseVO);
			}
			
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("payment", paymentVO);
		map.put("cart", cartVO);
		
		System.out.println("========");
		System.out.println("cart_state: " + cartVO.getCart_state()+", member_id: "+paymentVO.getMember_id()+", payment_id: "+paymentVO.getPayment_id());

		return cartRepository.setPaymentID(map);
	}

	public int setCheckOne(CartVO cartVO) throws Exception {
		return cartRepository.setCheckOne(cartVO);
	}
	
	public int setPaymentDelivery(PaymentVO paymentVO) throws Exception {
		return cartRepository.setPaymentDelivery(paymentVO);
	}

	public int setPaymentDone(PaymentVO paymentVO) throws Exception {
		return cartRepository.setPaymentDone(paymentVO);
	}

	//상품 취소
	public int setPaymentCancel(PaymentVO paymentVO, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		memberVO = memberRepository.getSelect(memberVO);
		Integer point = memberVO.getMember_point() - Integer.parseInt(paymentVO.getPayment_add_point()); //구매할 때 적립받은 포인트 차감
		couponRepository.setCouponUseCancel(paymentVO); //쿠폰 사용 취소
		
		
/********************************************** 콩포인트 내역 리스트 추가 코드 **********************************************/
		java.sql.Date today= new java.sql.Date(new java.util.Date().getTime()); //오늘 날짜 표현
		
		PointVO pointVO = new PointVO();
		if(!paymentVO.getPayment_add_point().equals("0")) {
			pointVO.setMember_id(memberVO.getMember_id()); //로그인 한 아이디 넣기
			pointVO.setPoint_date(today); //리뷰 적립 날짜 / 상품 취소 날짜 / 상품 구매 날짜 적기
			pointVO.setPoint_type("use"); //적립은 "add", 차감은 "use"로 표현
			pointVO.setPoint_history("(상품 취소) 적립 포인트 차감"); //(리뷰 등록) 포인트 적립 이런 식으로
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_add_point())); //얼마 적립해줄지
			pointVO.setPoint_totalPoint(point); //기존포인트+적립포인트
			
			pointRepository.setPointHistory(pointVO);
		}
/********************************************** 콩포인트 내역 리스트 추가 코드 **********************************************/
		
		point = point + Integer.parseInt(paymentVO.getPayment_use_point()); //구매할 때 사용한 포인트 적립
		memberVO.setMember_point(point);
		memberRepository.setAddBean(memberVO); //포인트 차감 후 update
		
		if(!paymentVO.getPayment_use_point().equals("0")) {
			pointVO.setMember_id(memberVO.getMember_id());
			pointVO.setPoint_date(today);
			pointVO.setPoint_type("add");
			pointVO.setPoint_history("(상품 취소) 사용 포인트 적립");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_use_point()));
			pointVO.setPoint_totalPoint(point);
			
			pointRepository.setPointHistory(pointVO);
		}
		
		return cartRepository.setPaymentCancel(paymentVO);
	}

	public int setPaymentRefund(PaymentVO paymentVO, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		memberVO = memberRepository.getSelect(memberVO);
		Integer point = memberVO.getMember_point() - Integer.parseInt(paymentVO.getPayment_add_point()); //구매할 때 적립받은 포인트 차감
		
		couponRepository.setCouponUseCancel(paymentVO); //쿠폰 사용 취소
		
		java.sql.Date today= new java.sql.Date(new java.util.Date().getTime());
		
		PointVO pointVO = new PointVO();
		if(!paymentVO.getPayment_add_point().equals("0")) {
			pointVO.setMember_id(memberVO.getMember_id());
			pointVO.setPoint_date(today);
			pointVO.setPoint_type("use");
			pointVO.setPoint_history("(상품 환불) 적립 포인트 차감");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_add_point()));
			pointVO.setPoint_totalPoint(point);
			
			pointRepository.setPointHistory(pointVO);
		}
		point = point + Integer.parseInt(paymentVO.getPayment_use_point()); //구매할 때 사용한 포인트 적립
		memberVO.setMember_point(point);
		memberRepository.setAddBean(memberVO); //포인트 차감 후 update
		
		if(!paymentVO.getPayment_use_point().equals("0")) {
			pointVO.setMember_id(memberVO.getMember_id());
			pointVO.setPoint_date(today); //현재 날짜로 수정
			pointVO.setPoint_type("add");
			pointVO.setPoint_history("상품 환불 사용 포인트 적립");
			pointVO.setPoint_addOrUse(Integer.parseInt(paymentVO.getPayment_use_point()));
			pointVO.setPoint_totalPoint(point);
			
			pointRepository.setPointHistory(pointVO);
		}
		
		return cartRepository.setPaymentRefund(paymentVO);
	}
	
	public int setPaymentCart(CartVO cartVO, @AuthenticationPrincipal MemberVO memberVO) throws Exception {
		if(cartVO.getMember_id() == null) {
			cartVO.setMember_id(memberVO.getMember_id());
		}
		return cartRepository.setPaymentCart(cartVO);
	}
	
	public int setDirectPayment(MemberVO memberVO) throws Exception {
		return cartRepository.setDirectPayment(memberVO);
	}
}

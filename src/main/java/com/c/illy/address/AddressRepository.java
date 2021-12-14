package com.c.illy.address;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.c.illy.member.MemberVO;
import com.c.illy.payment.PaymentVO;

@Mapper
public interface AddressRepository {

	public int setPaymentAddress(AddressVO addressVO) throws Exception;
	
	//나의배송지 삭제하기
	public int setMyAddressDelete(AddressVO addressVO) throws Exception;
	
	//나의배송지 수정하기
	public int setMyAddressUpdate(AddressVO addressVO) throws Exception;
	
	//주소 한 개 가져오기
	public AddressVO getAddressOne() throws Exception;
	
	//최근 배송지 주소 가져오기
	public AddressVO getAddressLatest(MemberVO memberVO) throws Exception;
	
	//기본 배송지 가져오기
	public AddressVO getDefaultAddress(MemberVO memberVO) throws Exception;
	
	//가입 시 내 정보에 들어가는 주소
	public AddressVO getJoinAddress(MemberVO memberVO) throws Exception;
	
	//배송지 정보 가져오기
	public AddressVO getAddressOrder(PaymentVO paymentVO) throws Exception;
	
	//나의배송지 주소 list 가져오기
	public List<AddressVO> getAddressList(MemberVO memberVO) throws Exception;
	
	//기본배송지 변경
	public int setMyDefaultAddressInsert(AddressVO addressVO) throws Exception;

	public int setAddress(AddressVO AddressVO);
	
}

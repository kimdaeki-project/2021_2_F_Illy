package com.c.illy.address;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.member.MemberVO;

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
	
	//나의배송지 주소 list 가져오기
	public List<AddressVO> getAddressList(MemberVO memberVO) throws Exception;
	
	//기본배송지 변경
	public int setMyDefaultAddressInsert(AddressVO addressVO) throws Exception;

}

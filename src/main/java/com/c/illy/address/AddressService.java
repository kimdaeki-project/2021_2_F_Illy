package com.c.illy.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberVO;

@Service
public class AddressService {

	@Autowired
	private AddressRepository addressRepository;
	
	public int setPaymentAddress(AddressVO addressVO) throws Exception {
		return addressRepository.setPaymentAddress(addressVO);
	}
	
	public int setMyAddressDelete(AddressVO addressVO) throws Exception {
		return addressRepository.setMyAddressDelete(addressVO);
	}
	
	public int setMyAddressUpdate(AddressVO addressVO) throws Exception {
		return addressRepository.setMyAddressUpdate(addressVO);
	}
	
	public int setMyDefaultAddressInsert(AddressVO addressVO) throws Exception {
		return addressRepository.setMyDefaultAddressInsert(addressVO);
	}
	
	public AddressVO getAddressOne() throws Exception {
		return addressRepository.getAddressOne();
	}
	
	public AddressVO getAddressLatest(MemberVO memberVO) throws Exception {
		return addressRepository.getAddressLatest(memberVO);
	}
	
	public AddressVO getDefaultAddress(MemberVO memberVO) throws Exception {
		return addressRepository.getDefaultAddress(memberVO);
	}
	
	public List<AddressVO> getAddressList(MemberVO memberVO) throws Exception {
		return addressRepository.getAddressList(memberVO);
	}
	
}

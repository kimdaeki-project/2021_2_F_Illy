package com.c.illy.address;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.member.MemberVO;

@Service
public class AddressService {
	@Autowired
	private AddressRepository addressRepository;
	
	public int setAddress(AddressVO addressVO, HttpServletRequest request) {
		String address_recipient_name = request.getParameter("username");
		String address_recipient_phone = request.getParameter("member_phone");
		String main_address = request.getParameter("main_address");
		String address_reference = request.getParameter("address_reference");
		String address_detail = request.getParameter("address_detail");
		String address_postcode = request.getParameter("address_postcode");
		String address = address_postcode + main_address + address_reference + address_detail;
		
		
		addressVO.setAddress_recipient_name(address_recipient_name);
		addressVO.setAddress_recipient_phone(address_recipient_phone);
		addressVO.setAddress_default(1);
		addressVO.setMain_address(main_address);
		addressVO.setAddress_reference(address_reference);
		addressVO.setAddress_detail(address_detail);
		addressVO.setAddress_postcode(address_postcode);
		addressVO.setAddress(address);
		return addressRepository.setAddress(addressVO);
	}
}

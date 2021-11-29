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
		addressVO.setAddress_recipient_name(request.getParameter("username"));
		addressVO.setAddress_recipient_phone(request.getParameter("member_phone"));
		addressVO.setAddress(null);
		addressVO.setAddress_default(1);
		addressVO.setMain_address(request.getParameter("main_address"));
		addressVO.setAddress_reference(request.getParameter("address_reference"));
		addressVO.setAddress_detail(request.getParameter("address_detail"));
		addressVO.setAddress_postcode(request.getParameter("address_postcode"));
		return addressRepository.setAddress(addressVO);
	}
}

package com.c.illy.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.c.illy.Board.BoardService;

@Service
public class MemberService implements BoardService {
	@Autowired
	private MemberRepository memberRepository;

	@Override
	public int setInsert(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberRepository.setInsert(memberVO);
	}

}

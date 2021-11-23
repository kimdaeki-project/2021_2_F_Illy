package com.c.illy.member;

import org.apache.ibatis.annotations.Mapper;

import com.c.illy.Board.BoardMapper;

@Mapper
public interface MemberRepository {

	public MemberVO setInsert(MemberVO memberVO) throws Exception;
	
}

package com.kh.onairstudy.member.model.service;

import java.util.List;

import com.kh.onairstudy.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	List<Member> selectDiligentMember();




}

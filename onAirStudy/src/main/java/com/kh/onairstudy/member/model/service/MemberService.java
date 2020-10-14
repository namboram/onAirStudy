package com.kh.onairstudy.member.model.service;

import com.kh.onairstudy.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

}

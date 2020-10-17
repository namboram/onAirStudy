package com.kh.onairstudy.member.model.dao;

import java.util.List;

import com.kh.onairstudy.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	List<Member> selectDiligentMember();


}

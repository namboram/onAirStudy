package com.kh.onairstudy.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.member.model.vo.MemberInfo;

public interface MemberService {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	List<Member> selectDiligentMember();

	int updateBlack(String reportedMember);

	int updateMember(Member member);

	Member selectOneMemberDetail(String memberId);

	Map<String, Object> selectMemberInfo(String memberId);

	//아이디중복체크
	int idChk(Member member);
	//수정폼에 내용보여주기
	List<Member> updateSelectOne(String memberId);

	MemberInfo selectdDayInfo(String memberId);

	







	




}

package com.kh.onairstudy.member.model.dao;

import java.util.List;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.member.model.vo.MemberInfo;

public interface MemberDAO {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	List<Member> selectDiligentMember();

	int updateBlack(String reportedMember);

	String getMemberImage(String memberId);
	
	int selectNextPaymentDay(String memberId);
	
	MemberInfo selectdDayInfo(String memberId);

}

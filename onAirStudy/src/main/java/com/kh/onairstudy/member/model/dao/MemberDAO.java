package com.kh.onairstudy.member.model.dao;

import java.util.List;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.member.model.vo.MemberInfo;

public interface MemberDAO {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	List<Member> selectDiligentMember();

	int updateBlack(String reportedMember);

	int updateMember(Member member);

	Member selectOneMemberDetail(String memberId);

	String getMemberImage(String memberId);
	
	String selectNextPaymentDay(String memberId);
	
	MemberInfo selectdDayInfo(String memberId);
	
	//아이디중복체크
	int idChk(Member member);
	
	//수정폼에 내용 보여주기
	List<Member> updateSelectOne(String memberId);

}

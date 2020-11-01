package com.kh.onairstudy.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.member.model.vo.MemberInfo;
import com.kh.onairstudy.payment.model.vo.ProfileAttach;
import com.kh.onairstudy.studyroom.model.vo.ProfileAttachment;

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
	
	//회원삭제
	int deleteMember(String memberId);
	
	//프로필사진 저장
	int insertProfilePhoto(ProfileAttach attach);
	//프로필사진 업데이트
	int updateProfilePhoto(ProfileAttach attach);
	//프로필사진 유무 확인
	int checkIdProfile(Member loginMember);

	







	




}

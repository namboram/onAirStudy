package com.kh.onairstudy.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.member.model.dao.MemberDAO;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.member.model.vo.MemberInfo;
import com.kh.onairstudy.payment.model.vo.ProfileAttach;
import com.kh.onairstudy.studyroom.model.vo.ProfileAttachment;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/

@Service
public class MemberServiceImpl implements MemberService {


	@Autowired
	private MemberDAO memberDAO;

	//01. 회원 로그인
	@Override
	public Member selectOneMember(String memberId) {
		return memberDAO.selectOneMember(memberId);
	}
	// 02. 회원등록
	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}
	
	
	
	//신고 후 회원 블랙리스트 업데이트
	@Override
	public int updateBlack(String reportedMember) {
		return memberDAO.updateBlack(reportedMember);
	}
	//성실멤버 랭킹
	@Override
	public List<Member> selectDiligentMember() {
		return memberDAO.selectDiligentMember();
	}

	//회원정보수정
	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}
	@Override
	public Member selectOneMemberDetail(String memberId) {
		return memberDAO.selectOneMemberDetail(memberId);
	}
	@Override
	public Map<String, Object> selectMemberInfo(String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("profile", memberDAO.getMemberImage(memberId));
		map.put("paymentDay", memberDAO.selectNextPaymentDay(memberId));
		
		return map;

	}

	
	@Override
	public MemberInfo selectdDayInfo(String memberId) {
		
		return  memberDAO.selectdDayInfo(memberId);
	}
	@Override
	public int idChk(Member member) {
		return memberDAO.idChk(member);
	}
	@Override
	public List<Member> updateSelectOne(String memberId) {
		return memberDAO.updateSelectOne(memberId);
	}
	//회원삭제
	@Override
	public int deleteMember(String memberId) {
		return memberDAO.deleteMember(memberId);
	}

	//포르필사진 저장
	@Override
	public int insertProfilePhoto(ProfileAttach attach) {
		return memberDAO.insertProfilePhoto(attach);
	}
	//포로필사진 업데이트
	@Override
	public int updateProfilePhoto(ProfileAttach attach) {
		return memberDAO.updateProfilePhoto(attach);
	}
	@Override
	public int checkIdProfile(Member loginMember) {
		return memberDAO.checkIdProfile(loginMember);
	}


	
	
	
}

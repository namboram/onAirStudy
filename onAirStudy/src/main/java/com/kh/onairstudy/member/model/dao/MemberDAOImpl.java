package com.kh.onairstudy.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.member.model.vo.MemberInfo;

@Repository
public class MemberDAOImpl implements MemberDAO {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//01. 회원로그인
	@Override
	public Member selectOneMember(String memberId) {
		return sqlSession.selectOne("member.selectOneMember", memberId);
	}
	
	//02. 회원등록
	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember", member);
	}

	//신고 후 블랙리스트 등록
	@Override
	public int updateBlack(String reportedMember) {
		return sqlSession.update("member.updateBlack", reportedMember);
	}
	
	//성실멤버 List
	@Override
	public List<Member> selectDiligentMember() {
		return sqlSession.selectList("member.selectDiligentMember");
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}

	@Override
	public Member selectOneMemberDetail(String memberId) {
		return sqlSession.selectOne("member.selectOneMemberDetail",memberId);
	}
	public String getMemberImage(String memberId) {
		return sqlSession.selectOne("member.getMemberImage", memberId);
	}

	@Override
	public String selectNextPaymentDay(String memberId) {
		return sqlSession.selectOne("member.selectNextPaymentDay", memberId);
	}

	@Override
	public MemberInfo selectdDayInfo(String memberId) {
		return sqlSession.selectOne("member.selectdDayInfo", memberId);
	}
	
	@Override
	public int idChk(Member member) {
		return sqlSession.selectOne("member.idChk", member);
	}

	@Override
	public List<Member> updateSelectOne(String memberId) {
		return sqlSession.selectOne("member.updateSelectOne", memberId);
	}

	



	
}

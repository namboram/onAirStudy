package com.kh.onairstudy.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.member.model.vo.Member;

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

	@Override
	public List<Member> selectDiligentMember() {
		return sqlSession.selectList("member.selectDiligentMember");
	}

	//신고 후 블랙리스트 등록
	@Override
	public int updateBlack(String reportedMember) {
		return sqlSession.update("member.updateBlack", reportedMember);
	}

	
}

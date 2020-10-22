package com.kh.onairstudy.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.member.model.vo.Member;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Member> memberLis() {
		return sqlSession.selectList("admin.memberList");
	}

	@Override
	public Map<String, Object> memberDetail(String memberId) {
		return sqlSession.selectOne("admin.memberDetail", memberId);
	}

	@Override
	public List<Map<String, Object>> serviceList() {
		return sqlSession.selectList("admin.serviceList");
	}

	
	
}

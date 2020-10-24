package com.kh.onairstudy.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Member> memberLis(Map<String, Object> search) {
		return sqlSession.selectList("admin.memberList", search);
	}

	@Override
	public Map<String, Object> memberDetail(String memberId) {
		return sqlSession.selectOne("admin.memberDetail", memberId);
	}

	@Override
	public List<Map<String, Object>> serviceList(Map<String, Object> search) {
		return sqlSession.selectList("admin.serviceList", search);
	}

	@Override
	public Map<String, Object> serviceDetail(int no) {
		return sqlSession.selectOne("admin.serviceDetail", no);
	}

	@Override
	public Map<String, Object> serviceDetailAv(int no) {
		return sqlSession.selectOne("admin.serviceDetailAv", no);
	}

	@Override
	public int insertService(ServiceCenter sc) {
		return sqlSession.insert("admin.insertService", sc);
	}

	@Override
	public int updateService(int replyNo) {
		return sqlSession.update("admin.updateService", replyNo);
	}

	
	
}

package com.kh.onairstudy.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.report.model.vo.Report;
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
	public int serviceCnt() {
		return sqlSession.selectOne("admin.serviceCnt");
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

	@Override
	public List<Map<String, Object>> reportList(Map<String, Object> map) {
		return sqlSession.selectList("admin.reportList", map);
	}

	@Override
	public Map<String, Object> showModal1(Map<String, Object> map) {
		return sqlSession.selectOne("admin.showModal1", map);
	}
	@Override
	public Map<String, Object> showModal2(Map<String, Object> map) {
		return sqlSession.selectOne("admin.showModal2", map);
	}

	@Override
	public List<Map<String, Object>> studyList(Map<String, Object> search) {
		return sqlSession.selectList("admin.studyList", search);
	}

	@Override
	public Map<String, Object> studyDetail(int no) {
		return sqlSession.selectOne("admin.studyDetail", no);
	}

	@Override
	public List<String> studyMembers(int no) {
		return sqlSession.selectList("admin.studyMembers", no);
	}

	@Override
	public int studyDelete(int no) {
		return sqlSession.update("admin.studyDelete", no);
	}

	@Override
	public int updateReport(int no) {
		return sqlSession.update("admin.updateReport", no);
	}

	
	
}

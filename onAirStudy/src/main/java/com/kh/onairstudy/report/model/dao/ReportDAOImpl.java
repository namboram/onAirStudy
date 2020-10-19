package com.kh.onairstudy.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.report.model.vo.Report;

@Repository
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReport(Report report) {
		
		return sqlSession.insert("report.insertReport", report);
	}

	@Override
	public int selectCntReport(String reportedMember) {

		return sqlSession.selectOne("report.selectCntReport",reportedMember);
	}
	
	
}

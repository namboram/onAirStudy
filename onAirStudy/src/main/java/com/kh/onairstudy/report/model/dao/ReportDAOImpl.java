package com.kh.onairstudy.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}

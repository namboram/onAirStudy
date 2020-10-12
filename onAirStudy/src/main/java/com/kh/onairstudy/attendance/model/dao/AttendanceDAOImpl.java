package com.kh.onairstudy.attendance.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}

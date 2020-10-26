package com.kh.onairstudy.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.attendance.model.vo.Attendance;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Attendance> selectList() {
		return sqlSession.selectList("attendance.selectList");
	}
	
}

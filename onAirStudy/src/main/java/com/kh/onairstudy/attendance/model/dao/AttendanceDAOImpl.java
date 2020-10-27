package com.kh.onairstudy.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.attendance.model.vo.Attendance;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Attendance> selectList(String memberId) {
		return sqlSession.selectList("attendance.selectList", memberId);
	}

	@Override
	public int selectAttendYN(Map<String, Object> param) {
		return sqlSession.selectOne("attendance.selectAttendYN", param);
	}

	@Override
	public int getAttendCnt(Map<String, Object> param) {
		return sqlSession.selectOne("attendance.getAttendCnt", param);
	}

	@Override
	public int updateAttendance(Map<String, Object> param) {
		return sqlSession.update("attendance.updateAttendance", param);
	}

	@Override
	public List<Attendance> selectAttendList(int roomNum) {
		return sqlSession.selectList("attendance.selectAttendList", roomNum);
	}
	
	
}

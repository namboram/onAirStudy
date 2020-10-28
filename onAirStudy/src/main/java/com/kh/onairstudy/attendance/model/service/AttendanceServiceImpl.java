package com.kh.onairstudy.attendance.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.attendance.model.dao.AttendanceDAO;
import com.kh.onairstudy.attendance.model.vo.Attendance;


/*@Transactional(propagation = Propagation.REQUIRED,
					isolation = Isolation.READ_COMMITTED,
					rollbackFor = Exception.class)	*/
@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDAO AttendanceDAO;

	@Override
	public List<Attendance> selectList(String memberId) {
		return AttendanceDAO.selectList(memberId);
	}
	
	@Override
	public int selectAttendYN(Map<String, Object> param) {
		return AttendanceDAO.selectAttendYN(param);
	}

	@Override
	public int getAttendCnt(Map<String, Object> param) {
		return AttendanceDAO.getAttendCnt(param);
	}

	@Override
	public int updateAttendance(Map<String, Object> param) {
		return AttendanceDAO.updateAttendance(param);
	}

	@Override
	public List<Attendance> selectAttendList(int roomNum) {
		return AttendanceDAO.selectAttendList(roomNum);
	}
	
	
	
}

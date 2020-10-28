package com.kh.onairstudy.attendance.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.attendance.model.vo.Attendance;

public interface AttendanceService {

	List<Attendance> selectList(String memberId);

	int selectAttendYN(Map<String, Object> param);

	int getAttendCnt(Map<String, Object> param);

	int updateAttendance(Map<String, Object> param);
	
	List<Attendance> selectAttendList(int roomNum);
}

package com.kh.onairstudy.attendance.model.dao;

import java.util.List;

import com.kh.onairstudy.attendance.model.vo.Attendance;

public interface AttendanceDAO {

	List<Attendance> selectList(String memberId);

}

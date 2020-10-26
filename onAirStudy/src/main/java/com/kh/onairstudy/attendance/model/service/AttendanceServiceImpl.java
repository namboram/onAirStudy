package com.kh.onairstudy.attendance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	
	
}

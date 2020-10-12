package com.kh.onairstudy.studyroom.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.studyroom.model.dao.StudyRoomDAO;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class StudyRoomServiceImpl implements StudyRoomService{

	@Autowired
	private StudyRoomDAO studyRoomDAO;
}

package com.kh.onairstudy.studyroom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyRoomDAOImpl implements StudyRoomDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}

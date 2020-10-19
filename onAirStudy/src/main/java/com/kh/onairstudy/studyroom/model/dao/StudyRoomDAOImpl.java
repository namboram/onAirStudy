package com.kh.onairstudy.studyroom.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

@Repository
public class StudyRoomDAOImpl implements StudyRoomDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<StudyRoom> selectMystudyList() {
		
		return sqlSession.selectList("studyroom.selectMystudyList");
	}

	@Override
	public List<StudyRoomWaiting> selectMywaitingList() {
		return sqlSession.selectList("studyroom.selectMywaitingList");
	}

	@Override
	public List<StudyRoomWish> selectMywishList() {
		return sqlSession.selectList("studyroom.selectMywishList");
	}

	@Override
	public List<StudyRoomList> selectStudyRoomList() {
		return sqlSession.selectList("studyroom.selectStudyRoomList");
	}

	@Override
	public List<StudyCategory> selectCategoryList() {
		return sqlSession.selectList("studyroom.selectCategoryList");
	}


	
}

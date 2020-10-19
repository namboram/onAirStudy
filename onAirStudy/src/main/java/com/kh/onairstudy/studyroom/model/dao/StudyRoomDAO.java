package com.kh.onairstudy.studyroom.model.dao;

import java.util.List;

import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

public interface StudyRoomDAO {

	List<StudyRoom> selectMystudyList();

	List<StudyRoomWaiting> selectMywaitingList();

	List<StudyRoomWish> selectMywishList();

	List<StudyRoomList> selectStudyRoomList();

	List<StudyCategory> selectCategoryList();

	List<StudyRoomList> selectDiligentStudyroom();

}

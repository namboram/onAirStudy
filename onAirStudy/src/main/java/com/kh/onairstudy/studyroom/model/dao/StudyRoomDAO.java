package com.kh.onairstudy.studyroom.model.dao;

import java.util.List;

import com.kh.onairstudy.studyroom.model.vo.ProfileAttachment;
import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

public interface StudyRoomDAO {

	List<StudyRoom> selectMystudyList();

	List<StudyRoomWaiting> selectMywaitingList();

	List<StudyRoomWish> selectMywishList();

	List<StudyRoomList> selectStudyRoomList();

	List<StudyCategory> selectCategoryList();

	int insertProfileAttachment(ProfileAttachment profile);

	int insertStudyRoom(StudyRoomList roomlist);

	int insertStudyRoomList(StudyRoom studyroom);
	
	//
	List<StudyRoomList> selectDiligentStudyroom();

	List<StudyRoomLog> selectParticipantList(int roomNum);

	List<String> selectApplicantList(int roomNum);

	StudyRoomInfo selectRoomInfo(int roomNum);

}

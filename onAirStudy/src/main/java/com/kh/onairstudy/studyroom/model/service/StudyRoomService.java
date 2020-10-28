package com.kh.onairstudy.studyroom.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

public interface StudyRoomService {
	List<StudyRoom> selectMystudyList();

	List<StudyRoomWaiting> selectMywaitingList();

	List<StudyRoomWish> selectMywishList();

	List<StudyRoomList> selectStudyRoomList();

	List<StudyCategory> selectCategoryList();
	
	List<StudyRoomWish> selectMywish();
//방생성
	int insertStudyRoomList(StudyRoomList studyroomList);
	
//검색
	List<StudyRoomList> listAll(String search_option, String keyword);

	int countArticle(String search_option, String keyword);	
	
	
//
	List<StudyRoomList> selectDiligentStudyroom();

	List<StudyRoomLog> selectParticipantList(int roomNum);

	List<String> selectApplicantList(int roomNum);

	StudyRoomInfo selectRoomInfo(int roomNum);

	int insertWating(StudyRoomWaiting srWating);

	int insertWish(StudyRoomWish srWish);

	int selectParticipatingRoomCnt(String memberId);

	int insertStudyLog(Map<String, Object> param);
	
	
	List<StudyRoomList> selectsrList();

	List<StudyRoomLog> selectStudyRoomLog();

	int updateRoomInfo(StudyRoomInfo studyRoomInfo);





	



	


}

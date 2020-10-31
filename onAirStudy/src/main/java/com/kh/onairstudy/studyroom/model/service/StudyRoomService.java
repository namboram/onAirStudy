package com.kh.onairstudy.studyroom.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.onairstudy.member.model.vo.Member;
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
	
	List<StudyRoomWish> selectMywish(String memberId);
//방생성
	int insertStudyRoomList(StudyRoomList studyroomList);
	
//검색
	List<StudyRoomList> listAll(String search_option, String keyword, int category);

	int countArticle(String search_option, String keyword);	

//찜 목록
	int insertWish(StudyRoomWish srWish);

	int deleteWish(StudyRoomWish srWish);
	
	int selectCheckWish(StudyRoomWish srWish);
		
//
	List<StudyRoomList> selectDiligentStudyroom();

	List<StudyRoomLog> selectParticipantList(int roomNum);

	List<String> selectApplicantList(int roomNum);

	StudyRoomInfo selectRoomInfo(int roomNum);


	int selectParticipatingRoomCnt(String memberId);

	int insertStudyLog(Map<String, Object> param);
	
	
	List<StudyRoomList> selectsrList();

	List<StudyRoomLog> selectStudyRoomLog();

	int insertMemberToSr(Map<String, Object> param);


	int updateRoomInfo(StudyRoomInfo studyRoomInfo);

	// 스터디 신청
	int insertWating(StudyRoomWaiting srWating);

	int selectApplyRoom(StudyRoomWaiting srWating);

	int selectMyStudy(int srNo, String memberId);
	
	
	int updateRoomOpenedYN(HashMap<String, String> param);

	int withdraw(HashMap<String, String> param);

	int deleteMemberAttend(HashMap<String, String> param);

	int updateLog(HashMap<String, String> param);

	int deleteApply(StudyRoomWaiting srWating);





}

package com.kh.onairstudy.studyroom.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.onairstudy.studyroom.model.vo.ProfileAttachment;
import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

public interface StudyRoomDAO {
	//방신청
	int insertWating(StudyRoomWaiting srWating);
	
	int selectApplyRoom(StudyRoomWaiting srWating);
	
	List<StudyRoomWish> selectMywish(String memberId);
	
	//내 방 리스트
	List<StudyRoom> selectMystudyList();

	List<StudyRoomWaiting> selectMywaitingList();

	List<StudyRoomWish> selectMywishList();

	//메인 스터디방 리스트
	List<StudyRoomList> selectStudyRoomList();

	List<StudyCategory> selectCategoryList();

	//찜목록
	int insertWish(StudyRoomWish srWish);
	int deleteWish(StudyRoomWish srWish);
	int selectCheckWish(StudyRoomWish srWish);
	
	//방생성
	int insertStudyRoomList(StudyRoomList studyroomList);
	int insertProfileAttachment(ProfileAttachment profile);
	int insertStudyRoomLog(StudyRoomLog srLog);
	int insertStudyRoom(StudyRoom sRoom);
	
	
	//검색
	List<StudyRoomList> listAll(String search_option, String keyword, int category);
	int countArticle(String search_option, String keyword);
	
	//
	List<StudyRoomList> selectDiligentStudyroom();

	List<StudyRoomLog> selectParticipantList(int roomNum);

	List<String> selectApplicantList(int roomNum);

	StudyRoomInfo selectRoomInfo(int roomNum);

	List<Map<String, Object>> searchRoom(Map<String, String> param);

	int selectParticipatingRoomCnt(String memberId);

	int deleteWaiting(Map<String, Object> param);

	int insertStudyLog(Map<String, Object> param);

	int insertAttendance(Map<String, Object> param);

	
	List<StudyRoomList> selectsrList();

	List<StudyRoomLog> selectStudyRoomLog();

	//회원가입시 회원을 카테고리에 맞게 방등록
	int insertMemberToSr(Map<String, Object> param);

	int updateRoomInfo(StudyRoomInfo studyRoomInfo);

	int updateRoomOpenedYN(HashMap<String, String> param);

	int updateLeader(HashMap<String, String> param);

	int withdraw(HashMap<String, String> param);

	int deleteMemberAttend(HashMap<String, String> param);

	String selectNextLeader(String memberId);

	int updateLog(HashMap<String, String> param);

	int deleteApply(StudyRoomWaiting srWating);

	int selectMyStudy(int srNo, String memberId);

	







	





	

	

}

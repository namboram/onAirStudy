package com.kh.onairstudy.studyroom.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onairstudy.studyroom.model.dao.StudyRoomDAO;
import com.kh.onairstudy.studyroom.model.vo.ProfileAttachment;
import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

@Service
public class StudyRoomServiceImpl implements StudyRoomService{

	@Autowired
	private StudyRoomDAO studyRoomDAO;
	
	@Override
	public List<StudyRoom> selectMystudyList() {		
		return studyRoomDAO.selectMystudyList();
	}
	
	@Override
	public int insertWating(StudyRoomWaiting srWating) {
		return studyRoomDAO.insertWating(srWating);
	}

	@Override
	public List<StudyRoomWaiting> selectMywaitingList() {		
		return studyRoomDAO.selectMywaitingList();
	}

	@Override
	public List<StudyRoomWish> selectMywishList() {
		return studyRoomDAO.selectMywishList();
	}

	@Override
	public List<StudyRoomList> selectStudyRoomList() {
		return studyRoomDAO.selectStudyRoomList();
	}

	@Override
	public List<StudyCategory> selectCategoryList() {
		return studyRoomDAO.selectCategoryList();
	}
//	방생성
	@Override
	public int insertStudyRoom(StudyRoom studyroom) {
		
		int result = 0;
		
		result = studyRoomDAO.insertStudyRoomList(studyroom);
		
		if(studyroom.getProList() != null) {
			for(ProfileAttachment profile : studyroom.getProList()) {
				
				profile.setSrNo(studyroom.getSrNo());
				result = studyRoomDAO.insertProfileAttachment(profile);
			}
		}
		
		return result;
	}
	
	@Override
	public int insertStudyRoom(StudyRoomList sList) {
		return studyRoomDAO.insertStudyRoom(sList);
	}
	
//검색
	@Override
	public List<StudyRoomList> listAll(String search_option, String keyword) {
		return studyRoomDAO.listAll(search_option,keyword);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		return studyRoomDAO.countArticle(search_option,keyword);
	}

	
	
//성실스터디방 List
	@Override
	public List<StudyRoomList> selectDiligentStudyroom() {
		return studyRoomDAO.selectDiligentStudyroom();
	}

	@Override
	public List<StudyRoomLog> selectParticipantList(int roomNum) {
		return studyRoomDAO.selectParticipantList(roomNum);
	}

	@Override
	public List<String> selectApplicantList(int roomNum) {
		return studyRoomDAO.selectApplicantList(roomNum);
	}

	@Override
	public StudyRoomInfo selectRoomInfo(int roomNum) {
		return studyRoomDAO.selectRoomInfo(roomNum);
	}

	@Override
	public int insertWish(StudyRoomWish srWish) {
		return studyRoomDAO.insertWish(srWish);
	}

	@Override
	public int selectParticipatingRoomCnt(String memberId) {
		return studyRoomDAO.selectParticipatingRoomCnt(memberId);
	}

	@Transactional(propagation = Propagation.REQUIRED,
					isolation = Isolation.READ_COMMITTED,
					rollbackFor = Exception.class)
	@Override
	public int insertStudyLog(Map<String, Object> param) {
		int result = studyRoomDAO.deleteWaiting(param);
		result = studyRoomDAO.insertStudyLog(param);
		result = studyRoomDAO.insertAttendance(param);
		return result;
	}



	
	
}

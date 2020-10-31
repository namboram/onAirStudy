package com.kh.onairstudy.studyroom.model.service;

import java.util.HashMap;
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
	
	@Override
	public List<StudyRoomWish> selectMywish(String memberId) {
		return studyRoomDAO.selectMywish(memberId);
	}
	
// 찜목록

	@Override
	public int insertWish(StudyRoomWish srWish) {
		return studyRoomDAO.insertWish(srWish);
	}
	
	@Override
	public int deleteWish(StudyRoomWish srWish) {
		return studyRoomDAO.deleteWish(srWish);
	}
	
	@Override
	public int selectCheckWish(StudyRoomWish srWish) {
		return studyRoomDAO.selectCheckWish(srWish);
	}
//	방생성
		
	@Override
	public int insertStudyRoomList(StudyRoomList studyroomList) {
		
			
			int result = 0;
			result = studyRoomDAO.insertStudyRoomList(studyroomList);			
					

			if(studyroomList.getProList() != null) {
				
				for(ProfileAttachment profile : studyroomList.getProList()) {
					
					profile.setSrNo(studyroomList.getSrNo());
					result = studyRoomDAO.insertProfileAttachment(profile);
				}
			
			}
			
			if(studyroomList.getSrLog() != null) {
				
				for(StudyRoomLog srLog: studyroomList.getSrLog()) {
					
					srLog.setSrNo(studyroomList.getSrNo());
					result = studyRoomDAO.insertStudyRoomLog(srLog);
				}
			
			}
			
			
			if(studyroomList.getSRoom() != null) {
				
				for(StudyRoom sRoom: studyroomList.getSRoom()) {
					
					sRoom.setSrNo(studyroomList.getSrNo());
					result = studyRoomDAO.insertStudyRoom(sRoom);
				}
			
			}

			return result;
	}
	

	
	@Override
	public List<StudyRoomLog> selectStudyRoomLog() {
		// TODO Auto-generated method stub
		return studyRoomDAO.selectStudyRoomLog();
	}
	
//검색
	@Override
	public List<StudyRoomList> listAll(String search_option, String keyword, int category) {
		return studyRoomDAO.listAll(search_option,keyword, category);
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

	@Override
	public List<StudyRoomList> selectsrList() {
		return studyRoomDAO.selectsrList();
	}
	
	//회원가입시 sr_log에 회원 추가 
	@Override
	public int insertMemberToSr(Map<String, Object> param) {
		return studyRoomDAO.insertMemberToSr(param);
	}

	@Override
	public int updateRoomInfo(StudyRoomInfo studyRoomInfo) {
		return studyRoomDAO.updateRoomInfo(studyRoomInfo);
	}

	//방 신청

	@Override
	public int insertWating(StudyRoomWaiting srWating) {
		return studyRoomDAO.insertWating(srWating);
	}

	@Override
	public int selectApplyRoom(StudyRoomWaiting srWating) {
		return studyRoomDAO.selectApplyRoom(srWating);
	}


	@Override
	public int updateRoomOpenedYN(HashMap<String, String> param) {
		return studyRoomDAO.updateRoomOpenedYN(param);
	}
	
	@Override
	public int selectMyStudy(int srNo, String memberId) {
		return studyRoomDAO.selectMyStudy(srNo, memberId);
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public int withdraw(HashMap<String, String> param) {
		int result =  studyRoomDAO.withdraw(param);
		
		result = studyRoomDAO.deleteMemberAttend(param);
		
		return result;
	}


	@Override
	public int deleteMemberAttend(HashMap<String, String> param) {
		return studyRoomDAO.deleteMemberAttend(param);
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
	public int updateLog(HashMap<String, String> param) {
		int result = studyRoomDAO.updateLog(param);  //원래 팀장은 나가고 팀장이 아닌걸로 업데이트
		
		result = studyRoomDAO.deleteMemberAttend(param);
		
		String newLeaderId = studyRoomDAO.selectNextLeader(param.get("srNo")); //남은 멤버중 첫번째로 들어온 사람 아이디
	
		param.put("memberId", newLeaderId);
		System.out.println("newLeaderId = " + newLeaderId);
		
		result = studyRoomDAO.updateLeader(param); // 그 사람을 팀장으로 업데이트
		
		return result;
	}


	@Override
	public int deleteApply(StudyRoomWaiting srWating) {
		return studyRoomDAO.deleteApply(srWating);
	}




	
	
}

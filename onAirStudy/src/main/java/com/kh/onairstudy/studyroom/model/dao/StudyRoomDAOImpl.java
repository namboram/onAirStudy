package com.kh.onairstudy.studyroom.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.studyroom.model.vo.ProfileAttachment;
import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;
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
	
	
	@Override
	public List<StudyRoomWish> selectMywish() {
		return sqlSession.selectList("studyroom.selectMywish");
	}
	
	//찜목록
	@Override
	public int insertWish(StudyRoomWish srWish) {
		return sqlSession.insert("studyroom.insertWish", srWish);
	}
	
	@Override
	public int deleteWish(StudyRoomWish srWish) {
		return sqlSession.delete("studyroom.deleteWish", srWish);
	}
	
	@Override
	public List<String> selectCheckWish(StudyRoomWish srWish) {
		return sqlSession.selectList("studyroom.selectCheckWish", srWish);
	}

	//방생성
	@Override
	public int insertStudyRoomList(StudyRoomList studyroomList) {
		return sqlSession.insert("studyroom.insertStudyRoomList", studyroomList);	
	}
	
	@Override
	public int insertProfileAttachment(ProfileAttachment profile) {
		return sqlSession.insert("studyroom.insertProfileAttachment", profile);
	}

	@Override
	public int insertStudyRoom(StudyRoom sRoom) {
		return sqlSession.insert("studyroom.insertStudyRoom", sRoom);		
	}
	

	@Override
	public int insertStudyRoomLog(StudyRoomLog srLog) {
		return sqlSession.insert("studyroom.insertStudyRoomLog", srLog);
	}	
	
	
	

	@Override
	public List<StudyRoomLog> selectStudyRoomLog() {
		return sqlSession.selectList("studyroom.selectStudyRoomLog");
	}




//검색
	@Override
	public List<StudyRoomList> listAll(String search_option, String keyword) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectList("studyroom.listAll", map);
	}


	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("studyroom.countArticle", map);
	}


//성실스터디방 List
	@Override
	public List<StudyRoomList> selectDiligentStudyroom() {
		return sqlSession.selectList("studyroom.selectDilgentStudyroom");
	}

	@Override
	public List<StudyRoomLog> selectParticipantList(int roomNum) {
		return sqlSession.selectList("studyroom.selectParticipantList", roomNum);
	}

	@Override
	public List<String> selectApplicantList(int roomNum) {
		return sqlSession.selectList("studyroom.selectApplicantList", roomNum);
	}

	@Override
	public StudyRoomInfo selectRoomInfo(int roomNum) {
		return sqlSession.selectOne("studyroom.selectRoomInfo", roomNum);
	}

	@Override
	public List<Map<String, Object>> searchRoom(Map<String, String> param) {
		return sqlSession.selectList("studyroom.searchRoom", param);
	}

	@Override
	public int selectParticipatingRoomCnt(String memberId) {
		return sqlSession.selectOne("studyroom.selectParticipatingRoomCnt", memberId);
	}

	@Override
	public int deleteWaiting(Map<String, Object> param) {
		return sqlSession.delete("studyroom.deleteWaiting", param);
	}

	@Override
	public int insertStudyLog(Map<String, Object> param) {
		return sqlSession.insert("studyroom.insertStudyLog", param);
	}

	@Override
	public int insertAttendance(Map<String, Object> param) {
		return sqlSession.insert("studyroom.insertAttendance", param);
	}
	
	
	
	@Override
	public List<StudyRoomList> selectsrList() {
		return sqlSession.selectList("studyroom.selectsrList");
	}


	@Override
	public int updateRoomInfo(StudyRoomInfo studyRoomInfo) {
		return sqlSession.update("studyroom.updateRoomInfo", studyRoomInfo);
	}

	//방 신청
	@Override
	public int insertWating(StudyRoomWaiting srWating) {
		return sqlSession.insert("studyroom.insertWating",srWating);
	}


	@Override
	public int selectApplyRoom(StudyRoomWaiting srWating) {
		return sqlSession.selectOne("studyroom.selectApplyRoom",srWating);
	}

	@Override
	public int updateRoomOpenedYN(HashMap<String, String> param) {
		return sqlSession.update("studyroom.updateRoomOpenedYN", param);
	}

	@Override
	public int updateLeader(String memberId) {
		return sqlSession.update("studyroom.updateLeader", memberId);
	}

	
	
	
}

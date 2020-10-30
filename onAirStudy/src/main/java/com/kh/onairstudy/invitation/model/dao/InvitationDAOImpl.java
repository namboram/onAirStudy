package com.kh.onairstudy.invitation.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

@Repository
public class InvitationDAOImpl implements InvitationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Invitation> selectInvitationList() {
		
		return sqlSession.selectList("invitation.selectInvitationList");
	}
	

	@Override
	public int updateInvitation(Invitation invi) {
		return sqlSession.update("invitation.updateInvitation", invi);
	}
	
//	@Override
//	public int updateInvitation(int no) {
//		return sqlSession.update("invitation.updateInvitation", no);
//	}

	@Override
	public int insertStudyRoomLog(StudyRoomLog sLog) {
		return sqlSession.insert("invitation.insertStudyRoomLog", sLog);
	}


	@Override
	public int deleteInvitation(int no) {
		return sqlSession.delete("invitation.deleteInvitation", no);
	}


	@Override
	public int selectParticipatingRoomCnt(StudyRoomLog srLog) {
		return sqlSession.selectOne("invitation.selectParticipatingRoomCnt", srLog);
	}


	@Override
	public List<Member> selectMemberList(Map<String, String> param) {
		return sqlSession.selectList("invitation.selectMemberList", param);
	}


	@Override
	public int sendInvitation(Map<String, Object> param) {
		return sqlSession.insert("invitation.sendInvitation", param);
	}
	
	
	
}

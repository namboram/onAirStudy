package com.kh.onairstudy.invitation.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.invitation.model.vo.Invitation;
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
	public int deleteInvitation(int no) {
		return sqlSession.delete("invitation.deleteInvitation", no);
	}

	@Override
	public int updateInvitation(Invitation invi) {
		return sqlSession.update("invitation.updateInvitation", invi);
	}

	@Override
	public int insertStudyRoomLog(StudyRoomLog sLog) {
		return sqlSession.insert("invitation.insertStudyRoomLog", sLog);
	}
}

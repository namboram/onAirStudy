package com.kh.onairstudy.invitation.model.dao;

import java.util.List;

import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

public interface InvitationDAO {

	List<Invitation> selectInvitationList();
	
	int deleteInvitation(int no);

	int updateInvitation(Invitation invi);

	int insertStudyRoomLog(StudyRoomLog sLog);

}

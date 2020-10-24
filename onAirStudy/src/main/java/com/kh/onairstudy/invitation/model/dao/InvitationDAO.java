package com.kh.onairstudy.invitation.model.dao;

import java.util.List;

import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

public interface InvitationDAO {

	List<Invitation> selectInvitationList();
	
	int updateInvitation(Invitation invi);

	int insertStudyRoomLog(StudyRoomLog sLog);

	int deleteInvitation(int no);

//	int updateInvitation(int no);


}

package com.kh.onairstudy.invitation.model.service;

import java.util.List;

import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

public interface InvitationService {

	List<Invitation> selectInvitationList();

	int deleteInvitation(int no);

//	int updateInvitation(int no);

	int updateInvitation(Invitation invi);

	int selectParticipatingRoomCnt(StudyRoomLog srLog);






	

}

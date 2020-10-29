package com.kh.onairstudy.invitation.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

public interface InvitationDAO {

	List<Invitation> selectInvitationList();
	
	int updateInvitation(Invitation invi);

	int insertStudyRoomLog(StudyRoomLog sLog);

	int deleteInvitation(int no);

	int selectParticipatingRoomCnt(StudyRoomLog srLog);

	List<Member> selectMemberList(Map<String, String> param);

	int sendInvitation(Map<String, Object> param);

//	int updateInvitation(int no);


}

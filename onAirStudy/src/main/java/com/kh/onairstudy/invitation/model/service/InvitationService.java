package com.kh.onairstudy.invitation.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

public interface InvitationService {

	List<Invitation> selectInvitationList();

	int deleteInvitation(int no);

//	int updateInvitation(int no);

	int updateInvitation(Invitation invi);

	int selectParticipatingRoomCnt(StudyRoomLog srLog);

	List<Member> selectMemberList(Map<String, String> param);

	int sendInvitation(Map<String, Object> param);






	

}

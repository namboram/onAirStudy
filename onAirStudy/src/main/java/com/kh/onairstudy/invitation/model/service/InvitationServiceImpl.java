package com.kh.onairstudy.invitation.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.invitation.model.dao.InvitationDAO;
import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class InvitationServiceImpl implements InvitationService {

	@Autowired
	private InvitationDAO invitationDAO;

	@Override
	public List<Invitation> selectInvitationList() {
		
		return invitationDAO.selectInvitationList();
	}
	


	@Override
	public int updateInvitation(Invitation invi) {
		
		int result = 0;
		
		result = invitationDAO.updateInvitation(invi);
		
		StudyRoomLog sLog = new StudyRoomLog();
		if(invi.getSLog() != null) {			
//			for(StudyRoomLog sLog : invi.getSLog()) {
//				
//				sLog.setSrNo(invi.getSrNo());				
//				result = invitationDAO.insertStudyRoomLog(sLog);
//			}
			sLog.setMemberId(invi.getInvitedId());
			sLog.setSrNo(invi.getSrNo());	
			result = invitationDAO.insertStudyRoomLog(sLog);
			}
							
		return result;
	}


	@Override
	public int deleteInvitation(int no) {
		return invitationDAO.deleteInvitation(no);
	}



	@Override
	public int selectParticipatingRoomCnt(StudyRoomLog srLog) {
		return invitationDAO.selectParticipatingRoomCnt(srLog);
	}



	@Override
	public List<Member> selectMemberList(Map<String, String> param) {
		return invitationDAO.selectMemberList(param);
	}



	@Override
	public int sendInvitation(Map<String, Object> param) {
		return invitationDAO.sendInvitation(param);
	}

	
}

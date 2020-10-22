package com.kh.onairstudy.invitation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.invitation.model.dao.InvitationDAO;
import com.kh.onairstudy.invitation.model.vo.Invitation;
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
	public int deleteInvitation(int no) {
		return invitationDAO.deleteInvitation(no);
	}

	@Override
	public int updateInvitation(Invitation invi) {
		
		int result = 0;
		
		result = invitationDAO.updateInvitation(invi);
		
		if(invi.getInvitationYN() != 'Y') {
			
			for(StudyRoomLog sLog : invi.getSLog()) {
				
				sLog.setNo(invi.getNo());				
				result = invitationDAO.insertStudyRoomLog(sLog);
			}
//				StudyRoomLog sLog = new StudyRoomLog();
//			
//				sLog.setSrNo(invi.getSrNo());
//				sLog.setMemberId(invi.getInvitiedId());
//				result = invitationDAO.insertStudyRoomLog(sLog);
			}
		
		return result;
	}
}

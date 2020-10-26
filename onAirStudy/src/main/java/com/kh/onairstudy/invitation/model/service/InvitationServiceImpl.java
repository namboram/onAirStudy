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
	public int updateInvitation(Invitation invi) {
		
		int result = 0;
		
		result = invitationDAO.updateInvitation(invi);
		
//		StudyRoomLog sLog = new StudyRoomLog();
		if(invi.getSLog() != null) {
			
			for(StudyRoomLog sLog : invi.getSLog()) {
				
				sLog.setSrNo(invi.getSrNo());				
				result = invitationDAO.insertStudyRoomLog(sLog);
			}
//			sLog.setSrNo(invi.getSrNo());	
//			result = invitationDAO.insertStudyRoomLog(sLog);
			}
		
		return result;
	}


	@Override
	public int deleteInvitation(int no) {
		return invitationDAO.deleteInvitation(no);
	}



//	@Override
//	public int updateInvitation(int no) {
//		return invitationDAO.updateInvitation(no);
//	}
}

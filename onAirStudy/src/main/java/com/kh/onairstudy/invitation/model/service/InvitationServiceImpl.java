package com.kh.onairstudy.invitation.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.invitation.model.dao.InvitationDAO;
import com.kh.onairstudy.invitation.model.vo.Invitation;

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
}

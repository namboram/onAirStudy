package com.kh.onairstudy.invitation.model.service;

import java.util.List;

import com.kh.onairstudy.invitation.model.vo.Invitation;

public interface InvitationService {

	List<Invitation> selectInvitationList();

	int deleteInvitation(int no);

//	int updateInvitation(int no);

	int updateInvitation(Invitation invi);






	

}

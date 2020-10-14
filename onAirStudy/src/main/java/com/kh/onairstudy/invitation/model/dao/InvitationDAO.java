package com.kh.onairstudy.invitation.model.dao;

import java.util.List;

import com.kh.onairstudy.invitation.model.vo.Invitation;

public interface InvitationDAO {

	List<Invitation> selectInvitationList();

}

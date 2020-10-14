package com.kh.onairstudy.invitation.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.invitation.model.vo.Invitation;

@Repository
public class InvitationDAOImpl implements InvitationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Invitation> selectInvitationList() {
		
		return sqlSession.selectList("invitation.selectInvitationList");
	}
	
}

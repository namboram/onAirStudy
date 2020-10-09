package com.kh.onairstudy.invitation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InvitationDAOImpl implements InvitationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}

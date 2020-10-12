package com.kh.onairstudy.message.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}

package com.kh.onairstudy.test.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAOImpl implements TestDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}

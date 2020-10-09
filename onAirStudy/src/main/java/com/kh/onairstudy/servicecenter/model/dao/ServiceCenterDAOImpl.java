package com.kh.onairstudy.servicecenter.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceCenterDAOImpl implements ServiceCenterDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}

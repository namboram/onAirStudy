package com.kh.onairstudy.servicecenter.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

@Repository
public class ServiceCenterDAOImpl implements ServiceCenterDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ServiceCenter> selectServiceList() {
		return sqlSession.selectList("service.selectServiceList");
	}

	@Override
	public List<ServiceContent> selectServiceContentList() {
		return sqlSession.selectList("service.selectServiceContentList");
	}
	
}

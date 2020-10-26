package com.kh.onairstudy.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int updatePayHistory(String memberId) {
		return sqlSession.update("payment.updatePayHistory", memberId);
	}

	
	
	
	
}

package com.kh.onairstudy.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.payment.model.vo.Payment;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int updatePayHistory(String memberId) {
		return sqlSession.update("payment.updatePayHistory", memberId);
	}

	@Override
	public List<Payment> selectPaymentList() {
		return sqlSession.selectList("payment.selectPaymentList");
	}

	
	
	
	
}

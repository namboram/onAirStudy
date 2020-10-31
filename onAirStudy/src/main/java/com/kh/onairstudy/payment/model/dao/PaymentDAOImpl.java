package com.kh.onairstudy.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.member.model.vo.Member;
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
	public List<Payment> selectPaymentList(Member loginMember) {
		return sqlSession.selectList("payment.selectPaymentList", loginMember);	
	}

	@Override
	public int insertPaymentLog(String memberId) {
		return sqlSession.insert("payment.insertPaymentLog", memberId);
	}


	
	
	
	
}

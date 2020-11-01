package com.kh.onairstudy.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.payment.model.dao.PaymentDAO;
import com.kh.onairstudy.payment.model.vo.Payment;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class PaymentServiceImpl implements PaymentService {


	@Autowired
	private PaymentDAO paymentDAO;
	

	@Override
	public int updatePayHistory(String memberId) {
		// TODO Auto-generated method stub
		return paymentDAO.updatePayHistory(memberId);
	}

	//결제내역 리스트
	@Override
	public List<Payment> selectPaymentList(Member loginMember) {
		return paymentDAO.selectPaymentList(loginMember);
	}
	//결제내역 db저장
	@Override
	public int insertPaymentLog(String memberId) {
		return paymentDAO.insertPaymentLog(memberId);
	}



}

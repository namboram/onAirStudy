package com.kh.onairstudy.payment.model.dao;

import java.util.List;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.payment.model.vo.Payment;

public interface PaymentDAO {

	int updatePayHistory(String memberId);

	List<Payment> selectPaymentList(Member loginMember);

	int insertPaymentLog(String memberId);

}

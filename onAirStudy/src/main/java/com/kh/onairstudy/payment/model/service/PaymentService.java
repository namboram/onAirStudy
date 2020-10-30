package com.kh.onairstudy.payment.model.service;

import java.util.List;

import com.kh.onairstudy.payment.model.vo.Payment;

public interface PaymentService {

	int updatePayHistory(String memberId);

	List<Payment> selectPaymentList();

	

}

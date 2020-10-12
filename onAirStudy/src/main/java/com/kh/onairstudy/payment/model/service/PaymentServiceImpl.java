package com.kh.onairstudy.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentService paymentService;
}

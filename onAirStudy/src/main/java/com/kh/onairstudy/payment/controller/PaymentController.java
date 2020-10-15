package com.kh.onairstudy.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.payment.model.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping("/premium.do")
	public String premium() {
		return "payment/premium";
	}
}

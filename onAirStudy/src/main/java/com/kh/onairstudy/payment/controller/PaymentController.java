package com.kh.onairstudy.payment.controller;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	 @RequestMapping("/pay/kakao") 
	 public String kakao() {
		 log.debug("kakao송출..");
		 return "payment/kakaopay";
	 }
	 @RequestMapping("/payments/complete") 
	 public String paymentsComplete() {
		 log.debug("kakao완료..");
		 return "redirect:/";
	 }


	
	/*
	 * @RequestMapping(value="/payment/kakao.do", method = RequestMethod.GET) public
	 * String payPopupGet() {
	 * 
	 * //결제창으로 넘어간다 return "rediret:/payment/kakao.do"; }
	 */
	

	
	
}

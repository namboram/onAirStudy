package com.kh.onairstudy.payment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.payment.model.service.PaymentService;
import com.kh.onairstudy.payment.model.vo.Payment;

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
	
	 @RequestMapping("/pay/kakao") //카카오페이화면 호출
	 public String kakao() {
		 log.debug("kakao송출..");
	
		 return "/payment/kakaopay";
	 }
	
	 @RequestMapping("/payments/complete") //카카오페이폼 완료폼 호출
	 public String paymentsComplete() {
		
		 return "redirect:/";
	 }

		
		@RequestMapping(value="/pay/payHistory", method = RequestMethod.GET) 
		public String payHistory(HttpServletRequest request, Model model, 
								 RedirectAttributes redirectAttributes) {
		
		String memberId = request.getParameter("memberId"); 
		System.out.println(memberId);
		
		int result = paymentService.updatePayHistory(memberId); 
		result = paymentService.insertPaymentLog(memberId);
		
		
		redirectAttributes.addFlashAttribute("msg", result>0 ? "회원권한 수정성공" : "회원권한 수정실패");
		
		return "redirect:/";
		}
		



	
	
}

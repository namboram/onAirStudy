package com.kh.onairstudy.payment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.member.model.vo.Member;
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
	
	//카카오페이화면 호출
	 @RequestMapping("/pay/kakao") 
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
								 RedirectAttributes redirectAttributes,HttpSession session) {
		
		String memberId = request.getParameter("memberId"); 
		System.out.println(memberId);
		//회원권한 M->P 변경
		int result = paymentService.updatePayHistory(memberId);
		Member updateMember = (Member)session.getAttribute("loginMember");
		updateMember.setMemberRole("P");
		session.setAttribute("loginUser",updateMember);
		session.setAttribute("loginMember", updateMember);
		log.debug("memeber = {}", (Member)session.getAttribute("loginMember"));
		//결제내역 DB저장
		result = paymentService.insertPaymentLog(memberId);
		
		
//		redirectAttributes.addFlashAttribute("msg", result>0 ? "회원권한 수정성공" : "회원권한 수정실패");
		
		return "redirect:/";
		}
		



	
	
}

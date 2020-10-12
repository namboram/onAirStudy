package com.kh.onairstudy.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.member.model.service.MemberService;
import com.kh.onairstudy.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	//아래 @Bean 안쓰면 오류떠서 일단 해봄ㅠ
	@Bean
	public BCryptPasswordEncoder getPasswordEncoder()
	{
		return new BCryptPasswordEncoder();
	}
	
	
	
	
		
		@RequestMapping(value = "/memberLogin.do", 
					method = RequestMethod.GET)
		public String memberLogin() {
		return "member/memberLogin";
		}
		
		@RequestMapping(value = "/memberLogin.do", 
					method = RequestMethod.POST)
		public String memberLogin(@RequestParam("memberId") String memberId,
			 				  @RequestParam("password") String password,
			 				  Model model,
			 				  HttpSession session,
			 				  RedirectAttributes redirectAttr) {
		
		Member loginMember = memberService.selectOneMember(memberId); 
		log.debug("loginMember = " + loginMember);
		
		String location = "/";
		
		
		//로그인 성공한 경우
		if(
			loginMember != null && bcryptPasswordEncoder.matches(password, loginMember.getPassword())
		) {
			//세션에 로그인한 사용자 정보 속성 저장
			//model은 기본적으로 requestScope에서 작동하므로,
			//@SessionAttributes를 클래스 레벨에 선언해서 sessionScope에 저장
			model.addAttribute("loginMember", loginMember);
			
			//session에 저장된 next값 확인
			String next = (String)session.getAttribute("next");
			if(next != null)
				location = next;
			
		}
		//로그인 실패한 경우
		else {
			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
		}
		
		return "redirect:" + location;
		}
		
		/**
		* @SessionAttributes 를 통해 사용자정보를 관리했다면,
		* SessionStatus객체를 통해 세션사용을 만료 처리해야한다.
		* 
		* @param sessionStatus
		* @return
		*/
		@RequestMapping("/memberLogout.do")
		public String memberLogout(SessionStatus sessionStatus) {
		
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		return "redirect:/";
	}

}


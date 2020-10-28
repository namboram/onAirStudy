package com.kh.onairstudy.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.member.model.service.MemberService;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.studyroom.model.service.StudyRoomService;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("")
@SessionAttributes({"loginMember"})
public class MemberController {
	

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StudyRoomService studyRoomService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping(value = "member/memberEnroll.do", method = RequestMethod.GET)
	public ModelAndView memberEnroll(ModelAndView mav) {
		mav.addObject("name", "홍길동");
		mav.setViewName("member/memberEnroll");
		return mav;
		}
	
	@RequestMapping(value = "member/memberEnroll.do", method = RequestMethod.POST)
	public String memberEnroll(RedirectAttributes redirectAttr,  Member member) {
		
		String rawPassword = member.getPassword();
		
		String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encodedPassword);
		
		
		log.debug("member = " + member);

		//업무로직
		//1. 회원등록
		int result = memberService.insertMember(member);
		System.out.println(member.getMemberId());
		
		//2. 회원 sr_log등록
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", member.getMemberId());
		param.put("srNo", member.getCategory());
		log.debug("param = {}", param);
		result = studyRoomService.insertMemberToSr(param);
		String msg = result > 0 ? "회원 가입 성공!" : "회원 가입 실패!";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/";
		}

		
	@RequestMapping("member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam("memberId") String memberId){
		Map<String, Object> map = new HashMap<>();
		//1. 업무로직
		boolean isAvailable = memberService.selectOneMember(memberId) == null;
		
		//2. model 정보 : json으로 변환
		map.put("memberId", memberId);
		map.put("isAvailable", isAvailable);
		
		return map;
	}
	
	
	
	//@RequestMapping("/checkIdDuplicate.do")
	public String checkIdDuplicate(@RequestParam("memberId") String memberId,
								   Model model) {
		//1. 업무로직
		boolean isAvailable = memberService.selectOneMember(memberId) == null;
		
		//2. model 정보 : json으로 변환
		model.addAttribute("memberId", memberId);
		model.addAttribute("isAvailable", isAvailable);
		
		//3. viewName으로 jsonView 지정
		//BeanNameViewResolver(1), InternalResourceViewResolver(21억)
		//BeanNameViewResolver에 의해 빈id가 jsonView를 검색.
		//jsonView빈은 model의 데이터를 json문자열로 변환해 응답에 출력.
		return "jsonView";
	}
	
	
	/*휴대폰본인인증
	*
	*/
	/*
	@RequestMapping(value = "/sendSms.do")
	  public String sendSms(HttpServletRequest request) throws Exception {

		
		System.out.println(" 들어왔음");
	    String api_key = "NCS6H2LEJQIDSH1J";
	    String api_secret = "K3PATZ49S16BLIAHJJUYOXHQ6G3RPZ3S";
	    
	    com.kh.onairstudy.member.controller.Coolsms coolsms = new com.kh.onairstudy.member.controller.Coolsms(api_key, api_secret);
	    
	    
	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", "01091496965"); // 수신번호
	    
	    System.out.println("text="+ request.getParameter("text"));
	    
	    set.put("from", "01091496965"); //발신번호
	    set.put("text", "인증번호는[ " + (String)request.getParameter("text") + "]입니다"); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println("set="+set);

	    	
		
		  JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		  
		  if ((boolean)result.get("status") == true) { // 메시지 보내기 성공 및 전송결과 출력
			  System.out.println("성공"); 
			  
			  System.out.println(result.get("result_code")); // 결과코드
			  System.out.println(result.get("result_message")); // 결과 메시지
			  System.out.println(result.get("success_count")); // 메시지아이디
			  System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수 } else {
			  // 메시지 보내기 실패 System.out.println("실패");
			  System.out.println(result.get("code")); // REST API 에러코드
			  System.out.println(result.get("message")); // 에러메시지 }
		 
		 }
		  return "member/sendSms";
	  }
	
	*/
	
	
	
		
		//아래 @Bean 안쓰면 오류떠서 일단 해봄ㅠ
		@Bean
		public BCryptPasswordEncoder getPasswordEncoder()
		{
			return new BCryptPasswordEncoder();
		}
		
	

		
		
		@RequestMapping(value = "member/memberLogin.do", 
					method = RequestMethod.GET)
		public String memberLogin() {
		return "member/memberLogin";
		}
		
		
		
		@RequestMapping(value = "member/memberLogin.do", 
					method = RequestMethod.POST)
		public String memberLogin(@RequestParam("memberId") String memberId,
			 				  @RequestParam("password") String password,
			 				  Model model,
			 				  HttpSession session,
			 				  RedirectAttributes redirectAttr) throws Exception {
		
		Member loginMember = memberService.selectOneMember(memberId); 
		log.debug("loginMember = " + loginMember);
		
		String location = "/";
		
		
		//로그인 성공한 경우
//		if( loginMember != null && 
//			bcryptPasswordEncoder.matches(password, loginMember.getPassword()) ) {
		
		
			log.debug("loginMember = " + loginMember);
				//세션에 로그인한 사용자 정보 속성 저장
				//model은 기본적으로 requestScope에서 작동하므로,
				//@SessionAttributes를 클래스 레벨에 선언해서 sessionScope에 저장
				model.addAttribute("loginMember", loginMember);
				session.setAttribute("loginUser", loginMember);
				
				return "redirect:" + location;
				
			
//		} else {
//			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
//			return "redirect:" + location;
//		
//		}
	}
		
		/**
		* @SessionAttributes 를 통해 사용자정보를 관리했다면,
		* SessionStatus객체를 통해 세션사용을 만료 처리해야한다.
		* 
		* @param sessionStatus
		* @return
		*/
		@RequestMapping("member/memberLogout.do")
		public String memberLogout(SessionStatus sessionStatus, HttpSession session) {
		
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		if(session.getAttribute("loginUser") != null) {
			session.setAttribute("loginUser", null);
		}
		
		return "redirect:/";
	}
		
		//등록한 폼 내용 가져오기
		@RequestMapping("/mypage1/memberDetail.do")
		public ModelAndView memberDetail(@ModelAttribute("loginMember") Member loginMember,
											 ModelAndView mav) {

			log.debug("loginMember = {}", loginMember);
				
			mav.setViewName("member/memberDetail");
			return mav;
		}
		
		//수정폼 저장하기
		@RequestMapping(value="/mypage1/memberUpdate.do", method = RequestMethod.POST)
	
		public String memberUpdate(Member member,
									RedirectAttributes redirectAttributes) {
			
			 log.debug("member@update = {}", member);

			
	         int result = memberService.updateMember(member);
			redirectAttributes.addFlashAttribute("msg", result>0 ? "정보 수정성공" : "정보 수정실패");
			
			return "redirect:/mypage1/memberDetail.do";
		}
		
		//프로필사진 업로드
		@RequestMapping(value="/mypage1/uploadProfile.do", method=RequestMethod.POST)
		public String mProfileInsert(@RequestParam(value = "upFile",required = false) MultipartFile upFile,
									RedirectAttributes redirectAttr) {
			log.debug("upfile.name = {}", upFile.getOriginalFilename());
	        log.debug("upfile.size = {}", upFile.getSize());
			
	        
	        return "redirect:/mypage1/memberDetail.do";
		}
		
}
		
		



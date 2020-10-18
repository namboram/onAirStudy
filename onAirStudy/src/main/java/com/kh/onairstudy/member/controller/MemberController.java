package com.kh.onairstudy.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
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
	
	
	@RequestMapping(value = "/memberEnroll.do", method = RequestMethod.GET)
	public ModelAndView memberEnroll(ModelAndView mav) {
		mav.addObject("name", "홍길동");
		mav.setViewName("member/memberEnroll");
		return mav;
		}
	
	@RequestMapping(value = "/memberEnroll.do", method = RequestMethod.POST)
	public String memberEnroll(RedirectAttributes redirectAttr,  Member member) {
		
		String rawPassword = member.getPassword();
		String encodedPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encodedPassword);
		
		
		log.debug("member = " + member);
		
		//업무로직
		int result = memberService.insertMember(member);
		String msg = result > 0 ? "회원 가입 성공!" : "회원 가입 실패!";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/";
		}
	
	/**
	 * 사용자 요청을 커맨드객체 바인딩시에
	 * Validator객체, 특정타입별 Editor를 설정
	 * 
	 * @param binder
	 */
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) { SimpleDateFormat
	 * sdf = new SimpleDateFormat("yyyy-MM-dd");
	 * 
	 * PropertyEditor editor = new CustomDateEditor(sdf, true); //java.sql.Date타입의
	 * 필드에 값을 바인딩시 이 커스텀 에디터를 사용 // "" -> null
	 * binder.registerCustomEditor(Date.class, editor);
	 * 
	 * }
	 */
		
		
	@RequestMapping("/checkIdDuplicate.do")
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
//		if(
//			loginMember != null && 
//			bcryptPasswordEncoder.matches(password, loginMember.getPassword())
//		) {
		
		
		
		
		log.debug("loginMember = " + loginMember);
			//세션에 로그인한 사용자 정보 속성 저장
			//model은 기본적으로 requestScope에서 작동하므로,
			//@SessionAttributes를 클래스 레벨에 선언해서 sessionScope에 저장
			model.addAttribute("loginMember", loginMember);
			
			//session에 저장된 next값 확인
			String next = (String)session.getAttribute("next");
			if(next != null)
				location = next;

			return "redirect:" + location;
			
		}
		//로그인 실패한 경우
//		else {
//			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
//		}
		
//		}
		
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

//		성실멤버 list
		@RequestMapping("/selectDiligentMember")
		public String selectDiligentMember(Model model) {
			List<Member> list = memberService.selectDiligentMember();			
			
				model.addAttribute("list", list );
				log.debug("list = {}", list);
				return  "forward:/index.jsp";
		}

		
		
//		mypageIndex.jsp 불러오기 (여기에 만들기로함)
		@RequestMapping("/mypage1_index.do")
		public String mypage1_index() {
			return "mypage1/mypage1_index";
		}
	
		
		
}


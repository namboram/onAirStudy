package com.kh.onairstudy.scheduler.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.scheduler.model.service.SchedulerService;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SchedulerController {

	@Autowired
	private SchedulerService schedulerService;
	
	//스케줄러 메인
	@RequestMapping("/mypage1/scheduler.do")
	public ModelAndView mainScheduler(ModelAndView mav, 
										@SessionAttribute("loginMember") Member member) {

		//내역가져오기
		List<Scheduler> addList = makeScheduleArrays(member);
		
		//확인
//		for(Scheduler sch : addList) {
//			System.out.println(sch);
//		}
		
		
		log.debug("memberId = {}", member.getMemberId());
		
		mav.addObject("list", addList);
		mav.setViewName("mypage1/mypage1_scheduler");
		
		return mav;
		
		
	}
	
	//일정 시작~끝 날짜의 중간 날짜들 찾아주기
	public List<Scheduler> makeScheduleArrays(Member member){
				
				//로그인된 아이디 가져오기
				String memberId = member.getMemberId();
				
				Map<String, Object> map = new HashMap<>();

				map.put("memberId", memberId);
				
				//아이디 정보로 스케줄 조회
				List<Scheduler> list = schedulerService.mainScheduler(map);
				
				List<Scheduler> addList = new ArrayList<>();

				Calendar c1 = Calendar.getInstance();
				Calendar c2 = Calendar.getInstance();
				
				for(Scheduler sch : list) {
					//시작날짜와 끝날짜
					Date start = sch.getStartDate();
					Date end = sch.getEndDate();
					
					c1.setTime(start);
					c2.setTime(end);
					
					//시작날짜가 끝날짜보다 작을때만!
					if(start.compareTo(end) < 0) {
						
						addList.add(sch);
						
						//두 날짜가 같이 않으면
						while(c1.compareTo(c2)!=0) {
							
							//하루씩 추가해줌
							c1.add(Calendar.DATE, 1);
							//temp에 담기
							Date temp = new Date(c1.getTimeInMillis());
							//하루씩 더한 날짜를 새 객체에 담아주기
							Scheduler ssch = new Scheduler(sch.getNo(), sch.getMemberId(), sch.getSrNo(), 
															temp, sch.getEndDate(), sch.getContent(), sch.getColorCode(), 
															sch.getScheduleYN(), sch.getDYN(), sch.getTimeOpt(), sch.getEnabledYN());
							
							addList.add(ssch);
						}
					}else {
						//같은날짜일때
						addList.add(sch);
					}
					
				}
		
		return addList;
	}
	
	//일정 넣어주기
	@RequestMapping(value="/mypage1/insert.do")
	public String insertSchedule(Scheduler sch, 
								RedirectAttributes redirectAttr) throws Exception {
		//jsp에서 처리못한 값들 처리해주기
		if(sch.getDYN()==null)
			sch.setDYN("N");
		
		sch.setEnabledYN("N");
		
		log.debug("sch={}", sch);
		
		//jsp의 날짜형식에 맞게 바꿔주기
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("sche", "good");
		
		int result = schedulerService.insertSchedule(sch);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("msg", "일정 등록 성공");
		}else {
			redirectAttr.addFlashAttribute("msg", "일정 등록 실패");
		}
		
		return "redirect:/mypage1/scheduler.do";
	}

	//일정 수정
	@RequestMapping("/mypage1/update.do")
	public String updateSchedule(Scheduler sch, 
									RedirectAttributes redirectAttr) throws Exception {
		
		//jsp에서 처리못한 값들 처리해주기
		if(sch.getDYN()==null)
			sch.setDYN("N");
		
		sch.setEnabledYN("N");
		
		log.debug("sch={}", sch);
		
		//jsp의 날짜형식에 맞게 바꿔주기
		redirectAttr = makeYearMonths(sch, redirectAttr);
		//c:if를 위한 내용없는 키
		redirectAttr.addFlashAttribute("sche", "good");
		
		int result = schedulerService.updateSchedule(sch);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("msg", "일정 수정 성공");
		}else {
			redirectAttr.addFlashAttribute("msg", "일정 수정 실패");
		}
		
		return "redirect:/mypage1/scheduler.do";
	}
	
	@RequestMapping("/mypage1/search.do")
	public String dDaySearch(@SessionAttribute("loginMember") Member member,
							RedirectAttributes redirectAttr) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		
		Scheduler sch = schedulerService.dDaySearch(map);
		
		//jsp의 날짜형식에 맞게 바꿔주기
		redirectAttr = makeYearMonths(sch, redirectAttr);
		//c:if를 위한 내용없는 키
		redirectAttr.addFlashAttribute("sche", "good");
		
		return "redirect:/mypage1/scheduler.do";
	}
	
	//jsp의 날짜형식에 맞게 바꿔서 보내주는 메소드
	public RedirectAttributes makeYearMonths(Scheduler sch, RedirectAttributes redirectAttr){
		
		SimpleDateFormat fm1 = new SimpleDateFormat("YYYY");
		SimpleDateFormat fm2 = new SimpleDateFormat("MM");
		SimpleDateFormat fm3 = new SimpleDateFormat("dd");
		
		String a = fm1.format(sch.getStartDate());
		int b = Integer.parseInt(fm2.format(sch.getStartDate()))-1;
		String c = fm3.format(sch.getStartDate());
		
		System.out.println("a="+a+", b="+b+", c="+c);
		
		redirectAttr.addFlashAttribute("Y", a);
		redirectAttr.addFlashAttribute("M", b);
		redirectAttr.addFlashAttribute("D", c);
		
		return redirectAttr;
	}
	
	//일정 삭제
	@RequestMapping("/scheduler/delete.do")
	public String deleteSchedule(@RequestParam("dNo") int dNo,
								RedirectAttributes redirectAttr) throws Exception {
		
		log.debug("dNo = {}", dNo);
		
		//날짜고정해주기 위해 내역불러오기
		Scheduler sch = schedulerService.selectOne(dNo);
		
		log.debug("sch={}", sch);
		
		//날짜고정
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("sche", "good");
		
		//이후에 삭제
		int result = schedulerService.deleteSchedule(dNo);
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "일정 삭제 성공");
		else
			redirectAttr.addFlashAttribute("msg", "일정 삭제 실패");
			
		return "redirect:/mypage1/scheduler.do";
	}
	
	//투두리스트 입력 (삭제 + 입력)
	@RequestMapping("/scheduler/todo.do")
	public String insertTodo(@RequestParam("content") String[] contents,
							@RequestParam("checked") boolean[] yn,
							@RequestParam("startDate") Date startDate,
							@SessionAttribute("loginMember") Member member,
							RedirectAttributes redirectAttr) {
		
		Scheduler sch = null;
		List<Scheduler> list = new ArrayList<>();
		
		//객체화 및 list 넣기
		for(int i = 0 ; i<contents.length;i++) {

			sch = new Scheduler();

			sch.setMemberId(member.getMemberId());
			sch.setStartDate(startDate);
			sch.setEndDate(startDate);
			sch.setContent(contents[i]);
			//체크박스 여부에 따라 입력
			String tempYn = yn[i] == true ? "Y" : "N";
			sch.setEnabledYN(tempYn);

			log.debug("sch={}", sch);
			list.add(sch);
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberId", member.getMemberId());
		map.put("startDate", startDate);
		
		//이전내역삭제
		int result = schedulerService.deleteTodo(map); 
		
		//새로등록
		result = schedulerService.insertTodo(list);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("todo", "good");
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "리스트 저장 성공");
		else
			redirectAttr.addFlashAttribute("msg", "리스트 저장 실패");
		
		return "redirect:/mypage1/scheduler.do";
	}
	
	//투두리스트 전체삭제
	@RequestMapping("/scheduler/delTodo.do")
	public String deleteTodo(@RequestParam("startDate") Date startDate,
							@SessionAttribute("loginMember") Member member,
							RedirectAttributes redirectAttr) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberId", member.getMemberId());
		map.put("startDate", startDate);
		
		//삭제
		int result = schedulerService.deleteTodo(map);
		
		//해당날짜로 날짜잡아주기
		Scheduler sch = new Scheduler();
		sch.setStartDate(startDate);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("todo", "good");
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "리스트 삭제 성공");
		else
			redirectAttr.addFlashAttribute("msg", "리스트 삭제 성공");
		
		return "redirect:/mypage1/scheduler.do";
			
	}

		@RequestMapping("/mypage1/goTodo.do")
		public String goTodo(@SessionAttribute("loginMember") Member member,
								RedirectAttributes redirectAttr) {
			
			//오늘날짜 기입
			Scheduler sch = new Scheduler();
			sch.setStartDate(new Date(new java.util.Date().getTime()));
			
			redirectAttr = makeYearMonths(sch, redirectAttr);
			redirectAttr.addFlashAttribute("todo", "good");
			
			return "redirect:/mypage1/scheduler.do";
		}
	
}

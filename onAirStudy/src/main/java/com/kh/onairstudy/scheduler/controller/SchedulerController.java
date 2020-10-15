package com.kh.onairstudy.scheduler.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.scheduler.model.service.SchedulerService;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/scheduler")
@Controller
public class SchedulerController {

	@Autowired
	private SchedulerService schedulerService;
	
	@RequestMapping("/main.do")
	public ModelAndView mainScheduler(ModelAndView mav, HttpSession session) {

		//내역가져오기
		List<Scheduler> addList = makeScheduleArrays(session);
		
		//확인
//		for(Scheduler sch : addList) {
//			System.out.println(sch);
//		}
		
		mav.addObject("list", addList);
		mav.setViewName("scheduler/scheduler");
		
		return mav;
		
		
	}
	
	
	public List<Scheduler> makeScheduleArrays(HttpSession session){
				
		//로그인된 아이디 가져오기
				String memberId = (String)session.getAttribute("memberId");
				
				//잘됐는지 체크해보려고 하는 push~
				
				//임시
				memberId = "honggd";
				
				List<Scheduler> list = schedulerService.mainScheduler(memberId);
				List<Scheduler> addList = new ArrayList<>();

				Calendar c1 = Calendar.getInstance();
				Calendar c2 = Calendar.getInstance();
				
				for(Scheduler sch : list) {
					Date start = sch.getStartDate();
					Date end = sch.getEndDate();
					
					c1.setTime(start);
					c2.setTime(end);
					
					//시작날짜가 끝날짜보다 작을때만!
					if(start.compareTo(end) < 0) {
						//원객체
						addList.add(sch);
						
						//하루씩 더한 객체
						while(c1.compareTo(c2)!=0) {
							
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
	
	@RequestMapping("/insert.do")
	public String insertSchedule(Scheduler sch, 
								RedirectAttributes redirectAttr) throws Exception {
		if(sch.getDYN()==null)
			sch.setDYN("N");
		
		sch.setEnabledYN("N");
		
		System.out.println("sch="+sch);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		
		int result = schedulerService.insertSchedule(sch);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("msg", "일정 등록 성공");
		}else {
			redirectAttr.addFlashAttribute("msg", "일정 등록 실패");
		}
			
		return "redirect:/scheduler/main.do";
	}
	
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
	
	@RequestMapping("/delete.do")
	public String deleteSchedule(@RequestParam("no") int no,
								RedirectAttributes redirectAttr) throws Exception {
		System.out.println("no="+no);
		
		Scheduler sch = schedulerService.selectOne(no);
		System.out.println("sch="+sch);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("del", "del");
		
		int result = schedulerService.deleteSchedule(no);
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "일정 삭제 성공");
		else
			redirectAttr.addFlashAttribute("msg", "일정 삭제 실패");
			
		return "redirect:/scheduler/main.do";
	}
}

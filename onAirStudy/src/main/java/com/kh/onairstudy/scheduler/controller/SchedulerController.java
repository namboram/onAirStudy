package com.kh.onairstudy.scheduler.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		//로그인된 아이디 가져오기
		String memberId = (String)session.getAttribute("memberId");
		
		//잘됐는지 체크해보려고 하는 push~
		
		//임시
		memberId = "honggd";
		
		List<Map<String, Object>> list = schedulerService.mainScheduler(memberId);
		
		log.debug("list = {}", list);
		
		mav.addObject("list", list);
		mav.setViewName("scheduler/scheduler");
		
		return mav;
		
		
	}
	
	@RequestMapping("/insert.do")
	public String insertSchedule(Scheduler sch, 
								RedirectAttributes redirectAttr) throws Exception {
		if(sch.getDYN()==null)
			sch.setDYN("N");
		
		sch.setEnabledYN("N");
		System.out.println(sch);
		int result = schedulerService.insertSchedule(sch);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("msg", "일정 등록 성공");
		}else {
			redirectAttr.addFlashAttribute("msg", "일정 등록 실패");
		}
		
		return "redirect:/scheduler/main.do";
	}
}

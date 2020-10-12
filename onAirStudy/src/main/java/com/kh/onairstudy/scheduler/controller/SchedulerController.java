package com.kh.onairstudy.scheduler.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.scheduler.model.service.SchedulerService;

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
		
		//임시
		memberId = "honggd";
		
		List<Map<String, Object>> list = schedulerService.mainScheduler(memberId);
		
		log.debug("list = {}", list);
		
		mav.addObject("list", list);
		mav.setViewName("scheduler/scheduler");
		
		return mav;
		
		
	}
}

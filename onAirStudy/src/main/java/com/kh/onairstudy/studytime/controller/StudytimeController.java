package com.kh.onairstudy.studytime.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.attendance.model.service.AttendanceService;
import com.kh.onairstudy.attendance.model.vo.Attendance;
import com.kh.onairstudy.scheduler.model.service.SchedulerService;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;
import com.kh.onairstudy.studytime.model.service.StudytimeService;
import com.kh.onairstudy.studytime.model.vo.Studytime;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class StudytimeController {
	
	@Autowired
	private StudytimeService studytimeService;
	
	@Autowired
	private AttendanceService attendanceService; 
	
	@Autowired
	private SchedulerService schedulerService;
	
	

	@RequestMapping("/mypage1_index.do")
	public String studytimeList(Model model) {
		
		List<Studytime> studytimeList = studytimeService.selectList();
		List<Attendance> attendList = attendanceService.selectList();
		
		log.info("studytimeList= {}", studytimeList);
		
		model.addAttribute("studytimeList",studytimeList);
		model.addAttribute("attendList" , attendList );
		
		
		return "mypage1/mypage1_index";
		
	}
	
	
	
}

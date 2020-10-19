package com.kh.onairstudy.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.scheduler.model.service.SchedulerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {

	@Autowired
	private SchedulerService schedulerService;
	

	@RequestMapping("/admin/main.do")
	public String adminMain(ModelAndView mav, HttpSession session) {
			
		//session role
		
		
		
		return "/admin/adminIndex"; 
	}
	
	
}

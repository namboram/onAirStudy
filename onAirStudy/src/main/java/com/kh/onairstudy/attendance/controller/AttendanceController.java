package com.kh.onairstudy.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.attendance.model.service.AttendanceService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attend")
@Slf4j
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService; 
	
	
	@RequestMapping("/mypage1.do")
	public String mypage1() {
		return "mypage1/side-bar1";
	}

	
	@RequestMapping("/mypage2.do")
	public String mypage2() {
		return "mypage2/side-bar2";
	}
}

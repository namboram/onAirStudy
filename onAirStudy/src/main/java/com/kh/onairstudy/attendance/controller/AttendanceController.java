package com.kh.onairstudy.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.attendance.model.service.AttendanceService;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attend")
@Slf4j
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService; 
	
	@RequestMapping("/mypage1.do")
	public String mypage1() {
		return "mypage1/mypage1_index";
	}
	
	@RequestMapping("/mypage2.do")
	public String mypage2() {
		return "mypage2/mypage2";
	}
	
//	@RequestMapping("/mypage2.do")
//	public ModelAndView mypage2(ModelAndView mav) {
//		
//		Map<String, Object> map = new HashMap<>();
//		List<StudyRoomLog> participants = new ArrayList<>();
//		
//		
//		
//		return mav;
//	}

	
}

package com.kh.onairstudy.attendance.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.attendance.model.service.AttendanceService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attend")
@Slf4j
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService; 
	

	@RequestMapping("/check.do")
	public String attendCheck(@RequestParam("id") String memberId,
							  @RequestParam("roomNum") int roomNum,
							  RedirectAttributes redirectAttr, HttpSession session ) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("roomNum", roomNum);
		
		int attendCnt = attendanceService.getAttendCnt(param);
		
		param.put("attendCnt", attendCnt+1);
	
		int result = attendanceService.updateAttendance(param);
		String msg = result == 0 ? "출석체크에 실패하였습니다." : "출석체크에 성공하였습니다";
		
		redirectAttr.addAttribute("roomNum"	, roomNum);
		redirectAttr.addFlashAttribute("msg", msg);
		
		if(result == 1) {
			session.setAttribute("attendAlready", "yes");
		}
		
		return "redirect:/studyroom/main.do";
	}
	
	
	
	@RequestMapping("/new.do")
	public String index() {
		return "/attendance/new";
	}
	
}

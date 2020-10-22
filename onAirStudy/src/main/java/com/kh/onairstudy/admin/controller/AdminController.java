package com.kh.onairstudy.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.admin.model.service.AdminService;
import com.kh.onairstudy.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	

	@RequestMapping("/admin/main.do")
	public String adminMain(ModelAndView mav) {
			
		
		
		
		return "/admin/adminIndex"; 
	}
	
	@RequestMapping("/admin/memberList.do")
	public ModelAndView adminMemberList(ModelAndView mav,
										@RequestParam(value="selectedWhere",
														required=false)String w,
										@RequestParam(value="selectedContent",
										required=false)String c) {
		
		System.out.println("흠냐뤼ㅏ"+w);
		System.out.println("흠냐뤼ㅏ"+c);
		List<Member> list = adminService.memberList();
		System.out.println("list="+list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/admin/memberDetail.do")
	public ModelAndView memberDetail(@RequestParam("mid") String memberId, ModelAndView mav) {
		
		System.out.println(memberId);
		
		Map<String, Object> map = adminService.memberDetail(memberId);
		System.out.println(map);
		
		mav.addObject("m", map);
		
		return mav;
	}
	
	@RequestMapping("/admin/serviceList.do")
	public ModelAndView serviceList(ModelAndView mav, HttpServletResponse response) {
		
		List<Map<String, Object>> map = adminService.serviceList();
		System.out.println("map="+map);
		
		mav.addObject("list", map);
		
		return mav;
	}
	
	@RequestMapping("/admin/serviceDetail.do")
	public ModelAndView serviceDetail(ModelAndView mav,
									@RequestParam("no")String no) {
		
		return mav;
	}
	
	
}

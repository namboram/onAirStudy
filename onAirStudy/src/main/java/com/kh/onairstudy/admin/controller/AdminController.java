package com.kh.onairstudy.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.admin.model.service.AdminService;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;

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
										@RequestParam(value="searchType",
														required=false)String searchType,
										@RequestParam(value="searchContent",
										required=false)String searchKeyword) {
		
		Map<String, Object> search = new HashMap<>();
		
		System.out.println("ss="+searchKeyword);
		
		if(searchType!=null && searchKeyword !=null) {
			search.put("searchType", searchType);
			search.put("searchKeyword", searchKeyword);
		}

		System.out.println("search="+search);
		
		List<Member> list = adminService.memberList(search);
		System.out.println("list="+list);
		
		mav.addObject("search", search);
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
	public ModelAndView serviceList(ModelAndView mav, HttpServletRequest request) {
		
		String searchType = (String)request.getParameter("searchType");
		String searchKeyword = (String)request.getParameter("searchContent");
		
		Map<String, Object> search = new HashMap<>();
		
		if(searchType != null && searchKeyword != null) {
			search.put("searchType", searchType);
			search.put("searchKeyword", searchKeyword);
		}
		
		System.out.println("search = "+search);
		List<Map<String, Object>> map = adminService.serviceList(search);
		System.out.println("map="+map);
		
		mav.addObject("search", search);
		mav.addObject("list", map);
		
		return mav;
	}
	
	@RequestMapping("/admin/serviceDetail.do")
	public ModelAndView serviceDetail(ModelAndView mav,
									@RequestParam("no")int no) {
		
		System.out.println("no="+no);
		
		Map<String, Object> sv = adminService.serviceDetail(no);
		Map<String, Object> av = adminService.serviceDetailAv(no);
		
		
		mav.addObject("sv", sv);
		mav.addObject("av", av);
		
		return mav;
	}
	
	@RequestMapping("/admin/insertService.do")
	public String insertService(ServiceCenter sc, 
								RedirectAttributes redirectAttr, 
								@RequestParam("replyNo") int replyNo) {
		System.out.println("sc="+sc);
		sc.setReply_no(replyNo);
		
		int result = adminService.insertService(sc);
		if(result>0)
			System.out.println("등록성공");
		else
			System.out.println("등록실패");
		
		result = adminService.updateService(replyNo);
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "답변 등록 성공!");
		else
			redirectAttr.addFlashAttribute("msg", "답변 등록 실패!");
		
		return "redirect:/service/serviceList.do";
	}
	
	@RequestMapping(value="/admin/reportList.do")
	public ModelAndView reportList(ModelAndView mav,
									@RequestParam(value="searchContent", required=false) String searchContent) {
		
		//mepper에서 if test문 작성하기 위해 map에 넣어서 전송
		Map<String, Object> map = new HashMap<>();
		map.put("searchContent", searchContent);
		
		List<Map<String, Object>> list = adminService.reportList(map);
		System.out.println("list = "+list);
		
		mav.addObject("list", list);
		mav.addObject("searchContent", searchContent);
		return mav;
	}
	
	@RequestMapping("/admin/showModal.do")
	@ResponseBody
	public Map<String, Object> showModal(@RequestParam("category") String category,
										@RequestParam("no") String no)
										throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("no", no);
		
		Map<String, Object> cont = new HashMap<>();
		
		cont = adminService.showModal(map);
		
		return cont;
	}
	
	
	
	
}

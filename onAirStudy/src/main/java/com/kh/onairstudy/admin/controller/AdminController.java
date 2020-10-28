package com.kh.onairstudy.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ModelAndView adminMain(ModelAndView mav, HttpServletRequest request) {
			
		//정보 몽땅 가져오기
		Map<String, Object> map = adminService.adminMain();
		
		//오늘 날짜
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		String today = df.format(date);
		map.put("today", today);
		
		//그래프 정보
		List<Map<String, Object>> memberAll = adminService.memberAll();		
		
		log.debug("map ={}", map);
		log.debug("memberAll={}", memberAll);
		
		request.setAttribute("map", map);
		mav.addObject("memberAll", memberAll);
		mav.setViewName("admin/adminIndex");
		
		return mav; 
	}
	
	//관리자 마이페이지 문의사항 카운트
	@RequestMapping("/admin/serviceCnt.do")
	@ResponseBody
	public int serviceCnt() {
		
		int result = adminService.serviceCnt();
		
		return result;
	}
	
	@RequestMapping("/admin/memberList.do")
	public Model adminMemberList(Model model,
								@RequestParam(value="searchType",
								required=false)String searchType,
								@RequestParam(value="searchContent",
								required=false)String[] searchKeyword) {
		
		Map<String, Object> search = new HashMap<>();
		
		log.debug("ss={}", searchKeyword);
		
		if(searchType!=null && searchKeyword !=null) {

			search.put("searchType", searchType);
			search.put("searchKeyword", searchKeyword[0]);
			
			if(searchKeyword.length > 1)
				search.replace("searchKeyword", searchKeyword[1]);
				
		}

		log.debug("search={}", search);
		
		List<Member> list = adminService.memberList(search);
		log.debug("list={}", list);

		model.addAttribute("search", search);
		model.addAttribute("list", list);
		
		return model;
	}
	
	@RequestMapping("/admin/memberDetail.do")
	public ModelAndView memberDetail(@RequestParam("mid") String memberId, ModelAndView mav) {
		
		log.debug("memberId ={}", memberId);
		
		Map<String, Object> map = adminService.memberDetail(memberId);
		log.debug("map={}",map);
		
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
		
		log.debug("search = {}",search);
		List<Map<String, Object>> map = adminService.serviceList(search);
		log.debug("map={}",map);
		
		mav.addObject("search", search);
		mav.addObject("list", map);
		
		return mav;
	}
	
	@RequestMapping("/admin/serviceDetail.do")
	public ModelAndView serviceDetail(ModelAndView mav,
									@RequestParam("no")int no) {
		
		log.debug("no={}",no);
		
		Map<String, Object> sv = adminService.serviceDetail(no);
		Map<String, Object> av = adminService.serviceDetailAv(no);
		
		
		mav.addObject("sv", sv);
		mav.addObject("av", av);
		
		return mav;
	}
	
	@RequestMapping("/admin/insertService.do")
	public String insertService(ServiceCenter sc, 
								@RequestParam("replyNo") int replyNo) {
		log.debug("sc={}",sc);
		sc.setReply_no(replyNo);
		
		int result = adminService.insertService(sc);
		if(result>0)
			log.debug("등록성공");
		else
			log.debug("등록실패");
		
		result = adminService.updateService(replyNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", sc.getMemberId());
		map.put("content", "문의하신 게시글에 관리자의 답변이 올라왔습니다.");
		
		result = adminService.sendMessage(map);
		
		return "redirect:/admin/serviceDetail.do?no="+replyNo;
	}
	
	@RequestMapping(value="/admin/reportList.do")
	public ModelAndView reportList(ModelAndView mav,
									@RequestParam(value="searchContent", required=false) String searchContent) {
		
		//mepper에서 if test문 작성하기 위해 map에 넣어서 전송
		Map<String, Object> map = new HashMap<>();
		
		if(searchContent != null)
			map.put("searchContent", searchContent);
		else
			map.clear();
		
		log.debug("map ={}", map);
		
		List<Map<String, Object>> list = adminService.reportList(map);
		log.debug("list = {}",list);
		
		mav.addObject("list", list);
		
		if(searchContent != null)
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
	
	@RequestMapping("/admin/studyList.do")
	public ModelAndView studyList(ModelAndView mav,
								@RequestParam(value="searchType",
								required=false)String searchType,
								@RequestParam(value="searchContent",
								required=false)String[] searchKeyword) {
		
		Map<String, Object> search = new HashMap<>();
		
		log.debug("ss={}", searchKeyword);
		
		if(searchType!=null && searchKeyword !=null) {
				
			search.put("searchType", searchType);
			search.put("searchKeyword", searchKeyword[0]);
			
			if(searchKeyword.length > 1)
				search.replace("searchKeyword", searchKeyword[1]);
		}

		log.debug("search={}", search);
		
		List<Map<String, Object>> list = adminService.studyList(search);
		log.debug("list={}", list);
		
		mav.addObject("search", search);
		mav.addObject("list", list);
		
		
		return mav;
	}
	
	@RequestMapping("/admin/studyDetail.do")
	public Model studyDetail(Model model,
							@RequestParam("no") int no) {
		
		log.debug("no = {}", no);
		
		Map<String, Object> map = adminService.studyDetail(no);
		List<String> list = adminService.studyMembers(no);
		
		log.debug("map={}", map);
		log.debug("list={}", list);
		
		model.addAttribute("s", map);
		model.addAttribute("list", list);
		
		return model;
	}
	
	@RequestMapping("/admin/studyDelete.do")
	public String studyDelete(@RequestParam("no") int no,
								RedirectAttributes redirectAttr) {
		
		int result = adminService.studyDelete(no);
		
		if(result > 0)
			redirectAttr.addFlashAttribute("msg", "방 삭제처리 완료");
		else
			redirectAttr.addFlashAttribute("msg", "방 삭제처리 완료");
			
		
		return "redirect:/admin/studyDetail.do?no="+no;
	}
	
	@RequestMapping("/admin/updateReport.do")
	public String updateReport(@RequestParam("no")int no,
								@RequestParam(value="searchContent",
								required=false) String searchContent,
								RedirectAttributes redirectAttr) {
		
		log.debug("no={}", no);
		log.debug("searchContent={}", searchContent);
		
		int result = adminService.updateReport(no);
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "신고 무효처리 성공");
		else
			redirectAttr.addFlashAttribute("msg", "신고 무효처리 실패");
		
		if(searchContent != null)
			return "redirect:/admin/reportList.do?searchContent="+searchContent;
		
		return "redirect:/admin/reportList.do";
	}
	
	@RequestMapping("/admin/messageCnt.do")
	@ResponseBody
	public int messageCnt() {
		
		int result = adminService.messageCnt();
		log.debug("result={}", result);
		
		return result;
	}
}

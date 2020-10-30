package com.kh.onairstudy.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	
	//페이징 메소드
	public static String getPageBarHtml(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pageBar = new StringBuilder();

		// cPage앞에 붙을 구분자를 지정
		char delim = url.indexOf("?") > -1 ? '&' : '?';
		url = url + delim;

		int pageBarSize = 5; // 페이지바에 나열될 페이지번호의 개수
		// 115 / 10 => 12
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);

		// x * pageBarSize + 1
		// 1 2 3 4 5 -> 1
		// 6 7 8 9 10 -> 6
		// 11 12 13 14 15 -> 11
		int pageStart = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageStart + pageBarSize - 1;
		int pageNo = pageStart;

		// 이전
		if (pageNo == 1) {

		} else {
			pageBar.append("<a href='" + url + "cPage=" + (pageNo - 1) + "'>이전</a>\n");
		}

		// PageNo
		while (pageNo <= pageEnd && pageNo <= totalPage) {
			// 현재페이지인 경우
			if (pageNo == cPage) {
				pageBar.append("<span class='cPage'>" + pageNo + "</span>\n");
			}
			// 현재페이지가 아닌 경우
			else {
				pageBar.append("<a href='" + url + "cPage=" + pageNo + "'>" + pageNo + "</a>\n");
			}
			pageNo++;
		}
		// 다음
		if (pageNo > totalPage) {

		} else {
			pageBar.append("<a href='" + url + "cPage=" + pageNo + "'>다음</a>\n");
		}

		return pageBar.toString();
	}

	//메인
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
	
	//관리자 마이페이지 문의사항 갯수
	@RequestMapping("/admin/serviceCnt.do")
	@ResponseBody
	public int serviceCnt() {
		
		int result = adminService.serviceCnt();
		
		return result;
	}
	
	//회원관리
	@RequestMapping("/admin/memberList.do")
	public Model adminMemberList(Model model,
								@RequestParam(value="searchType",
								required=false)String searchType,
								@RequestParam(value="searchKeyword",
								required=false)String[] searchKeyword,
								HttpServletRequest request, HttpServletResponse response) {
		// 1. 파라미터값 변수에 담기
		int numPerPage = 15;// 한페이지당 수
		int cPage = 1;// 요청페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {

		}

		Map<String, Object> search = new HashMap<>();

		//리퀘온 주소
		String url = request.getRequestURI();
		
		if(searchType!=null && searchKeyword !=null) {

			search.put("searchType", searchType);
			search.put("searchKeyword", searchKeyword[0]);
			
			if(searchKeyword.length > 1)
				search.replace("searchKeyword", searchKeyword[1]);
			
		url += "?searchType="+search.get("searchType")+"&searchKeyword="+search.get("searchKeyword");
				
		}
		
		//전체수, 전체페이지수 구하기
		int totalContents = adminService.totalMember(search);

		String pageBar = getPageBarHtml(cPage, numPerPage, totalContents, url);
		
		log.debug("pageBar={}", pageBar);
		
		log.debug("totalContents ={}", totalContents);
		
		//rnum 넣어주기
		search.put("start", (cPage-1)*numPerPage+1);
		search.put("end", cPage*numPerPage);
		
		log.debug("search={}", search);
		
		List<Member> list = adminService.memberList(search);
		log.debug("list={}", list);

		model.addAttribute("search", search);
		model.addAttribute("list", list);
		model.addAttribute("pageBar", pageBar);
		
		return model;
	}
	
	//회원상세
	@RequestMapping("/admin/memberDetail.do")
	public ModelAndView memberDetail(@RequestParam("mid") String memberId, ModelAndView mav) {
		
		log.debug("memberId ={}", memberId);
		
		Map<String, Object> map = adminService.memberDetail(memberId);
		log.debug("map={}",map);
		
		mav.addObject("m", map);
		
		return mav;
	}
	
	//문의사항
	@RequestMapping("/admin/serviceList.do")
	public ModelAndView serviceList(ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {

		// 1. 파라미터값 변수에 담기
		int numPerPage = 10;// 한페이지당 수
		int cPage = 1;// 요청페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		}

		String searchType = (String) request.getParameter("searchType");
		String searchKeyword = (String) request.getParameter("searchKeyword");

		// 리퀘온 주소
		String url = request.getRequestURI();

		Map<String, Object> search = new HashMap<>();

		if (searchType != null && searchKeyword != null) {
			search.put("searchType", searchType);
			search.put("searchKeyword", searchKeyword);

			url += "?searchType=" + search.get("searchType") + "&searchKeyword=" + search.get("searchKeyword");

		}

		// 전체수, 전체페이지수 구하기
		int totalContents = adminService.totalService(search);

		String pageBar = getPageBarHtml(cPage, numPerPage, totalContents, url);

		log.debug("pageBar={}", pageBar);

		log.debug("totalContents ={}", totalContents);

		// rnum 넣어주기
		search.put("start", (cPage - 1) * numPerPage + 1);
		search.put("end", cPage * numPerPage);

		log.debug("search={}", search);

		List<Map<String, Object>> map = adminService.serviceList(search);
		log.debug("map={}", map);

		mav.addObject("search", search);
		mav.addObject("list", map);
		mav.addObject("pageBar", pageBar);

		return mav;
	}
	
	//문의상세
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
	
	//문의답변
	@RequestMapping("/admin/insertService.do")
	public String insertService(ServiceCenter sc, 
								@RequestParam("replyNo") int replyNo) {
		log.debug("sc={}",sc);
		sc.setReplyNo((replyNo));
		
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
	
	//신고내역
	@RequestMapping(value="/admin/reportList.do")
	public ModelAndView reportList(ModelAndView mav,
									@RequestParam(value="searchKeyword", required=false) String searchKeyword,
									HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 파라미터값 변수에 담기
		int numPerPage = 10;// 한페이지당 수
		int cPage = 1;// 요청페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		}
		
		//mepper에서 if test문 작성하기 위해 map에 넣어서 전송
		Map<String, Object> search = new HashMap<>();
		
		// 리퀘온 주소
		String url = request.getRequestURI();

		if(searchKeyword != null) {
			search.put("searchKeyword", searchKeyword);
			
			url += "?searchType=" + search.get("searchType") + "&searchKeyword=" + search.get("searchKeyword");
		}
		
		// rnum 넣어주기
		search.put("start", (cPage - 1) * numPerPage + 1);
		search.put("end", cPage * numPerPage);

		log.debug("search={}", search);
		
		// 전체수, 전체페이지수 구하기
		int totalContents = adminService.totalReport(search);

		String pageBar = getPageBarHtml(cPage, numPerPage, totalContents, url);

		log.debug("pageBar={}", pageBar);

		log.debug("totalContents ={}", totalContents);
		
		List<Map<String, Object>> list = adminService.reportList(search);
		log.debug("list = {}",list);
		
		mav.addObject("list", list);
		mav.addObject("pageBar", pageBar);
		
		if(searchKeyword != null)
			mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	//신고 내용 모달
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
	
	//그룹관리
	@RequestMapping("/admin/studyList.do")
	public ModelAndView studyList(ModelAndView mav,
								@RequestParam(value="searchType",
								required=false)String searchType,
								@RequestParam(value="searchKeyword",
								required=false)String[] searchKeyword,
								HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 파라미터값 변수에 담기
		int numPerPage = 10;// 한페이지당 수
		int cPage = 1;// 요청페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		}

		Map<String, Object> search = new HashMap<>();
		
		log.debug("searchType={}", searchType);
		log.debug("searchKeyword={}", searchKeyword);

		// 리퀘온 주소
		String url = request.getRequestURI();

		if (searchType != null && searchKeyword != null) {

			search.put("searchType", searchType);
			search.put("searchKeyword", searchKeyword[0]);

			if (searchKeyword.length > 1)
				search.replace("searchKeyword", searchKeyword[1]);

			url += "?searchType=" + search.get("searchType") + "&searchKeyword=" + search.get("searchKeyword");
		}

		// rnum 넣어주기
		search.put("start", (cPage - 1) * numPerPage + 1);
		search.put("end", cPage * numPerPage);

		log.debug("search={}", search);

		// 전체수, 전체페이지수 구하기
		int totalContents = adminService.totalStudy(search);

		String pageBar = getPageBarHtml(cPage, numPerPage, totalContents, url);

		log.debug("pageBar={}", pageBar);

		log.debug("totalContents ={}", totalContents);

		List<Map<String, Object>> list = adminService.studyList(search);
		log.debug("list={}", list);

		mav.addObject("search", search);
		mav.addObject("list", list);
		mav.addObject("pageBar", pageBar);
		
		return mav;
	}
	
	//그룹상세
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
	
	//그룹삭제
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
	
	//신고무효처리
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
	
	//관리자 마이페이지 쪽지갯수
	@RequestMapping("/admin/messageCnt.do")
	@ResponseBody
	public int messageCnt() {
		
		int result = adminService.messageCnt();
		log.debug("result={}", result);
		
		return result;
	}
}

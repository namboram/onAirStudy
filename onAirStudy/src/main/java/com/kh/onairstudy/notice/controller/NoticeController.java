package com.kh.onairstudy.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.admin.controller.AdminController;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.notice.model.service.NoticeService;
import com.kh.onairstudy.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/notice")
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model, HttpServletRequest request, HttpServletResponse response) {

		// 1. 파라미터값 변수에 담기
		int numPerPage = 10;// 한페이지당 수
		int cPage = 1;// 요청페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {

		}

		Map<String, Object> search = new HashMap<>();

		// 리퀘온 주소
		String url = request.getRequestURI();

		// 전체수, 전체페이지수 구하기
		int totalContents = noticeService.totalNotice();

		String pageBar = new AdminController().getPageBarHtml(cPage, numPerPage, totalContents, url);

		log.debug("pageBar={}", pageBar);

		log.debug("totalContents ={}", totalContents);

		// rnum 넣어주기
		search.put("start", (cPage - 1) * numPerPage + 1);
		search.put("end", cPage * numPerPage);

		log.debug("search={}", search);

		List<Map<String, Object>> list = noticeService.noticeList(search);

		model.addAttribute("list", list);

		log.debug("list={}", list);

		model.addAttribute("pageBar", pageBar);

		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(Model model,
								@RequestParam(value="no",
								required=false) String no,
								HttpServletRequest request, 
								HttpServletResponse response) {
		
		log.debug("no={}", no);
		
		int nNo = 0;
		
		if(no == null)
			return "notice/noticeDetail";
		else
			nNo = Integer.parseInt(no);
			
		//조회수 관련 처리
		Cookie[] cookies = request.getCookies();
		String cookieVal = "";
		boolean hasRead = false;//현재 요청(브라우져)에서 이 게시글을 이미 읽었는가 여부
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				
				if("cookie".equals(name)) {
					cookieVal = value;
//					System.out.println(name + " = " + value);
					
					//이번 게시글 읽음 여부
					if(value.contains("[" + nNo + "]")) {
						hasRead = true;
						log.debug("hasRead={}", hasRead);
						break;
					}
					
				}
			}
		}
		
		log.debug("hasRead={}", hasRead);
		
		//게시글을 읽지 않은 경우
		if(hasRead == false) {
			Cookie cookie = new Cookie("cookie",
											cookieVal + "[" + nNo + "]");
			cookie.setMaxAge(365*24*60*60);//영속쿠키
			// /mvc/board/view
			response.addCookie(cookie);
			
			int result = noticeService.updateCnt(nNo);
			log.debug("result={}", result);
		}
		
		
		Map<String, Object> map = noticeService.noticeDetail(nNo);
		
		model.addAttribute("map", map);
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping("/noticeInsert.do")
	public String noticeInsert(@RequestParam("title") String title,
								@RequestParam("content") String content,
								RedirectAttributes re) {
		
		log.debug("title={}", title);
		log.debug("content={}", content);
		
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		
		int result = noticeService.noticeInsert(map);
		
		if(result>0)
			re.addFlashAttribute("msg", "공지 등록 성공");
		else
			re.addFlashAttribute("msg", "공지 등록 실패");
		
		return "redirect:/notice/noticeList.do";
	}
	
	@RequestMapping("/noticeUpdate.do")
	public String noticeUpdate(Notice notice, RedirectAttributes re) {
		
		log.debug("notice={}", notice);
		
		int result = noticeService.noticeUpdate(notice);
		
		if(result>0)
			re.addFlashAttribute("msg", "공지 수정 성공");
		else
			re.addFlashAttribute("msg", "공지 수정 실패");
		
		return "redirect:/notice/noticeList.do";
	}
	
}

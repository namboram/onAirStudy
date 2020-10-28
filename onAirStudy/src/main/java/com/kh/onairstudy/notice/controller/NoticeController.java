package com.kh.onairstudy.notice.controller;

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

import com.kh.onairstudy.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/notice")
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {


		
		List<Map<String, Object>> list = noticeService.noticeList();
		model.addAttribute("list", list);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(Model model,
								@RequestParam("no") int no,
								HttpServletRequest request, 
								HttpServletResponse response) {
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
					if(value.contains("[" + no + "]")) {
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
											cookieVal + "[" + no + "]");
			cookie.setMaxAge(365*24*60*60);//영속쿠키
			// /mvc/board/view
			response.addCookie(cookie);
			
			int result = noticeService.updateCnt(no);
			log.debug("result={}", result);
		}
		
		
		Map<String, Object> map = noticeService.noticeDetail(no);
		
		model.addAttribute("map", map);
		
		return "notice/noticeDetail";
	}
	
}

package com.kh.onairstudy.notice.controller;

import java.util.List;
import java.util.Map;

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
								@RequestParam("no") int no) {
		
		Map<String, Object> map = noticeService.noticeDetail(no);
		
		model.addAttribute("map", map);
		
		return "notice/noticeDetail";
	}
	
}

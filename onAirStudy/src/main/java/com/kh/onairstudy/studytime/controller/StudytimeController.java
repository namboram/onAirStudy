package com.kh.onairstudy.studytime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.studytime.model.service.StudytimeService;
import com.kh.onairstudy.studytime.model.vo.Studytime;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class StudytimeController {
	
	@Autowired
	private StudytimeService studytimeService;

	@RequestMapping("/mypage1_index.do")
	public String studytimeList(Model model) {
		
		List<Studytime> studytimeList = studytimeService.selectList();
		
		log.info("studytimeList= {}", studytimeList);
		
		model.addAttribute("studytimeList",studytimeList);
		
		
		return "mypage1/mypage1_index";
		
	}
	
	
	
}

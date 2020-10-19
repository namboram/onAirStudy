package com.kh.onairstudy.test.controller;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.test.model.service.TestService;
import com.kh.onairstudy.test.model.vo.Test;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/test")
@Slf4j
public class TestController {

	@Autowired
	private TestService testService;
	
	@RequestMapping("/questionForm.do")
	public String questionFrom() {
		return "mypage2/mypage2_question";
	}
	
	@RequestMapping(value = "/testquestion.do", method = RequestMethod.POST)
	public String testQuestion( Test test,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles,
			RedirectAttributes redirectAttr, HttpServletRequest request) throws IllegalStateException, IOException{
	
		
		
		
		return "testquestion.do";
	}
	
	@RequestMapping("/pretest.do")
	public String pretest() {
		return "mypage2/mypage2_test";
	}
}

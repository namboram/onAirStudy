package com.kh.onairstudy.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.common.Utils;
import com.kh.onairstudy.test.model.service.TestService;
import com.kh.onairstudy.test.model.vo.Test;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping
@Slf4j
public class TestController {

	@Autowired
	private TestService testService;
	
	@RequestMapping("mypage2/mypage2_question.do")
	public String mypage2_question() {
		return "test/questionForm";
	}
	
	@RequestMapping(value = "mypage2/testquestion.do", method = RequestMethod.POST)
	public String testQuestion( Test test, 	@RequestParam(value = "upFile", required = false) MultipartFile upFile,
								@RequestParam Map<String, String> param, @RequestParam("testAnswer") int answer, RedirectAttributes redirectAttr, 
								HttpServletRequest request) throws IllegalStateException, IOException{
		
		String question = request.getParameter("testQeustion");
		String c1 = request.getParameter("testChoice_1");
		String c2 = request.getParameter("testChoice_2");
		String c3 = request.getParameter("testChoice_3");
		String c4 = request.getParameter("testChoice_4");
		
		
		String saveDirectory = request.getServletContext().getRealPath("/resources/testPic");
		String renamedFilename = Utils.getRenamedFileName(upFile.getOriginalFilename());
//		if(upFile.isEmpty()) continue;
			
		File dest = new File(saveDirectory, renamedFilename);
		upFile.transferTo(dest);
		
		test.setFilePath(saveDirectory);
		test.setRenamedFilename(renamedFilename);
		test.setTestAnswer(answer);
		test.setTestQuestion(question);
		test.setTestChoice_1(c1);
		test.setTestChoice_2(c2);
		test.setTestChoice_3(c3);
		test.setTestChoice_4(c4);		
		int result = testService.insertQuestion(test);
		
		redirectAttr.addFlashAttribute("msg", result>0 ? "문제를 등록하였습니다." :"문제 등록 중 오류가 발생했습니다.");
		
		return "redirect:/mypage2/mypage2_question.do";
	}
	
	@RequestMapping("mypage2/pretest.do")
	public String pretest() {
		return "test/pre-test";
	}
}

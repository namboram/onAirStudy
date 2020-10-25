package com.kh.onairstudy.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
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
	public String testQuestion( Test test, 
			@RequestParam(value = "upFile", required = false) MultipartFile upFile, RedirectAttributes redirectAttr,
			HttpServletRequest request) throws IllegalStateException, IOException{
		
						
		String saveDirectory = request.getServletContext().getRealPath("/resources/testPic");
		String renamedFilename = Utils.getRenamedFileName(upFile.getOriginalFilename());
//		if(upFile.isEmpty()) continue;
			
		File dest = new File(saveDirectory, renamedFilename);
		upFile.transferTo(dest);
		
		test.setFilePath(saveDirectory);
		test.setRenamedFilename(renamedFilename);		
		
		int result = testService.insertQuestion(test);
		
		redirectAttr.addFlashAttribute("msg", "문제를 등록하였습니다.");
		
		return "redirect:/test/questionForm.do";
	}
	
	@RequestMapping("mypage2/pretest.do")
	public String pretest() {
		return "test/pre-test";
	}
}

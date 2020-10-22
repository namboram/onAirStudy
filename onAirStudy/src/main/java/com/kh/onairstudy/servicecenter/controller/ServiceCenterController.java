package com.kh.onairstudy.servicecenter.controller;

import java.util.List;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.servicecenter.model.service.ServiceCenterService;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;
	
	

	@RequestMapping("/servicecenter.do")
	public ModelAndView serviceList(ModelAndView mav) {
		
		List<ServiceCenter> serviceList = serviceCenterService.selectServiceList();
		List<ServiceContent> serviceContentList = serviceCenterService.selectServiceContentList();
	
		mav. addObject("serviceList", serviceList);
		mav. addObject("serviceContentList", serviceContentList);
		
		mav.setViewName("service/servicecenter");
		
		return mav;
	
	}
	

// 글쓰기폼
	@RequestMapping("/service/serviceForm.do")
	public String serviceForm() {
		return "service/serviceForm";
	}
	

	
	
//	게시글 등록
	@RequestMapping(value = "/service/insertService.do",
		    method = RequestMethod.POST)
		public String insertService(ServiceCenter servicecenter, 
							RedirectAttributes redirectAttr) {
		System.out.println("servicecenter = " + servicecenter);
		
		
		//업무로직
		int result = serviceCenterService.insertService(servicecenter);
		String msg = (result > 0) ? "문의글 등록 성공!" : "문의글 등록 실패!";
		System.out.println("msg = " + msg);
		
		
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "service/servicecenter";
		}
			
			
	
	

	
}

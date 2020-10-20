package com.kh.onairstudy.servicecenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.servicecenter.model.service.ServiceCenterService;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;
	
	
//	@RequestMapping("/servicecenter.do")
//	public String servicecenter() {
//		return "service/servicecenter";
//	}

	@RequestMapping("/servicecenter.do")
	public ModelAndView serviceList(ModelAndView mav) {
		
		List<ServiceCenter> serviceList = serviceCenterService.selectServiceList();
		List<ServiceContent> serviceContentList = serviceCenterService.selectServiceContentList();
	
		mav. addObject("serviceList", serviceList);
		mav. addObject("serviceContentList", serviceContentList);
		
		mav.setViewName("service/servicecenter");
		
		return mav;
	
	}
	
	
}

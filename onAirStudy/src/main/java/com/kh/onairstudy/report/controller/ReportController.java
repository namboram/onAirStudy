package com.kh.onairstudy.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onairstudy.report.model.service.ReportService;
import com.kh.onairstudy.report.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping
@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@RequestMapping(value="/report/insertReport.do",method=RequestMethod.POST)
	@ResponseBody
	public int insertReport(Report report) {
		int result=0;
		log.debug("report={}",report);
		return result;
		
	}
	
	
}

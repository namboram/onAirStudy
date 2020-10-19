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
		int result=reportService.insertReport(report);
		//log.info("report={}",report);
		//로그 검사 해서 유효 신고가 5번 이상일 경우 블랙리스트 등록
		int cnt = reportService.selectCntReport(report.getReportedMember());
		log.info("cnt={}",cnt);
		if(cnt >= 5) {
			log.info("report 5 이상! 블랙 등록필요!");
		}
		return result;
		
	}
	
	
}

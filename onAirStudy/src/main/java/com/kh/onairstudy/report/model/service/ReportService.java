package com.kh.onairstudy.report.model.service;

import com.kh.onairstudy.report.model.vo.Report;

public interface ReportService {

	int insertReport(Report report);

	int selectCntReport(String reportedMember);

}

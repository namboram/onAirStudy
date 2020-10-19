package com.kh.onairstudy.report.model.dao;

import com.kh.onairstudy.report.model.vo.Report;

public interface ReportDAO {

	int insertReport(Report report);

	int selectCntReport(String reportedMember);

}

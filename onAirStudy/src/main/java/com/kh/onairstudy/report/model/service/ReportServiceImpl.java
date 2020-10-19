package com.kh.onairstudy.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.report.model.dao.ReportDAO;
import com.kh.onairstudy.report.model.vo.Report;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDAO reportDAO;

	@Override
	public int insertReport(Report report) {
		return reportDAO.insertReport(report);
	}

	@Override
	public int selectCntReport(String reportedMember) {
		
		return reportDAO.selectCntReport(reportedMember);
	}
	
	
}

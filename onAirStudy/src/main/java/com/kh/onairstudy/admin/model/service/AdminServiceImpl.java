package com.kh.onairstudy.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.admin.model.dao.AdminDAO;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.report.model.vo.Report;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public Map<String, Object> adminMain() {
		return adminDAO.adminMain();
	}

	@Override
	public List<Member> memberList(Map<String, Object> search) {
		return adminDAO.memberLis(search);
	}

	@Override
	public int serviceCnt() {
		return adminDAO.serviceCnt();
	}

	@Override
	public Map<String, Object> memberDetail(String memberId) {
		return adminDAO.memberDetail(memberId);
	}

	@Override
	public List<Map<String, Object>> serviceList(Map<String, Object> search) {
		return adminDAO.serviceList(search);
	}

	@Override
	public Map<String, Object> serviceDetail(int no) {
		return adminDAO.serviceDetail(no);
	}

	@Override
	public Map<String, Object> serviceDetailAv(int no) {
		return adminDAO.serviceDetailAv(no);
	}

	@Override
	public int insertService(ServiceCenter sc) {
		return adminDAO.insertService(sc);
	}

	@Override
	public int updateService(int replyNo) {
		return adminDAO.updateService(replyNo);
	}

	@Override
	public List<Map<String, Object>> reportList(Map<String, Object> map) {
		return adminDAO.reportList(map);
	}

	@Override
	public Map<String, Object> showModal(Map<String, Object> map) {
		if(map.get("category").equals("C"))
			return adminDAO.showModal1(map);
		else
			return adminDAO.showModal2(map);
	}

	@Override
	public List<Map<String, Object>> studyList(Map<String, Object> search) {
		return adminDAO.studyList(search);
	}

	@Override
	public Map<String, Object> studyDetail(int no) {
		return adminDAO.studyDetail(no);
	}

	@Override
	public List<String> studyMembers(int no) {
		return adminDAO.studyMembers(no);
	}

	@Override
	public int studyDelete(int no) {
		return adminDAO.studyDelete(no);
	}

	@Override
	public int updateReport(int no) {
		return adminDAO.updateReport(no);
	}

	@Override
	public List<Map<String, Object>> memberAll() {
		return adminDAO.memberAll();
	}

	@Override
	public int sendMessage(Map<String, Object> map) {
		return adminDAO.sendMessage(map);
	}

	@Override
	public int messageCnt() {
		return adminDAO.messageCnt();
	}

	@Override
	public int totalMember(Map<String, Object> search) {
		return adminDAO.totalMember(search);
	}

	@Override
	public int totalService(Map<String, Object> search) {
		return adminDAO.totalService(search);
	}

	@Override
	public int totalReport(Map<String, Object> search) {
		return adminDAO.totalReport(search);
	}

	@Override
	public int totalStudy(Map<String, Object> search) {
		return adminDAO.totalStudy(search);
	}

	
	
}

package com.kh.onairstudy.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.report.model.vo.Report;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;

public interface AdminService {

	List<Member> memberList(Map<String, Object> search);

	Map<String, Object> memberDetail(String memberId);

	List<Map<String, Object>> serviceList(Map<String, Object> search);

	Map<String, Object> serviceDetail(int no);

	Map<String, Object> serviceDetailAv(int no);

	int insertService(ServiceCenter sc);

	int updateService(int replyNo);

	List<Map<String, Object>> reportList(Map<String, Object> map);

	Map<String, Object> showModal(Map<String, Object> map);

	List<Map<String, Object>> studyList(Map<String, Object> search);

	int serviceCnt();

	Map<String, Object> studyDetail(int no);

	List<String> studyMembers(int no);

	int studyDelete(int no);

	int updateReport(int no);

	Map<String, Object> adminMain();

	List<Map<String, Object>> memberAll();

	int sendMessage(Map<String, Object> map);

	int messageCnt();

	int totalMember(Map<String, Object> search);

	int totalService(Map<String, Object> search);

	int totalReport(Map<String, Object> search);

	int totalStudy(Map<String, Object> search);

}

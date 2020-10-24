package com.kh.onairstudy.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;

public interface AdminDAO {

	List<Member> memberLis(Map<String, Object> search);

	Map<String, Object> memberDetail(String memberId);

	List<Map<String, Object>> serviceList(Map<String, Object> search);

	Map<String, Object> serviceDetail(int no);

	Map<String, Object> serviceDetailAv(int no);

	int insertService(ServiceCenter sc);

	int updateService(int replyNo);

}

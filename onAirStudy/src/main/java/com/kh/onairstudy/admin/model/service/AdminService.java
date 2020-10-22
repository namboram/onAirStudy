package com.kh.onairstudy.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.member.model.vo.Member;

public interface AdminService {

	List<Member> memberList();

	Map<String, Object> memberDetail(String memberId);

	List<Map<String, Object>> serviceList();

}

package com.kh.onairstudy.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.admin.model.dao.AdminDAO;
import com.kh.onairstudy.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<Member> memberList() {
		return adminDAO.memberLis();
	}

	@Override
	public Map<String, Object> memberDetail(String memberId) {
		return adminDAO.memberDetail(memberId);
	}
	
	
	
}

package com.kh.onairstudy.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.member.model.vo.Member;

public interface AdminDAO {

	List<Member> memberLis();

	Map<String, Object> memberDetail(String memberId);

}

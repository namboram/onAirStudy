package com.kh.onairstudy.member.model.dao;

import com.kh.onairstudy.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String memberId);

}

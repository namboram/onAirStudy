package com.kh.onairstudy.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> noticeList() {
		return sqlSession.selectList("notice.noticeList");
	}

	@Override
	public Map<String, Object> noticeDetail(int no) {
		return sqlSession.selectOne("notice.noticeDetail", no);
	}
	
	
}

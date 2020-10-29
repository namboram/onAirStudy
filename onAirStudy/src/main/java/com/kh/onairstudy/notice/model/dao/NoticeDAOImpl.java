package com.kh.onairstudy.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.notice.model.vo.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> search) {
		return sqlSession.selectList("notice.noticeList", search);
	}

	@Override
	public Map<String, Object> noticeDetail(int no) {
		return sqlSession.selectOne("notice.noticeDetail", no);
	}

	@Override
	public int updateCnt(int no) {
		return sqlSession.update("notice.updateCnt", no);
	}

	@Override
	public int noticeInsert(Map<String, Object> map) {
		return sqlSession.insert("notice.noticeInsert", map);
	}

	@Override
	public int noticeUptate(Notice notice) {
		return sqlSession.update("notice.noticeUpdate", notice);
	}

	@Override
	public int totalNotice() {
		return sqlSession.selectOne("notice.totalNotice");
	}
	
	
}

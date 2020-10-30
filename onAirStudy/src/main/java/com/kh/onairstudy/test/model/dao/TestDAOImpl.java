package com.kh.onairstudy.test.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.test.model.vo.Test;

@Repository
public class TestDAOImpl implements TestDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertQuestion(Test test) {
		return sqlSession.insert("test.insertQuestion", test);
	}

	@Override
	public List<Test> selectStudyNo() {
		return sqlSession.selectList("test.selectStudyNo");
	}

	@Override
	public List<Test> selectQuestion(int srNo) {		
		return sqlSession.selectList("test.selectQuestion", srNo);
	}

	@Override
	public int updatePoint(String memberId) {
		return sqlSession.update("test.updatePoint", memberId);
	}

	@Override
	public int selectCountQuestion(int srNo) {
		return sqlSession.selectOne("test.selectCountQuestion", srNo);
	}

}

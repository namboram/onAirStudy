package com.kh.onairstudy.studytime.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.studytime.model.vo.Studytime;

@Repository
public class StudytimeDAOImpl implements StudytimeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Studytime> selectList(String memberId) {
		return sqlSession.selectList("studytime.selectList", memberId);
	}

	@Override
	public void insertStudyTime(Studytime studytime) {
		sqlSession.insert("studytime.insertStudyTime", studytime);
		
	}

	@Override
	public List<String> selectsrList(String memberId) {
	
		return sqlSession.selectList("studytime.selectsrList", memberId);
		
	}


}

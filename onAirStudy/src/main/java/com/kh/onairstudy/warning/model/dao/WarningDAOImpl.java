package com.kh.onairstudy.warning.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.warning.model.vo.Warning;

@Repository
public class WarningDAOImpl implements WarningDAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public int giveWarning(HashMap<String, Object> param) {
		return sqlSession.insert("warning.giveWarning", param);
	}

	@Override
	public Warning selectWarningRecord(HashMap<String, Object> param) {
		return sqlSession.selectOne("warning.selectWarningRecord", param);
	}

	@Override
	public int updateWarning(HashMap<String, Object> param) {
		return sqlSession.update("warning.updateWarning", param);
	}

	@Override
	public int forceWithDraw(HashMap<String, Object> param) {
		return sqlSession.update("warning.forceWithDraw", param);
	}

	
	

}

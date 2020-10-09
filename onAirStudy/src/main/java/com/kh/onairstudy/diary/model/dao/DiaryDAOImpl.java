package com.kh.onairstudy.diary.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiaryDAOImpl implements DiaryDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

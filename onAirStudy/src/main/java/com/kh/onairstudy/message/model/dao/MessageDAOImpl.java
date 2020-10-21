package com.kh.onairstudy.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Message> selectMsgList(Map<String,Object> map) {
		return sqlSession.selectList("message.selectMsgList",map);
	}

	@Override
	public Message selectMessageOne(Map<String, Object> map) {
		return sqlSession.selectOne("message.selectMessageOne",map);
	}
	
	
	
	
}

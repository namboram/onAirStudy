package com.kh.onairstudy.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onairstudy.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Message> selectMsgList(String memberId) {
		return sqlSession.selectList("message.selectMsgList",memberId);
	}
	
	
	
}

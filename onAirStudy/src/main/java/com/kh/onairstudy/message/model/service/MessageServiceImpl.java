package com.kh.onairstudy.message.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.message.model.dao.MessageDAO;
import com.kh.onairstudy.message.model.vo.Message;

/*@Transactional(propagation = Propagation.REQUIRED,
isolation = Isolation.READ_COMMITTED,
rollbackFor = Exception.class)*/
@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;

	@Override
	public List<Message> selectMsgList(Map<String,Object> map) {
		return messageDAO.selectMsgList(map);
	}

	@Override
	public Message selectMessageOne(Map<String, Object> map) {
		return messageDAO.selectMessageOne(map);
	}

	@Override
	public int deleteMessageList(Map<String, Object> map) {
		return messageDAO.deleteMessageList(map);
	}

	@Override
	public int updateRead(Map<String, Object> map) {
		return messageDAO.updateRead(map);
	}

	@Override
	public int insertMessage(Message message) {
		return messageDAO.insertMessage(message);
	}

	@Override
	public List<Message> SearchMessageList(Map<String, Object> map) {
		return messageDAO.searchMessageList(map);
	}

	@Override
	public Message selectMessageNextOne(Map<String, Object> map) {
		return messageDAO.selectMessageNextOne(map);
	}

	
	
	
	
}

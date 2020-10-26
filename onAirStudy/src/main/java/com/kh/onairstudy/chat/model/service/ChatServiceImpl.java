package com.kh.onairstudy.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.chat.model.dao.ChatDAO;
import com.kh.onairstudy.chat.model.vo.Chat;

import lombok.extern.slf4j.Slf4j;

/*@Transactional(propagation = Propagation.REQUIRED,
				isolation = Isolation.READ_COMMITTED,

				rollbackFor = Exception.class)*/
@Slf4j
@Service
public class ChatServiceImpl implements ChatService {

	
	@Autowired
	private ChatDAO chatDAO;

	/*
	 * @Override public List<Map<String, Object>> selectChatList(int roomNo,int
	 * startNo) {
	 * 
	 * return chatDAO.selectchatList(roomNo,startNo); }
	 */
	@Override
	public List<Chat> selectChatList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Chat> list = chatDAO.selectchatList(map);
//		log.info("daoList={}",list);
		return list;
	}

	@Override
	public List<Chat> selectFirstChatList(int roomNo) {
		
		return chatDAO.selectFirstChatList(roomNo);
	}

	@Override
	public int insertChat(Chat chat) {
		return chatDAO.insertChat(chat);
	}
	
	
	
	
}

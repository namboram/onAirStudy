package com.kh.onairstudy.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onairstudy.chat.model.dao.ChatDAO;

/*@Transactional(propagation = Propagation.REQUIRED,
				isolation = Isolation.READ_COMMITTED,
				rollbackFor = Exception.class)*/
@Service
public class ChatServiceImpl implements ChatService {

	
	@Autowired
	private ChatDAO chatDAO;
	
	
}

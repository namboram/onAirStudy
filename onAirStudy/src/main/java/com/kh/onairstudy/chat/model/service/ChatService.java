package com.kh.onairstudy.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.chat.model.vo.Chat;

public interface ChatService {

//	List<Map<String, Object>> selectChatList(int roomNo,int startNo);

	List<Chat> selectChatList(Map<String, Object> map);

	List<Chat> selectFirstChatList(int roomNo);

	int insertChat(Chat chat);

}

package com.kh.onairstudy.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.message.model.vo.Message;

public interface MessageService {

	List<Message> selectMsgList(Map<String,Object> memberId);

	Message selectMessageOne(Map<String, Object> map);

	int deleteMessageList(Map<String, Object> map);

	int updateRead(Map<String, Object> map);

	int insertMessage(Message message);

	List<Message> SearchMessageList(Map<String, Object> map);

	Message selectMessageNextOne(Map<String, Object> map);

}

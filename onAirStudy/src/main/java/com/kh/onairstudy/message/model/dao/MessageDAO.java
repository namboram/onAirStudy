package com.kh.onairstudy.message.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.message.model.vo.Message;

public interface MessageDAO {

	List<Message> selectMsgList(Map<String,Object> map);

	Message selectMessageOne(Map<String, Object> map);

	int deleteMessageList(Map<String, Object> map);

	int updateRead(Map<String, Object> map);

	int insertMessage(Message message);

	List<Message> searchMessageList(Map<String, Object> map);

	Message selectMessageNextOne(Map<String, Object> map);

}

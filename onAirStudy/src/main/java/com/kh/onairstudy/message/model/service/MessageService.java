package com.kh.onairstudy.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.onairstudy.message.model.vo.Message;

public interface MessageService {

	List<Message> selectMsgList(Map<String,Object> memberId);

	Message selectMessageOne(Map<String, Object> map);

}

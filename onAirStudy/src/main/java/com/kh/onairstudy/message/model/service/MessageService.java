package com.kh.onairstudy.message.model.service;

import java.util.List;

import com.kh.onairstudy.message.model.vo.Message;

public interface MessageService {

	List<Message> selectMsgList(String memberId);

}

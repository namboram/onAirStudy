package com.kh.onairstudy.message.model.dao;

import java.util.List;

import com.kh.onairstudy.message.model.vo.Message;

public interface MessageDAO {

	List<Message> selectMsgList(String memberId);

}

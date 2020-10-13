package com.kh.onairstudy.chat.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.kh.onairstudy.chat.model.service.ChatService;
import com.kh.onairstudy.chat.model.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Chat broadcasting(Chat chat) {
//    	log.debug("room넘어오나?{}",roomNo);
    	log.debug("?????????????gㅎ");
    	log.debug("받아온 data={}",chat);
//    	log.debug("chat={}",chat);
//    	Chat chat = new Chat();
//    	chat.setMessageType("");
        chat.setSendDate(new Date());
        
        return chat;
    }
    
    
}

package com.kh.onairstudy.chat.controller;

import java.security.Principal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.onairstudy.chat.model.service.ChatService;
import com.kh.onairstudy.chat.model.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 채팅 메세지 전달
    @MessageMapping("/app/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Chat sendChatMessage(@DestinationVariable String roomNo, Chat chat, Principal principal) {
    	log.debug("chat={}",chat);
    	
//    	chat.setMessageType("");
        chat.setSendDate(new Date());
        
        return chat;
    }
}

package com.kh.onairstudy.chat.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.chat.model.service.ChatService;
import com.kh.onairstudy.chat.model.vo.Chat;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	//채팅창으로 입장 // 임의 테스트
	@RequestMapping("/enter/chat.do")
    public ModelAndView enterChat(@RequestParam int roomNo,ModelAndView mav) {
		mav.addObject("roomNo",roomNo);
		mav.setViewName("mypage2/chatting");
    	return mav;
    }
	
	//채팅 내역 가져오기
	@RequestMapping("/chat/chatList.do")
	@ResponseBody
	public List<Chat> selectChatList(@RequestParam int roomNo,@RequestParam int endNo) {
		int startNo;
//		int roomNo = Integer.parseInt(room);
		if(endNo!=0) {
			endNo-=9;
			startNo=endNo-9;
		}
		else {
			startNo=0;
			endNo=10;
		}
			
		Map<String,Object> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("startNo",startNo);
		map.put("endNo", endNo);
		List<Chat> list = chatService.selectChatList(map);
		log.info("list= {}", list);
//		mav.addObject("list", list);
//		mav.addObject("roomNo",roomNo);
//		mav.setViewName("mypage2/chatting");
		return list;
	}

	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Chat broadcasting(Chat chat) {
//    	log.debug("room넘어오나?{}",roomNo);
//    	log.debug("?????????????gㅎ");
    	log.debug("받아온 data={}",chat);
//    	log.debug("chat={}",chat);
//    	Chat chat = new Chat();
//    	chat.setMessageType("");
    	
        chat.setSendDate(new Date());
        
        return chat;
    }
    
    
}

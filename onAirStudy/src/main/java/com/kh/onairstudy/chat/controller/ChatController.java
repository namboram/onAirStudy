package com.kh.onairstudy.chat.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
    public ModelAndView enterChat(@RequestParam int roomNo,ModelAndView mav,HttpSession session) {
		String memberId = (String)session.getAttribute("memberId");
		List<Chat> firstList = chatService.selectFirstChatList(roomNo);
		mav.addObject("roomNo",roomNo);
		mav.addObject("memberId",memberId);
		mav.addObject("firstList",firstList);
		mav.setViewName("mypage2/chatting");
    	return mav;
    }

	@RequestMapping("/test/enter.do")
	public String enter() {
		return "mypage2/change";
	}
	//채팅 내역 가져오기
	@RequestMapping("/chat/chatList.do")
	@ResponseBody
	public List<Chat> selectChatList(@RequestParam int roomNo,@RequestParam int endNo) {
		int startNo = endNo-11;
//		int roomNo = Integer.parseInt(room);

			
		Map<String,Object> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("startNo",endNo-1);
//		map.put("endNo", endNo-1);
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
  //채팅 저장
    @RequestMapping("/chat/insertChat.do")
    @ResponseBody
    public int insertChat(Chat chat) {
//    	Map<String,Object> map = new HashMap<>();
//    	map.put("chat", chat);
    	int result = chatService.insertChat(chat);
    	return result;
    }
    
}

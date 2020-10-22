package com.kh.onairstudy.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.message.model.service.MessageService;
import com.kh.onairstudy.message.model.vo.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/message/messageList.do")
	public String messageList(HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("loginMember");
		Map<String,Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		map.put("type","");
		List<Message> messageList = messageService.selectMsgList(map);
		model.addAttribute("messageList", messageList);
		model.addAttribute("title","전체 쪽지함");
		//model.addAttribute("test","아뭐야아아ㅏㅏ");
		return "message/messageList";
	}
	
	@RequestMapping("/message/sendReceiveFilter.do")
	public String sendReceiveFilter(@RequestParam String type,HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("loginMember");
		Map<String,Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		map.put("type",type);
		List<Message> messageList = messageService.selectMsgList(map);
		model.addAttribute("messageList", messageList);
		if(type.equals("receive")) {
			model.addAttribute("title","수신함");
		}else {
			model.addAttribute("title","발신함");
		}
		return "message/messageList";
	}
	
	@RequestMapping("/message/messageDetail.do")
	public String messageDetail(@RequestParam int no,HttpSession session,Model model) {
		Member member = (Member)session.getAttribute("loginMember");
		Map<String,Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		map.put("no", no);
		Message message = messageService.selectMessageOne(map);
		model.addAttribute("message",message);
		return "message/messageDetail";
	}
	
	@RequestMapping(value="/message/delMessageList.do",method=RequestMethod.POST)
	@ResponseBody
	public int delMessageList(@RequestParam(value="arr[]") List<String> arr,
			@RequestParam String type,HttpSession session) {
		log.info("arr={}",arr.get(0));
		//log.info("왜 안되냐아ㅏㅏㅏ");
		Member member = (Member)session.getAttribute("loginMember");
		Map<String,Object> map = new HashMap<>();
		//map.put("memberId", member.getMemberId());
		map.put("arr", arr);
		map.put("type", type);
		int result = messageService.deleteMessageList(map);
		return result;
	}
}

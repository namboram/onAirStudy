package com.kh.onairstudy.message.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		List<Message> messageList = messageService.selectMsgList(member.getMemberId());
		model.addAttribute("messageList", messageList);
		return "message/messageList";
	}
}

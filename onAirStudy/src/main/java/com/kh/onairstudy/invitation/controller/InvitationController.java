package com.kh.onairstudy.invitation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.invitation.model.service.InvitationService;
import com.kh.onairstudy.invitation.model.vo.Invitation;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/invitation")
@Slf4j
public class InvitationController {

	@Autowired
	private InvitationService invitationService;
	
	@RequestMapping("/invitationlist.do")
	public ModelAndView invitationList(ModelAndView mav) {
		
		List<Invitation> inList = invitationService.selectInvitationList();
		
		log.debug("inList = {}" , inList);
		mav. addObject("inList", inList);
		
		mav.setViewName("invitation/invitationList");
		return mav;
	}
}

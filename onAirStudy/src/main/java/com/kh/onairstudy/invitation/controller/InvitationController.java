package com.kh.onairstudy.invitation.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.invitation.model.service.InvitationService;
import com.kh.onairstudy.invitation.model.vo.Invitation;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping
@Slf4j
public class InvitationController {

	@Autowired
	private InvitationService invitationService;
	
	@RequestMapping("mypage1/invitationlist.do")
	public ModelAndView invitationList(ModelAndView mav) {
		
		List<Invitation> inList = invitationService.selectInvitationList();
		
		log.debug("inList = {}" , inList);
		mav. addObject("inList", inList);
		
		mav.setViewName("invitation/invitationList");
		return mav;
	}

	@RequestMapping(value = "mypage1/deleteInvitation.do", method = RequestMethod.POST)
	public String deleteInvitation(Invitation invi,
									RedirectAttributes redirectAttr) {
	
			
		int result = invitationService.deleteInvitation(invi.getNo());
		
		redirectAttr.addFlashAttribute("msg", result>0 ? "초대를 거부 하였습니다." : "오류가 발생하였습니다.");
		return "redirect:/mypage1/invitationlist.do";
	}
	
	@RequestMapping(value = "mypage1/updateInvitation.do", method = RequestMethod.POST)
	public String updateInvitation(Invitation invi, 
									RedirectAttributes redirectAttr,HttpSession session) {
//		Member member = (Member)session.getAttribute("loginMember");
		List<StudyRoomLog> logList = new ArrayList<>();
		
		StudyRoomLog srLog = new StudyRoomLog();
		srLog.setMemberId(invi.getInvitedId());
		logList.add(srLog);
		
		invi.setSLog(logList);
		int result = invitationService.updateInvitation(invi);
		
		redirectAttr.addFlashAttribute("msg", result>0 ? "초대를 수락 하였습니다." : "오류가 발생하였습니다.");
		return "redirect:/mypage1/mystudylist.do";
	}
	
}

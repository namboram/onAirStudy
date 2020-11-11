package com.kh.onairstudy.invitation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
//거절
	@RequestMapping(value = "mypage1/deleteInvitation.do", method = RequestMethod.POST)
	public String deleteInvitation(Invitation invi,
									RedirectAttributes redirectAttr) {
	
			
		int result = invitationService.deleteInvitation(invi.getNo());
		
		redirectAttr.addFlashAttribute("msg", result>0 ? "초대를 거부 하였습니다." : "오류가 발생하였습니다.");
		return "redirect:/mypage1/invitationlist.do";
	}

//수락
	@RequestMapping(value = "mypage1/updateInvitation.do", method = RequestMethod.POST)
	public String updateInvitation(Invitation invi, @RequestParam("memberId") String id, @RequestParam("no") int no,
									RedirectAttributes redirectAttr,HttpSession session) {
		String msg="";
			
		List<StudyRoomLog> logList = new ArrayList<>();
		
		StudyRoomLog srLog = new StudyRoomLog();
		srLog.setSrNo(no);
		srLog.setMemberId(id);
		logList.add(srLog);
		
		invi.setSrNo(no);
		invi.setSLog(logList);
		invi.setInvitedId(id);
		
		int studyC = invitationService.selectParticipatingRoomCnt(srLog);
		 if(studyC >= 4) {
			 msg = id + "님은" + "참여방 개수 초과로 초대된 방에 참여하실 수 없습니다";
		 } else {
			 
			 int result = invitationService.updateInvitation(invi);
			 msg = result>0 ? "초대를 수락 하였습니다." : "오류가 발생하였습니다.";
		 }
		
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/mypage1/mystudylist.do";
	}
	
	
	
	@RequestMapping("/mypage2/invitation.do")
	public String invitation() {
		return "/invitation/invitation";
	}
	
	
	@RequestMapping(value="/invitation/searchMember.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Member> searchMember(@RequestParam("searchId") String searchId,
									@RequestParam("roomNum") String roomNum) {
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("searchId", searchId);
		param.put("roomNum", roomNum);
		
		List<Member> list = invitationService.selectMemberList(param);
		
		
		return list;
	}
	
	@RequestMapping(value="/invitation/invite.do", method=RequestMethod.POST)
	@ResponseBody
	public int invite(@RequestParam("invitedId") String invitedId,
					 @RequestParam("hostingId") String hostingId,
					 @RequestParam("srNo") int srNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("invitedId", invitedId);
		param.put("hostingId", hostingId);
		param.put("srNo", srNo);
		
		int result = invitationService.sendInvitation(param);
		
		return result;
	}
	
}

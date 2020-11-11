package com.kh.onairstudy.warning.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onairstudy.studyroom.model.service.StudyRoomService;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;
import com.kh.onairstudy.warning.model.service.WarningService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WarningController {

	@Autowired
	private WarningService warningService;
	
	@Autowired
	private StudyRoomService studyRoomService;
	
	@ResponseBody
	@RequestMapping(value = "/studyroom/givewarning.do", method = RequestMethod.POST)
	public int giveWarning(@RequestParam("roomNum") int roomNum, 
						   @RequestParam("memberId") String memberId) {
		
		log.debug("roomNum = {}", roomNum);
		log.debug("memberId = {}", memberId);
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("roomNum", roomNum);
		param.put("memberId", memberId);
		
		int result = warningService.giveWarning(param);
		
		StudyRoomInfo roomInfo = studyRoomService.selectRoomInfo(roomNum);
		
		int resultExit = 10;
		if(roomInfo.getForceExitYN().equals("Y")) {
			//자동강퇴처리하기
			param.put("forceExitOpt", roomInfo.getForceExitOpt());
			resultExit = warningService.forceWithDraw(param);
		}
		
		return result;
	}

	
	@ResponseBody
	@RequestMapping(value = "/studyroom/forceWithDraw.do", method = RequestMethod.POST)
	public int forceWithDraw(@RequestParam("roomNum") int roomNum, 
						   @RequestParam("memberId") String memberId,
						   @RequestParam("forceExitOpt") int forceExitOpt) {
		
		log.debug("roomNum = {}", roomNum);
		log.debug("memberId = {}", memberId);
		log.debug("forceExitOpt = {}", forceExitOpt);
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("roomNum", roomNum);
		param.put("memberId", memberId);
		param.put("forceExitOpt", forceExitOpt);
		
		int	result = warningService.forceWithDraw(param);
		// 3 : 강퇴 인원 x, 1: 강퇴성공 , 0 : 강퇴실패
		return result;
	}

}

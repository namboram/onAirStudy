package com.kh.onairstudy.warning.controller;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class WarningController {

	@RequestMapping(value = "/studyroom/givewarning.do", method = RequestMethod.POST)
	public int giveWarning(@RequestParam("roomNum") String roomNum, 
						   @RequestParam("memeberId") String memberId) {
		
		log.debug("roomNum = {}", roomNum);
		log.debug("memberId = {}", memberId);
		
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("roomNum", roomNum);
		param.put("memberId", memberId);
		
		int result = studyRoomService.giveWarning(param);
		
		return result;
	}

}

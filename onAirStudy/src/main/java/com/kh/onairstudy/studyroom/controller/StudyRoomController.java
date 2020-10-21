package com.kh.onairstudy.studyroom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onairstudy.studyroom.model.service.StudyRoomService;
import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class StudyRoomController {

	@Autowired
	private StudyRoomService studyRoomService;
	
	@RequestMapping("/mypage1/mystudylist.do")
	public ModelAndView mystudylist(ModelAndView mav) {
		
		List<StudyRoom> studyList = studyRoomService.selectMystudyList();
		List<StudyRoomWaiting> waitingList = studyRoomService.selectMywaitingList();
		List<StudyRoomWish> wishList = studyRoomService.selectMywishList();
		
		log.debug("studyList = {}" , studyList);
		log.debug("waitingList = {}" , waitingList);
		log.debug("wishList = {}" , wishList);
		
		mav. addObject("studyList", studyList);
		mav. addObject("waitingList", waitingList);
		mav. addObject("wishList", wishList);
		
		mav.setViewName("mypage1/mypage1_mystudy");
		return mav;
	}
	
	
	@RequestMapping("/studyroom/studyroomlist.do")
		public ModelAndView studyroomlist(ModelAndView mav) {
		List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
		mav. addObject("sCategory", sCategory);
		
		List<StudyRoomList> srList = studyRoomService.selectStudyRoomList();
		mav. addObject("srList", srList);
		
		mav.setViewName("studyroom/studyRoomList");
		return mav;
	}
	
	@RequestMapping("mypage1/newstudy.do")
	public String newstudy() {
		List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
		 
		return "mypage1/mypage1_newstudy";
		
	}
	
	@RequestMapping("/studyroom/main.do")
	public ModelAndView main(ModelAndView mav) {
		
		Map<String, Object> map = new HashMap<>();
		int roomNum = 15;
		List<StudyRoomLog> participants = studyRoomService.selectParticipantList(roomNum);
		List<String> applicants = studyRoomService.selectApplicantList(roomNum);
		
		log.debug("list = {}", participants);
		//map.put("list", participants);
		mav.addObject("participants", participants);
		mav.addObject("applicants", applicants);
		mav.setViewName("mypage2/mypage2");
		
		return mav;
	}
}
package com.kh.onairstudy.studyroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.studyroom.model.service.StudyRoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class StudyRoomController {

	@Autowired
	private StudyRoomService studyRoomService;
	
}

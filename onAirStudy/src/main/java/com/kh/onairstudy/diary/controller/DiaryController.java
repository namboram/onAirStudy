package com.kh.onairstudy.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.diary.model.service.DiaryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
}

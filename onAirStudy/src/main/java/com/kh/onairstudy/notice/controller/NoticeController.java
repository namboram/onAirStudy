package com.kh.onairstudy.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
}

package com.kh.onairstudy.scheduler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.scheduler.model.service.SchedulerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping
@Controller
public class SchedulerController {

	@Autowired
	private SchedulerService schedulerService;
}

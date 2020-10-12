package com.kh.onairstudy.servicecenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.servicecenter.model.service.ServiceCenterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;
}

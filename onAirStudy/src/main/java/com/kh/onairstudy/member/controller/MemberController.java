package com.kh.onairstudy.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
}

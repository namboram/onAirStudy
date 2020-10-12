package com.kh.onairstudy.invitation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onairstudy.invitation.model.service.InvitationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping
@Controller
public class InvitationController {

	@Autowired
	private InvitationService invitationService;
}

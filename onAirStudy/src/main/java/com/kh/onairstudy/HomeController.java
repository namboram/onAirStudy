package com.kh.onairstudy;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onairstudy.member.model.service.MemberService;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.studyroom.model.service.StudyRoomService;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StudyRoomService studyRoomService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
      
			//성실멤버 랭킹 list
			List<Member> dm_List = memberService.selectDiligentMember();			
			model.addAttribute("dm_List", dm_List );

				
			//성실스터디방 List	
			List<StudyRoomList> ds_List = studyRoomService.selectDiligentStudyroom();	
			model.addAttribute("ds_List", ds_List );
			
			//스터디방 List
			List<StudyRoomList> srList = studyRoomService.selectStudyRoomList();
			model.addAttribute("srList", srList);
			
		return "forward:/index.jsp";
	}
	
}
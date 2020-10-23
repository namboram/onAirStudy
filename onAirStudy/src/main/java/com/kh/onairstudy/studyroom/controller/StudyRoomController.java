package com.kh.onairstudy.studyroom.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.common.Utils;
import com.kh.onairstudy.studyroom.model.service.StudyRoomService;
import com.kh.onairstudy.studyroom.model.vo.ProfileAttachment;
import com.kh.onairstudy.studyroom.model.vo.StudyCategory;
import com.kh.onairstudy.studyroom.model.vo.StudyRoom;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomList;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomLog;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWaiting;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomWish;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping
@SessionAttributes({"roomInfo"})  //방정보 세션에 등록
public class StudyRoomController {

	@Autowired
	private StudyRoomService studyRoomService;

	@RequestMapping("/mypage1/mystudylist.do")
	public ModelAndView mystudylist(ModelAndView mav) {

		List<StudyRoom> studyList = studyRoomService.selectMystudyList();
		List<StudyRoomWaiting> waitingList = studyRoomService.selectMywaitingList();
		List<StudyRoomWish> wishList = studyRoomService.selectMywishList();

		log.debug("studyList = {}", studyList);
		log.debug("waitingList = {}", waitingList);
		log.debug("wishList = {}", wishList);

		mav.addObject("studyList", studyList);
		mav.addObject("waitingList", waitingList);
		mav.addObject("wishList", wishList);

		mav.setViewName("mypage1/mypage1_mystudy");
		return mav;
	}

	@RequestMapping("/studyroom/studyroomlist.do")
	public ModelAndView studyroomlist(ModelAndView mav) {
		List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
		mav.addObject("sCategory", sCategory);

		List<StudyRoomList> srList = studyRoomService.selectStudyRoomList();
		mav.addObject("srList", srList);

		mav.setViewName("studyroom/studyRoomList");
		return mav;
	}

	@RequestMapping("mypage1/newstudy.do")
	public void newstudy(Model model) {
		List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
		model.addAttribute("sCategory", sCategory);
	}

	@RequestMapping(value = "mypage1/newstudyEnroll.do", method = RequestMethod.POST)
	public String newstudyEnroll(StudyRoom studyroom,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles, RedirectAttributes redirectAttr,
			HttpServletRequest request) throws IllegalStateException, IOException {

		List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
		List<StudyRoom> studyList = studyRoomService.selectMystudyList();

		List<ProfileAttachment> proList = new ArrayList<>();

		String saveDirectory = request.getServletContext().getRealPath("/resources/upload");

		for (MultipartFile upFile : upFiles) {

			if (upFile.isEmpty())
				continue;
			// 1. 파일명 생성
			String renamedFilename = Utils.getRenamedFileName(upFile.getOriginalFilename());
			// 2.메모리의 파일 -> 서버컴퓨터 디렉토리 저장 tranferTo.
			File dest = new File(saveDirectory, renamedFilename);
			upFile.transferTo(dest);

			ProfileAttachment profile = new ProfileAttachment();
			profile.setOriginalFilename(upFile.getOriginalFilename());
			profile.setRenamedFilename(renamedFilename);
			proList.add(profile);

		}
		log.debug("proList = {}", proList);
		studyroom.setProList(proList);

		// studyroom. profile 객체 DB저장하기

		int result = studyRoomService.insertStudyRoom(studyroom);

		redirectAttr.addFlashAttribute("msg", "스터디방이 생성 되었습니다.");

		return "redirect:/mypage1/mystudylist.do";

	}

	@RequestMapping("/studyroom/main.do")
	public String main( @RequestParam("roomNum") int roomNum, Model model) {

		log.debug("roomNum = {}", roomNum);
		
		StudyRoomInfo roomInfo = studyRoomService.selectRoomInfo(roomNum);
		List<StudyRoomLog> participants = studyRoomService.selectParticipantList(roomNum);
		List<String> applicants = studyRoomService.selectApplicantList(roomNum);

		model.addAttribute("roomInfo", roomInfo);
		model.addAttribute("participants", participants);
		model.addAttribute("applicants", applicants);

		return "mypage2/mypage2";
	}
	
	@RequestMapping(value = "/studyroom/accept.do", 
					method = RequestMethod.POST)
	public String acceptMember(RedirectAttributes redirectAttr, 
							  @RequestParam("id") String memberId,
							  @RequestParam("roomNum") int roomNum) {
			
		String msg = memberId + "님이 " + "스터디방에 참여하게 되었습니다";
		
//		int count = studyRoomService.selectParticipatingRoomCnt(memberId);
//		//select count(*) from sr_log where member_id = 'honggd' and status_log = '참여';
//		int resultDelete = 0;
//		int resultInsert = 0;
//		
//		if(count == 3) {
//		    msg = memberId + "님은" + "참여방 개수 초과로 스터디방에 참여하실 수 없습니다";
//		}else {
//			resultDelete = studyRoomService.deleteWaiting(memberId, roomNum);
//			//delete from sr_waiting_list where member_id = 'qwerty' and sr_no = '9';
//			resultInsert = studyRoomService.insertStudyLog(memberId, roomNum);
//			//insert into sr_log values(seq_sr_log_no.nextval, 16, 'songsong', '참여', 0, 'N');
//		}
		
		redirectAttr.addAttribute("roomNum"	, roomNum);
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/studyroom/main.do";
	}

	


	
	@RequestMapping("/studyroom/exit")
	public String exitRoom() {
		
//		방 정보 세션 날리기
		return "redirect:/";
		//return "redirect:/mypage1/mypage1_index.do";
	}
}
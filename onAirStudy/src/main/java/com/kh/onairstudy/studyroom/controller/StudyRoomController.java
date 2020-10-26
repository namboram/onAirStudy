package com.kh.onairstudy.studyroom.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
//@SessionAttributes({"roomInfo"})  //방정보 세션에 등록
public class StudyRoomController {

	@Autowired
	private StudyRoomService studyRoomService;

	//메인 페이지 스터디룸 리스트
	@RequestMapping("/studyroom/studyroomlist.do")
	public ModelAndView studyroomlist(ModelAndView mav) {
		List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
		mav.addObject("sCategory", sCategory);
	
		List<StudyRoomList> srList = studyRoomService.selectStudyRoomList();
		mav.addObject("srList", srList);
		
		mav.setViewName("studyroom/studyRoomList");
		return mav;
	}	
	
	//방신청
	@RequestMapping("/studyroom/applystudyroom.do")
	public String applyS(StudyRoomWaiting srWating,
						RedirectAttributes redirectAttr) {
		
		int result = studyRoomService.insertWating(srWating);
		redirectAttr.addFlashAttribute("msg", result>0 ? "신청을 완료 하였습니다." : "오류가 발생하였습니다.");
		return "redirect:/studyroom/studyroomlist.do";
	}
	
	//찜
	@RequestMapping("/studyroom/favStudyroom.do")
	public String favR(StudyRoomWish srWish,
						RedirectAttributes redirectAttr) {
		
		int result = studyRoomService.insertWish(srWish);
		redirectAttr.addFlashAttribute("msg", result>0 ? "관심 목록에 추가 하였습니다." : "오류가 발생하였습니다.");
		return "redirect:/studyroom/studyroomlist.do";
	}
	
	//찾기
	@RequestMapping(value = "/studyroom/searchStudyroom.do", method = RequestMethod.POST)
	public ModelAndView searchRoom(@RequestParam(defaultValue="") String keyword, 
								@RequestParam(defaultValue="sr_title") String search_option, 
								ModelAndView mav) throws Exception {
		//1. map에 저장
		List<StudyRoomList> sList = studyRoomService.listAll(search_option, keyword);
		
		int count = studyRoomService.countArticle(search_option, keyword);
		//mav에 값을 넣고 페이지 지정, map에 자료 저장
		Map<String,Object> map = new HashMap<String, Object>(); 
		
		map.put("sList", sList);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.addObject("map",map);
		mav.setViewName("studyroom/studyRoomList");
		return mav;
	}
	
	//마이페이지 스터디 방 리스트 3개
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

	//스터디방 생성
		@RequestMapping("mypage1/newstudy.do")
		public void newstudy(Model model) {
			List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
			model.addAttribute("sCategory", sCategory);
			List<StudyRoomList> srList = studyRoomService.selectsrList();
			model.addAttribute("srList", srList);
			List<StudyRoomLog> sLog =studyRoomService.selectStudyRoomLog();
			model.addAttribute("sLog", sLog);
		}
		

	@RequestMapping(value = "mypage1/newstudyEnroll.do", method = RequestMethod.POST)
	public String newstudyEnroll(StudyRoom studyroom,
								@RequestParam(value = "upFile", required = false) MultipartFile upFile, 
								@RequestParam("srCategory") int srCategory, Model model,
								RedirectAttributes redirectAttr,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException {
				Member loginMember = (Member)session.getAttribute("loginMember");
				
				StudyRoomList srList = new StudyRoomList();
				srList.setSrCategory(srCategory);						
				srList.setMemberId(loginMember.getMemberId());						
				int rol =  studyRoomService.insertStudyRoomList(srList);
						
			
				
				List<ProfileAttachment> proList = new ArrayList<>();
			
				String saveDirectory = request.getServletContext().getRealPath("/resources/upload");
				
				// 1. 파일명 생성
				String renamedFilename = Utils.getRenamedFileName(upFile.getOriginalFilename());
				// 2.메모리의 파일 -> 서버컴퓨터 디렉토리 저장 tranferTo.
				File dest = new File(saveDirectory, renamedFilename);
				upFile.transferTo(dest);

				ProfileAttachment profile = new ProfileAttachment();
				profile.setOriginalFilename(upFile.getOriginalFilename());
				profile.setRenamedFilename(renamedFilename);
				profile.setFilePath(saveDirectory);
				proList.add(profile);
				
			
				log.debug("proList = {}", proList);
				studyroom.setProList(proList);
				studyroom.setCategory(srCategory);
				studyroom.setSrNo(srList.getSrNo());
				System.out.println("srList.getSrNo()" + srList.getSrNo());

			//studyroom. profile 객체 DB저장하기

				int result = studyRoomService.insertStudyRoom(studyroom);

				redirectAttr.addFlashAttribute("msg", "스터디방이 생성 되었습니다.");

				return "redirect:/mypage1/mystudylist.do";

		}

	//스터디방 입장 - 인덱스 페이지
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
	
	//참여신청 수락
	@RequestMapping(value = "/studyroom/accept.do", 
					method = RequestMethod.POST)
	public String acceptMember(RedirectAttributes redirectAttr, 
							  @RequestParam("id") String memberId,
							  @RequestParam("roomNum") int roomNum) {
			
		String msg = memberId + "님이 " + "스터디방에 참여하게 되었습니다";
		
		int count = studyRoomService.selectParticipatingRoomCnt(memberId);
		log.debug("count = {}", count);
		int result = 0;
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("roomNum", roomNum);
		
		log.debug("param = {}",param);
	
		
		if(count >= 3) {
		    msg = memberId + "님은" + "참여방 개수 초과로 스터디방에 참여하실 수 없습니다";
		}else {
			result = studyRoomService.insertStudyLog(param);
			msg = result == 1 ? memberId + "님이 " + "스터디방에 참여하게 되었습니다" : "참여신청 수락에 실패하였습니다";
		}
		
		redirectAttr.addAttribute("roomNum"	, roomNum);
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/studyroom/main.do";
	}
}
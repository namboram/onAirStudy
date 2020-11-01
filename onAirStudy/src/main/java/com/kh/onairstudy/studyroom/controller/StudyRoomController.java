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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.attendance.model.service.AttendanceService;
import com.kh.onairstudy.attendance.model.vo.Attendance;
import com.kh.onairstudy.chat.model.service.ChatService;
import com.kh.onairstudy.chat.model.vo.Chat;
import com.kh.onairstudy.common.Utils;
import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.message.model.vo.Message;
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
	
	@Autowired
	private ChatService chatService;

	@Autowired
	private AttendanceService attendanceService;


	//메인 페이지 스터디룸 리스트
		@RequestMapping("/studyroom/studyroomlist.do")
		public ModelAndView studyroomlist(ModelAndView mav, HttpSession session) {
		
			List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
			mav.addObject("sCategory", sCategory);
		
			List<StudyRoomList> srList = studyRoomService.selectStudyRoomList();
			mav.addObject("srList", srList);
			
			mav.setViewName("studyroom/studyRoomList");
			return mav;
		}	
		
		//방신청
		@RequestMapping("/studyroom/applystudyroom.do")
		public String applyS(StudyRoomWaiting srWating, @RequestParam("srNo") int srNo, 
							@RequestParam("memberId") String memberId, HttpSession session,	RedirectAttributes redirectAttr) {	
			
			Member loginMember = (Member)session.getAttribute("loginMember");
	
			System.out.println("loginMember.getMemberRole()="+loginMember.getMemberRole() );

			String msg = "";
			
			//방 갯수 조회
			int countR = studyRoomService.selectParticipatingRoomCnt(memberId);
			
			//방 신청 조회		
			int applyR = studyRoomService.selectApplyRoom(srWating);
			int myStudy = studyRoomService.selectMyStudy(srNo, memberId);
			
			if(loginMember.getMemberRole() != "p"){
				
				msg= "프리미엄 회원이 아닙니다. 프리미엄 결제를 해주세요";					
				
			}else if(myStudy>0) {
					
				msg= "이미 가입되어진 방입니다.";				

			}
			else if(applyR>0) {
				
				msg= "이미 신청 하신 방입니다.";
					
			}else if(loginMember.getMemberRole().equals("M") ){
				msg= "프리미엄 회원이 아닙니다. 프리미엄 결제를 해주세요";	

				
			}
			else{

				//방 신청 제한
				if(countR >= 4) {
					
					msg= "스터디방의 갯수가 4개를 초과하여  신청 할 수 없습니다.";
				
				}else {					 
					 int result = studyRoomService.insertWating(srWating);
					 msg= "신청을 완료 하였습니다.";
				}
			}
						
			redirectAttr.addFlashAttribute("msg", msg);			
			return "redirect:/studyroom/studyroomlist.do";
			
			}
				
		//찜
		@RequestMapping("/studyroom/favStudyroom.do")
		public String favR(StudyRoomWish srWish, Model model,
							@RequestParam("srNo") int srNo, 						 
							@RequestParam("memberId") String memberId, 							
							RedirectAttributes redirectAttr) {	
			
			String msg = "";
			int result = 0;	
						
			// 찜 등록
															
			int wishR = studyRoomService.selectCheckWish(srWish);
			int myStudy = studyRoomService.selectMyStudy(srNo, memberId);
			
			if( myStudy> 0) {
				
					msg= "이미 가입되어진 방입니다.";
				
			}else {
				
				if( wishR > 0 ) {			
					result = studyRoomService.deleteWish(srWish);
					msg = "관심 목록에서 해제 되었습니다.";

				}else {
 
					result = studyRoomService.insertWish(srWish);
					msg =  "관심 목록에 추가 하였습니다.";
				}
				
			}

			redirectAttr.addFlashAttribute("msg", msg);
			
			return "redirect:/studyroom/studyroomlist.do";
			
		}
		
		//찾기
		@RequestMapping(value = "/studyroom/searchStudyroom.do")
		public ModelAndView searchRoom(@RequestParam(defaultValue="") String keyword, 
									@RequestParam(defaultValue="sr_title") String search_option, 
									@RequestParam(defaultValue="0") int category,
									ModelAndView mav) throws Exception {
			log.info("search_option={}",search_option);
			//1. map에 저장
			List<StudyRoomList> sList = studyRoomService.listAll(search_option, keyword, category);
			List<StudyCategory> sCategory = studyRoomService.selectCategoryList();
		
			int count = studyRoomService.countArticle(search_option, keyword);
			//mav에 값을 넣고 페이지 지정, map에 자료 저장
			Map<String,Object> map = new HashMap<String, Object>(); 
			
			map.put("sList", sList);
			map.put("count", count);
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			mav.addObject("map",map);
			
			mav.addObject("srList", sList);				
			mav.addObject("sCategory", sCategory);
		
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
		
		//스터디방 안에서 관심 삭제
		@RequestMapping("/studyroom/delfavStudyroom.do")
		public String delFavR(StudyRoomWish srWish, StudyRoomWaiting srWating, Model model,
							@RequestParam("srNo") int srNo, 						 
							@RequestParam("memberId") String loginM, 							
							RedirectAttributes redirectAttr) {	
			
			int result = 0;			
			String msg = "";
	
			
			
			//방 갯수 조회
			int countR = studyRoomService.selectParticipatingRoomCnt(loginM);
			int wishR = studyRoomService.selectCheckWish(srWish);
			
				
				//방 신청 제한
				if(countR >= 4) {
					
					msg= "스터디방의 갯수가 4개를 초과하여  신청 할 수 없습니다.";
				
				}else {			
					
					// 찜 등록 조회
					if( wishR > 0 ) {			
										result = studyRoomService.deleteWish(srWish);								
										result = studyRoomService.insertWating(srWating);
										
										msg= "신청을 완료 하였습니다.";
								}
					
					  
					  			
						}		
															
			
			redirectAttr.addFlashAttribute("msg", msg);
			
			return "redirect:/mypage1/mystudylist.do";
			
		}
		
		//신청삭제
		@RequestMapping("/studyroom/deleteAlpplystudyroom.do")
		public String deleteAlpply(StudyRoomWaiting srWating, @RequestParam("srNo") int srNo, 
							@RequestParam("memberId") String memberId,
							RedirectAttributes redirectAttr) {
			String msg = "";
			int result = studyRoomService.deleteApply(srWating);
			msg = "신청을 취소 하였습니다.";
			redirectAttr.addFlashAttribute("msg", msg);			
			return "redirect:/mypage1/mystudylist.do";
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
		public String newstudyEnroll(StudyRoomList studyroomList, Model model, @RequestParam(value = "upFile", required = false) MultipartFile upFile, 
									@RequestParam("srCategory") int srCategory,@RequestParam("srTitle") String srTitle, 
									@RequestParam("srComment") String srComment, RedirectAttributes redirectAttr,
									HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException {
					
					Member loginMember = (Member)session.getAttribute("loginMember");
					
					String msg = "";
					
					//방 갯수 조회
					int countR = studyRoomService.selectParticipatingRoomCnt(loginMember.getMemberId());
					
					if(countR >= 4) {
						 msg= "스터디방의 갯수가 4개를 초과하여 방을 만들 수 없습니다.";
					}else {
						
						//sr_list													
						studyroomList.setSrCategory(srCategory);						
						studyroomList.setMemberId(loginMember.getMemberId());										
														
						
						//profile
						List<ProfileAttachment> proList = new ArrayList<>();
					
						String saveDirectory = request.getServletContext().getRealPath("/resources/upload");
						if(upFile.isEmpty()) {	
							
						}else {
						
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
						}
						
						//sr_log
						List <StudyRoomLog> srLog = new ArrayList<>();
						StudyRoomLog slog = new StudyRoomLog();
						slog.setMemberId(loginMember.getMemberId());
						srLog.add(slog);

						//sr_info
						List <StudyRoom> sRoom = new ArrayList<>();
						StudyRoom studyroom = new StudyRoom();
						
						studyroom.setMemberId(loginMember.getMemberId());
						studyroom.setSrTitle(srTitle);
						studyroom.setSrComment(srComment);
						sRoom.add(studyroom);
						
						
						log.debug("sRoom = {}", sRoom);
						log.debug("srLog = {}", srLog);
						log.debug("proList = {}", proList);

					//studyroom. profile 객체 DB저장하기
						studyroomList.setProList(proList);
						studyroomList.setSrLog(srLog);
						studyroomList.setSRoom(sRoom);
						
						int result = studyRoomService.insertStudyRoomList(studyroomList);
						
						 msg= "스터디방이 생성 되었습니다.";
						
					}

					
					redirectAttr.addFlashAttribute("msg", msg);

					return "redirect:/mypage1/mystudylist.do";

			}

		//스터디방 입장 - 인덱스 페이지
		@RequestMapping("/studyroom/main.do")
		public String main( @RequestParam("roomNum") int roomNum, @RequestParam(value="test", required = false) String test, Model model, HttpSession session) {

		if(test != null) {
			model.addAttribute("test", test);
			log.debug("test = {}",test);
		}
			
		
		log.debug("roomNum = {}", roomNum);
		
		StudyRoomInfo roomInfo = studyRoomService.selectRoomInfo(roomNum);
		List<StudyRoomLog> participants = studyRoomService.selectParticipantList(roomNum);
		List<String> applicants = studyRoomService.selectApplicantList(roomNum);
		
		List<Attendance> attendList = attendanceService.selectAttendList(roomNum);
		
		model.addAttribute("roomInfo", roomInfo);
		model.addAttribute("participants", participants);
		model.addAttribute("applicants", applicants);
		model.addAttribute("attendList", attendList);
		/*
		 * 아래부터 채팅 정보 불러올게요
		 */
		List<Chat> firstList = chatService.selectFirstChatList(roomNum);
		model.addAttribute("roomNo",roomNum);
		model.addAttribute("firstList",firstList);

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
		
			
			if(count >= 4) {
			    msg = memberId + "님은" + "참여방 개수 초과로 스터디방에 참여하실 수 없습니다";
			}else {
				result = studyRoomService.insertStudyLog(param);
				msg = result == 1 ? memberId + "님이 " 
						+ "스터디방에 참여하게 되었습니다" : "참여신청 수락에 실패하였습니다";
			}
			
			redirectAttr.addAttribute("roomNum"	, roomNum);
			redirectAttr.addFlashAttribute("msg", msg);
			
			return "redirect:/studyroom/main.do";
		}
		
		
		
		
		@RequestMapping("/studyroom/updateInfo.do")
		public String updateInfo() {
			return "/mypage2/mypage2_update";
			
		}
		
		@RequestMapping("/studyroom/update.do")
		public String updateRoomInfo( StudyRoomInfo studyRoomInfo, RedirectAttributes redirectAttr) {
			
			log.debug("studyRoomInfo = {}", studyRoomInfo);
			
			if(studyRoomInfo.getForceExitYN() == null)
				studyRoomInfo.setForceExitYN("N");
			
			int result = studyRoomService.updateRoomInfo(studyRoomInfo);
			
			redirectAttr.addFlashAttribute("msg", result == 1 ? "방 정보를 업데이트했습니다" : "방정보 업데이트에 실패했습니다");
			redirectAttr.addAttribute("roomNum"	, studyRoomInfo.getSrNo());
			return "redirect:/studyroom/main.do";
		}
		
		@RequestMapping(value="/studyroom/updateOpened.do", method=RequestMethod.POST)
		public String updateOpened(@RequestParam("roomNum") String srNo,
								 @RequestParam("openedYN") String openedYN,
								 RedirectAttributes redirectAttr) {
			
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("srNo", srNo);
			param.put("srOpenedYN", openedYN);
			
			int result = studyRoomService.updateRoomOpenedYN(param);
					
			redirectAttr.addFlashAttribute("msg", result == 1 ? "방 정보를 업데이트했습니다" : "방정보 업데이트에 실패했습니다");
			redirectAttr.addAttribute("roomNum"	, srNo);
			
			return "redirect:/studyroom/main.do";
		}
		
		@RequestMapping("/studyroom/updateLeader.do")
		public String changeLeader(@RequestParam("roomNum") String srNo, RedirectAttributes redirectAttr, HttpSession session) {
			
			log.debug("srNo = {}", srNo);
			
			Member loginMember = (Member)session.getAttribute("loginMember");
			log.debug("memberId = {}", loginMember.getMemberId());
			
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("srNo", srNo);
			param.put("memberId", loginMember.getMemberId());
			
			int result = studyRoomService.updateLog(param);
			
			redirectAttr.addFlashAttribute("msg", result == 1 ? "탈퇴가 완료되었습니다" : "스터디방 탈퇴를 실패했습니다");
			redirectAttr.addAttribute("roomNum"	, srNo);
			
			return "redirect:/mypage1_index.do";
		}
		
		@RequestMapping("/studyroom/withdraw.do")
		public String withdraw(@RequestParam("roomNum") String srNo, RedirectAttributes redirectAttr, HttpSession session) {
			
			Member loginMember = (Member)session.getAttribute("loginMember");
			log.debug("memberId = {}", loginMember.getMemberId());
			
			
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("srNo", srNo);
			param.put("memberId", loginMember.getMemberId());
			
			int result = studyRoomService.withdraw(param);
			
			redirectAttr.addFlashAttribute("msg", result == 1 ? "스터디방 탈퇴가 완료되었습니다" : "스터디방 탈퇴를 실패했습니다");
			
			
			return "redirect:/mypage1_index.do";
		}
		
}
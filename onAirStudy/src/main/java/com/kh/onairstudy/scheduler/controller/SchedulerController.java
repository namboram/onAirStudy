package com.kh.onairstudy.scheduler.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.scheduler.model.service.SchedulerService;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;
import com.kh.onairstudy.studyroom.model.vo.StudyRoomInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SchedulerController {

	@Autowired
	private SchedulerService schedulerService;
	
	@RequestMapping("/scheduler/main.do")
	public ModelAndView mainScheduler(ModelAndView mav, 
										@SessionAttribute("loginMember") Member member,
										@SessionAttribute(value="roomInfo", required=false) StudyRoomInfo info) {

		//내역가져오기
		List<Scheduler> addList = makeScheduleArrays(member, info);
		
		//확인
//		for(Scheduler sch : addList) {
//			System.out.println(sch);
//		}
		
		mav.addObject("list", addList);
		
		//방번호유무
		if(info==null)
			mav.setViewName("/mypage1/mypage1_scheduler");
		else
			mav.setViewName("/mypage2/mapage2_scheduler");
			
		
		return mav;
		
		
	}
	
	
//	@RequestMapping("/studyroom/scheduler.do")
//	public ModelAndView studyRoomScheduler(ModelAndView mav, HttpSession session) {
//
//		//내역가져오기
//		List<Scheduler> addList = makeScheduleArrays(session);
//		
//		mav.addObject("list", addList);
//		mav.setViewName("scheduler/studyroom-scheduler");
//		
//		return mav;
//	}
	
	
	
	public List<Scheduler> makeScheduleArrays(Member member, StudyRoomInfo info){
				
				//로그인된 아이디 가져오기
				String memberId = member.getMemberId();
				String srNo = null;
				
				//방번호유무 갈림
				if(info != null) {
					memberId = null;
					srNo = Integer.toString(info.getSrNo());
				}
		
				Map<String, Object> map = new HashMap<>();
				map.put("memberId", memberId);
				map.put("srNo", srNo);
					
				List<Scheduler> list = schedulerService.mainScheduler(map);
				
				List<Scheduler> addList = new ArrayList<>();

				Calendar c1 = Calendar.getInstance();
				Calendar c2 = Calendar.getInstance();
				
				for(Scheduler sch : list) {
					Date start = sch.getStartDate();
					Date end = sch.getEndDate();
					
					c1.setTime(start);
					c2.setTime(end);
					
					//시작날짜가 끝날짜보다 작을때만!
					if(start.compareTo(end) < 0) {
						//원객체
						addList.add(sch);
						
						//하루씩 더한 객체
						while(c1.compareTo(c2)!=0) {
							
							c1.add(Calendar.DATE, 1);
							//temp에 담기
							Date temp = new Date(c1.getTimeInMillis());
							
							//하루씩 더한 날짜를 새 객체에 담아주기
							Scheduler ssch = new Scheduler(sch.getNo(), sch.getMemberId(), sch.getSrNo(), 
															temp, sch.getEndDate(), sch.getContent(), sch.getColorCode(), 
															sch.getScheduleYN(), sch.getDYN(), sch.getTimeOpt(), sch.getEnabledYN());
							
							addList.add(ssch);
						}
					}else {
						//같은날짜일때
						addList.add(sch);
					}
					
				}
		
		return addList;
	}
	
	@RequestMapping("/scheduler/insert.do")
	public String insertSchedule(Scheduler sch, 
								RedirectAttributes redirectAttr) throws Exception {
		if(sch.getDYN()==null)
			sch.setDYN("N");
		
		sch.setEnabledYN("N");
		
		log.debug("sch={}", sch);
		System.out.println("sch="+sch);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		
		int result = schedulerService.insertSchedule(sch);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("msg", "일정 등록 성공");
		}else {
			redirectAttr.addFlashAttribute("msg", "일정 등록 실패");
		}
			
		return "redirect:/scheduler/main.do";
	}

	@RequestMapping("/scheduler/update.do")
	public String updateSchedule(Scheduler sch, 
			RedirectAttributes redirectAttr) throws Exception {
		if(sch.getDYN()==null)
			sch.setDYN("N");
		
		sch.setEnabledYN("N");
		
		System.out.println("sch="+sch);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("sche", "good");
		
		int result = schedulerService.updateSchedule(sch);
		
		if(result>0) {
			redirectAttr.addFlashAttribute("msg", "일정 수정 성공");
		}else {
			redirectAttr.addFlashAttribute("msg", "일정 수정 실패");
		}
//		
		return "redirect:/scheduler/main.do";
	}
	
	public RedirectAttributes makeYearMonths(Scheduler sch, RedirectAttributes redirectAttr){
		
		SimpleDateFormat fm1 = new SimpleDateFormat("YYYY");
		SimpleDateFormat fm2 = new SimpleDateFormat("MM");
		SimpleDateFormat fm3 = new SimpleDateFormat("dd");
		
		String a = fm1.format(sch.getStartDate());
		int b = Integer.parseInt(fm2.format(sch.getStartDate()))-1;
		String c = fm3.format(sch.getStartDate());
		
		System.out.println("a="+a+", b="+b+", c="+c);
		
		redirectAttr.addFlashAttribute("Y", a);
		redirectAttr.addFlashAttribute("M", b);
		redirectAttr.addFlashAttribute("D", c);
		
		return redirectAttr;
	}
	
	
	@RequestMapping("/scheduler/delete.do")
	public String deleteSchedule(@RequestParam("no") int no,
								RedirectAttributes redirectAttr) throws Exception {
		System.out.println("no="+no);
		
		Scheduler sch = schedulerService.selectOne(no);
		System.out.println("sch="+sch);
		
		//방예시
		sch.setMemberId(null);
		sch.setSrNo(15);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("sche", "good");
		
		int result = schedulerService.deleteSchedule(no);
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "일정 삭제 성공");
		else
			redirectAttr.addFlashAttribute("msg", "일정 삭제 실패");
			
		return "redirect:/scheduler/main.do";
	}
	
	
	@RequestMapping("/scheduler/todo.do")
	public String insertTodo(@RequestParam("content") String[] contents,
							@RequestParam("checked") boolean[] yn,
							@RequestParam("startDate") Date startDate,
							@SessionAttribute("loginMember") Member member,
							@SessionAttribute(value="roomInfo", required=false) StudyRoomInfo info,
							RedirectAttributes redirectAttr) {
		
		Scheduler sch = null;
		List<Scheduler> list = new ArrayList<>();
		//객체화
		for(int i = 0 ; i<contents.length;i++) {

			sch = new Scheduler();
			

			sch.setMemberId(member.getMemberId());
			sch.setSrNo(0);
			//방번호유무
			if(info != null) {
				sch.setSrNo(info.getSrNo());
				sch.setMemberId(null);
			}
			sch.setStartDate(startDate);
			sch.setEndDate(startDate);
			sch.setContent(contents[i]);
			String tempYn = yn[i] == true ? "Y" : "N";
			sch.setEnabledYN(tempYn);

			System.out.println(sch);
			list.add(sch);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", member.getMemberId());
		if(info != null)
			map.put("srNo", info.getSrNo());
		map.put("startDate", startDate);
		
		//이전내역삭제
		int result = schedulerService.deleteTodo(map); 
		
		//새로등록
		result = schedulerService.insertTodo(list);
		
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("todo", "good");
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "리스트 저장 성공");
		else
			redirectAttr.addFlashAttribute("msg", "리스트 저장 실패");
		
		
		return "redirect:/scheduler/main.do";
	}
	
	@RequestMapping("/scheduler/delTodo.do")
	public String deleteTodo(@RequestParam("startDate") Date startDate,
							@SessionAttribute("loginMember") Member member,
							@SessionAttribute(value="roomInfo", required=false) StudyRoomInfo info,
							RedirectAttributes redirectAttr) {
		
		Map<String, Object> map = new HashMap<>();
		
		
		map.put("memberId", member.getMemberId());
		map.put("srNo", null);

		//방번호유무
		if(info != null) {
			map.put("memberId", null);
			map.put("srNo", info.getSrNo());
		}
		
		map.put("startDate", startDate);

		int result = schedulerService.deleteTodo(map);
		Scheduler sch = new Scheduler();
		sch.setStartDate(startDate);
		
		redirectAttr = makeYearMonths(sch, redirectAttr);
		redirectAttr.addFlashAttribute("todo", "good");
		
		if(result>0)
			redirectAttr.addFlashAttribute("msg", "리스트 삭제 성공");
		else
			redirectAttr.addFlashAttribute("msg", "리스트 삭제 성공");
		
		
		return "redirect:/scheduler/main.do";
	}
	
	
	

	
	
}

package com.kh.onairstudy.scheduler.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.scheduler.model.service.SchedulerService;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SchedulerController {

	@Autowired
	private SchedulerService schedulerService;
	
	@RequestMapping("/scheduler/main.do")
	public ModelAndView mainScheduler(ModelAndView mav, HttpSession session) {

		//내역가져오기
		List<Scheduler> addList = makeScheduleArrays(session);
		
		//확인
//		for(Scheduler sch : addList) {
//			System.out.println(sch);
//		}
		
		mav.addObject("list", addList);
		mav.setViewName("scheduler/scheduler");
		
		return mav;
		
		
	}
	
	
	public List<Scheduler> makeScheduleArrays(HttpSession session){
				
				//로그인된 아이디 가져오기
				//추후에 방번호가 같이 오면 방번호 null 유무로  가져옴
				String memberId = (String)session.getAttribute("memberId");
				//임시
				memberId = "honggd";
				List<Scheduler> list = schedulerService.mainScheduler(memberId);

				
				String srNo = (String)session.getAttribute("srNo");
				srNo="15";
				if(srNo != null)
					list = schedulerService.mainSchedulerRoom(srNo);
				
				
				
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
							HttpSession session,
							RedirectAttributes redirectAttr) {
		
		String memberId = (String)session.getAttribute("memberId");
		
		Scheduler sch = null;
		List<Scheduler> list = new ArrayList<>();
		//객체화
		for(int i = 0 ; i<contents.length;i++) {

			sch = new Scheduler();
			
			sch.setMemberId("honggd");
			sch.setStartDate(startDate);
			sch.setEndDate(startDate);
			sch.setContent(contents[i]);
			String tempYn = yn[i] == true ? "Y" : "N";
			sch.setEnabledYN(tempYn);

			System.out.println(sch);
			list.add(sch);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", "honggd");
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
							HttpSession session,
							RedirectAttributes redirectAttr) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberId", "honggd");
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

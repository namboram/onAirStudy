package com.kh.onairstudy.scheduler.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.member.model.vo.Member;
import com.kh.onairstudy.scheduler.model.service.SchedulerService;
import com.kh.onairstudy.scheduler.model.vo.Scheduler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Scheduler_Controller {

	@Autowired
	private SchedulerService schedulerService;

	//ajax를 통한 달력조회
	@RequestMapping("/scheduler/scheduler.do")
	@ResponseBody
	public Object mainScheduler_(@RequestParam("roomNum") String roomNum) {

		// 내역가져오기
		List<Scheduler> addList = makeScheduleArrays(roomNum);

		Map<String, Object> map = new HashMap<>();
		map.put("list", addList);
		map.put("roomNum", roomNum);
		map.put("code", "OK");

		log.debug("roomNum ={}", roomNum);

		return map;
	}
	
	//마이페이지2의 처음 주소
	@RequestMapping("/scheduler/scheduler_.do")
	public ModelAndView mainScheduler_main(@RequestParam("roomNum") String roomNum,
			ModelAndView mav) {


		// 내역가져오기
		List<Scheduler> addList = makeScheduleArrays(roomNum);

		mav.addObject("list", addList);
		mav.addObject("roomNum", roomNum);
		mav.setViewName("scheduler/scheduler_");

		log.debug("roomNum ={}", roomNum);

		return mav;
	}

	// 일정 시작~끝 날짜의 중간 날짜들 찾아주기
	public List<Scheduler> makeScheduleArrays(String roomNum) {

		Map<String, Object> map = new HashMap<>();

		map.put("srNo", roomNum);

		List<Scheduler> list = schedulerService.mainScheduler(map);

		List<Scheduler> addList = new ArrayList<>();

		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		for (Scheduler sch : list) {
			// 시작날짜와 끝날짜
			Date start = sch.getStartDate();
			Date end = sch.getEndDate();

			c1.setTime(start);
			c2.setTime(end);

			// 시작날짜가 끝날짜보다 작을때만!
			// compareTo 같으면 0, 크면 양수, 작으면 음수
			if (start.compareTo(end) < 0) {

				addList.add(sch);

				// 두 날짜가 같이 않으면
				while (c1.compareTo(c2) != 0) {

					// 하루씩 추가해줌
					c1.add(Calendar.DATE, 1);
					// temp에 담기
					Date temp = new Date(c1.getTimeInMillis());
					// 하루씩 더한 날짜를 새 객체에 담아주기
					Scheduler ssch = new Scheduler(sch.getNo(), sch.getMemberId(), sch.getSrNo(), temp,
							sch.getEndDate(), sch.getContent(), sch.getColorCode(), sch.getScheduleYN(), sch.getDYN(),
							sch.getTimeOpt(), sch.getEnabledYN());

					addList.add(ssch);
				}
			} else {
				// 같은날짜일때
				addList.add(sch);
			}

		}

		return addList;
	}

	// 일정 넣어주기
	@RequestMapping("scheduler/insert_.do")
	@ResponseBody
	public void insertSchedule(Scheduler sch, ModelAndView mav, HttpServletResponse response) throws Exception {
		// jsp에서 처리못한 값들 처리해주기
		if (sch.getDYN() == null)
			sch.setDYN("N");

		sch.setEnabledYN("N");

		log.debug("sch={}", sch);

		int result = schedulerService.insertSchedule(sch);

		response.setContentType("text/plain; charset=utf-8");

		if (result > 0)
			response.getWriter().append("일정을 입력하였습니다.");
		else
			response.getWriter().append("일정 입력을 실패했습니다.");
	}

	// 일정 수정
	@RequestMapping("/scheduler/update_.do")
	public void updateSchedule(Scheduler sch, HttpServletResponse response) throws Exception {

		// jsp에서 처리못한 값들 처리해주기
		if (sch.getDYN() == null)
			sch.setDYN("N");

		sch.setEnabledYN("N");

		log.debug("sch={}", sch);

		int result = schedulerService.updateSchedule(sch);

		response.setContentType("text/plain; charset=utf-8");

		if (result > 0)
			response.getWriter().append("일정을 수정하였습니다.");
		else
			response.getWriter().append("일정 수정을 실패했습니다.");
	}

	// 일정 삭제
	@RequestMapping("/scheduler/delete_.do")
	@ResponseBody
	public void deleteSchedule(@RequestParam("dNo") int dNo, HttpServletResponse response) throws Exception {

		log.debug("dNo={}", dNo);

		int result = schedulerService.deleteSchedule(dNo);

		response.setContentType("text/plain; charset=utf-8");

		if (result > 0)
			response.getWriter().append("일정을 삭제하였습니다.");
		else
			response.getWriter().append("일정 삭제를 실패했습니다.");
	}

	// 투두리스트 전체삭제
	@RequestMapping("/scheduler/delTodo_.do")
	@ResponseBody
	public void deleteTodo(@RequestParam("startDate") Date startDate,
			@RequestParam(value = "roomNum", required = false) String roomNum, HttpServletResponse response)
			throws Exception {

		Map<String, Object> map = new HashMap<>();

		map.put("srNo", roomNum);
		map.put("startDate", startDate);
		
		log.debug("map={}", map);

		// 삭제
		int result = schedulerService.deleteTodo(map);

		response.setContentType("text/plain; charset=utf-8");

		if (result > 0)
			response.getWriter().append("리스트를 삭제하였습니다.");
		else
			response.getWriter().append("리스트 삭제를 실패했습니다.");

	}

	//투두리스트 삭제+입력
	@RequestMapping("/scheduler/todo_.do")
	@ResponseBody
	public void insertTodo_(@RequestParam("content") String[] contents, @RequestParam("checked") boolean[] yn,
			@RequestParam("startDate") Date startDate, @RequestParam("roomNum") String roomNum,
			HttpServletResponse response) throws Exception {

		Scheduler sch = null;
		List<Scheduler> list = new ArrayList<>();

		// 객체화 및 list 넣기
		for (int i = 0; i < contents.length; i++) {

			sch = new Scheduler();

			sch.setSrNo(roomNum);

			sch.setStartDate(startDate);
			sch.setEndDate(startDate);
			sch.setContent(contents[i]);
			// 체크박스 여부에 따라 입력
			String tempYn = yn[i] == true ? "Y" : "N";
			sch.setEnabledYN(tempYn);

			log.debug("sch={}", sch);
			list.add(sch);
		}

		Map<String, Object> map = new HashMap<>();

		map.put("srNo", roomNum);

		map.put("startDate", startDate);

		// 이전내역삭제
		int result = schedulerService.deleteTodo(map);

		// 새로등록
		result = schedulerService.insertTodo(list);

		response.setContentType("text/plain; charset=utf-8");
		response.getWriter().append("리스트를 저장하였습니다.");
	}

}

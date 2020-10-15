package com.kh.onairstudy.diary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onairstudy.diary.model.service.DiaryService;
import com.kh.onairstudy.diary.model.vo.Diary;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping("/diaryList.do")
	public String diary(Model model) {
		log.debug("공부다이어리 인덱스 페이지 요청!");
		List<Diary> list = null;
		
		try {
			list = diaryService.selectDiaryList();
			model.addAttribute("list", list);
		} catch(Exception e) {
			log.error("공부다이어리 목록 조회 오류", e);
			//예외페이지 이동을 위해 스프링 컨테이너에 예외 던짐.
			throw e;
		}
		
		log.debug("list = {}", list);
		
		
		return "diary/diaryList";
	}
	


	/*
	@RequestMapping("/insertDiary.do")
	public String insertMemo(Diary diary, 
							 RedirectAttributes redirectAttr) {
		try {
			int result = diaryService.insertDiary(diary);
			redirectAttr.addFlashAttribute("msg", "다이어리 등록 성공!");
		} catch(Exception e) {
			log.error("메모 등록 오류!", e);
			redirectAttr.addFlashAttribute("msg", "다이어리 등록 오류!");
		}
		
		return "redirect:/diary/diaryOne.do";
	}
	
	
	@RequestMapping(value = "/deleteMemo.do",
					method = RequestMethod.POST)
	public String deleteMemo(Memo memo,
							 RedirectAttributes redirectAttr){
		log.debug("메모 삭제");
		Map<String, String> param = new HashMap<>();
		param.put("no", String.valueOf(memo.getNo()));
		param.put("password", memo.getPassword());
		
		try {
			int result = memoService.deleteMemo(param);
			String msg = (result > 0) ? "메모 삭제 성공" : "비밀번호가 틀립니다.";
			redirectAttr.addFlashAttribute("msg", msg);
		} catch(Exception e) {
			log.error("메모삭제 오류", e);
			throw e;
		}
		return "redirect:/memo/memo.do";
	}
	*/
}

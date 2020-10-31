package com.kh.onairstudy.diary.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.admin.controller.AdminController;
import com.kh.onairstudy.diary.model.service.DiaryService;
import com.kh.onairstudy.diary.model.vo.Diary;
import com.kh.onairstudy.diary.model.vo.DiaryReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/diary")
public class DiaryController {

   @Autowired
   private DiaryService diaryService;

   
   @RequestMapping("/diaryList.do")
   public ModelAndView diaryList(ModelAndView mav,
		   						@RequestParam(value="searchType",
		   						required=false) String searchType,
		   						@RequestParam(value="searchKeyword",
		   						required=false) String searchKeyword,
		   						HttpServletRequest request, HttpServletResponse response) {

		// 페이징
		// 1. 파라미터값 변수에 담기
		int numPerPage = 15;// 한페이지당 수
		int cPage = 1;// 요청페이지
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {

		}

		// 리퀘온 주소
		String url = request.getRequestURI();

		Map<String, Object> map = new HashMap<>();

		// 검색내용이 함께 왔을 때
		if (searchType != null && searchKeyword != null) {
			map.put("searchType", searchType);
			map.put("searchKeyword", searchKeyword);

			url += "?searchType=" + searchType + "&searchKeyword=" + searchKeyword;

		}

		// 전체수, 전체페이지수 구하기
		int totalContents = diaryService.totalDiary(map);

		//페이지바 만드는 문자열
		String pageBar = new AdminController().getPageBarHtml(cPage, numPerPage, totalContents, url);

		log.debug("pageBar={}", pageBar);

		log.debug("totalContents ={}", totalContents);

		// rnum 넣어주기
		map.put("start", (cPage - 1) * numPerPage + 1);
		map.put("end", cPage * numPerPage);
		map.put("pageBar", pageBar);
		log.debug("map={}", map);

		// VO
		List<Diary> list = diaryService.selectDiaryList(map);

		// Map
//      List<Map<String, Object>> list = diaryService.selectDiaryMapList();

//      log.debug("list = {}", list);

		mav.addObject("map", map);
		mav.addObject("list", list);

		mav.setViewName("diary/diaryList");
		return mav;
	}

//   @RequestMapping("/diaryForm.do")
//   public void diaryForm() {
//      //url -> viewName
//      //ViewNameTranslator에 의해서 자동 유추됨.
//   }
   
   @RequestMapping("/diaryForm.do")
   public String diaryForm() {
      return "diary/diaryTest";
   }
   
   @RequestMapping("/insertDiary.do")
   public String insertDiary(Diary diary,RedirectAttributes redirectAttr) {
      int result = diaryService.insertDiary(diary);
      log.info("diary={}",diary);
      redirectAttr.addFlashAttribute("msg", "게시글 등록 성공");
      return "redirect:/diary/diaryList.do";
   }
   
   @RequestMapping("/deleteDiary.do")
   public String deleteDiary(@RequestParam int no,RedirectAttributes redirectAttr) {
	   int result = diaryService.deleteDiary(no);
	   redirectAttr.addFlashAttribute("msg","게시글 삭제 완료");
	   return "redirect:/diary/diaryList.do";
   }
  
       @RequestMapping("/diaryDetail.do") 
       public String diaryDetail(@RequestParam("no") int no,
    		   					 Model model) { 
         //1. 각 테이블별 쿼리로처리 
         Diary diary = diaryService.selectOneDiary(no);
         List<DiaryReply> list = diaryService.selectDiaryReplyList(no);
         
         System.out.println(no);
         
         log.debug("diary = {}", diary);
         log.debug("list = {}", list);
         
         model.addAttribute("diary", diary);
         model.addAttribute("list", list);

          return "diary/diaryDetail"; 
       }
      
    //다이어리 댓글-------------------------------------
    //댓글 입력
   	@RequestMapping("/insertDiaryReply.do")
   	public String insertDiaryReply(@RequestParam("replyContent") String replyContent,
   								   @RequestParam("diaryNo") int diaryNo,
   								   @RequestParam("memberId") String memberId,
   									HttpServletRequest request,
   									RedirectAttributes redirectAttr) {
   		
   		memberId = request.getParameter("memberId"); 
		System.out.println(memberId);
   		System.out.println(replyContent);
   		System.out.println(diaryNo);
   		
   		DiaryReply diaryReply = new DiaryReply();
   		diaryReply.setMemberId(memberId);
   		diaryReply.setDiaryNo(diaryNo);
   		diaryReply.setReplyContent(replyContent);
   		
   		
   		try {
   			int result = diaryService.insertDiaryReply(diaryReply);
   			redirectAttr.addFlashAttribute("msg", "댓글 등록 성공!");
   		} catch(Exception e) {
   			log.error("댓글 등록 오류!", e);
   			redirectAttr.addFlashAttribute("msg", "댓글 등록 오류!");
   		}
   		
   		return "redirect:/diary/diaryDetail.do?no="+diaryNo;
   	}
    
   	//댓글삭제
   	@RequestMapping("/deleteReply.do")
   	public String deleteDiaryReply(@RequestParam("no") int no,
   								   @RequestParam("diaryNo") int diaryNo,
   								   HttpServletRequest request,
   								   RedirectAttributes redirectAttributes) {

   		
   		diaryNo = Integer.valueOf(request.getParameter("diaryNo"));
   		DiaryReply diaryReply = new DiaryReply();   		
   		diaryReply.setNo(no);
   		diaryReply.setDiaryNo(diaryNo);
   		
   		int result = diaryService.deleteDiaryReply(diaryReply);
   		redirectAttributes.addFlashAttribute("msg", result>0 ? "댓글 삭제성공" : "댓글 삭제실패");
   		return "redirect:/diary/diaryDetail.do?no="+diaryNo;
   				
   	}
   	
     
      
}
package com.kh.onairstudy.diary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView diaryList(ModelAndView mav) {
		//VO
		List<Diary> list = diaryService.selectDiaryList();
		
		//Map	
//		List<Map<String, Object>> list = diaryService.selectDiaryMapList();
		
		log.debug("list = {}", list);
		mav.addObject("list", list);
		
		mav.setViewName("diary/diaryList");
		return mav;
	}
	/*
	@GetMapping("/diary/diarySearch")
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
		
		List<DiaryDto> diarySList = diaryService.searchPosts(keyword);
		
		model.addAttribute("diaryList", diarySList);
		
		return "diary/diarylist";
	}
*/
	
	
	/*
	@RequestMapping(value = "/diaryEnroll.do",
			method = RequestMethod.POST)
public String diaryEnroll(Diary diary, 
					  @RequestParam(value = "upFile",
							  	    required = false) MultipartFile[] upFiles,
					  RedirectAttributes redirectAttr,
					  HttpServletRequest request) 
							  throws IllegalStateException, IOException {
		log.debug("diary = {}", diary);
//		log.debug("upfile.name = {}", upFile.getOriginalFilename());
//		log.debug("upfile.size = {}", upFile.getSize());
		
		
		//1. 서버컴퓨터에 업로드한 파일 저장하기
		List<DiaryAttachment> attachList = new ArrayList<>();
		
		//저장경로
		String saveDirectory = request.getServletContext()
									  .getRealPath("/resources/upload/diary");
		
		for(MultipartFile upFile : upFiles) {
			//파일을 선택하지 않고 전송한 경우
			if(upFile.isEmpty())
				continue;
			
			//1.파일명(renameFilename) 생성
			String renamedFilename = Utils.getRenamedFileName(upFile.getOriginalFilename());
			
			//2.메모리의 파일 -> 서버컴퓨터 디렉토리 저장  tranferTo
			File dest = new File(saveDirectory, renamedFilename);
			upFile.transferTo(dest);
			
			//3.attachment객체 생성
			DiaryAttachment attach = new DiaryAttachment();
			attach.setOriginalFilename(upFile.getOriginalFilename());
			attach.setRenamedFilename(renamedFilename);
			attachList.add(attach);
			
		//		log.debug("upFile.name = {}", upFile.getOriginalFilename());
		//		log.debug("upFile.size = {}", upFile.getSize());
			
		}
		log.debug("attachList = {}", attachList);
		diary.setAttachList(attachList);
		
		
		
		//2. Board, Attachment객체 DB에 저장하기
		int result = diaryService.insertDiary(diary);
		
		//3. 처리결과 msg 전달
		redirectAttr.addFlashAttribute("msg", "게시글 등록 성공");
		
		
		return "redirect:/diary/diaryList.do";
		}
		
		
		@RequestMapping("/diaryDetail.do")
		public ModelAndView boardDetail(@RequestParam("no") int no,
									ModelAndView mav) {
		//1. 각 테이블별 쿼리로 처리
		//Board board = boardService.selectOneBoard(no);
		//2. mybatis collection을 이용해서 join된 쿼리 전송
		Diary diary = diaryService.selectOneDiaryCollection(no);
		log.debug("diary = {}", diary);
		
		mav.addObject("diary", diary);
		
		mav.setViewName("diary/diaryDetail");
		return mav;
		}
	 */
		
}

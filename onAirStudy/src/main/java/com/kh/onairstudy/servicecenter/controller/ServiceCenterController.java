package com.kh.onairstudy.servicecenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onairstudy.servicecenter.model.service.ServiceCenterService;
import com.kh.onairstudy.servicecenter.model.vo.Pager;
import com.kh.onairstudy.servicecenter.model.vo.ServiceCenter;
import com.kh.onairstudy.servicecenter.model.vo.ServiceContent;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;
	
	

	@RequestMapping("/servicecenter.do")
	public ModelAndView serviceList(ModelAndView mav) {
		
		List<ServiceCenter> serviceList = serviceCenterService.selectServiceList();
		List<ServiceContent> serviceContentList = serviceCenterService.selectServiceContentList();
	
		mav. addObject("serviceList", serviceList);
		mav. addObject("serviceContentList", serviceContentList);
		
		mav.setViewName("service/servicecenter");
		
		return mav;
	
	}
	

	 @RequestMapping("list.do")    //세부적인 url mapping
	    public ModelAndView list(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
	            
	            //초기값을 설정해야 에러가 발생되지 않는다.
	            @RequestParam(defaultValue="1") int curPage,
	            @RequestParam(defaultValue="memberId") String search_option,
	            @RequestParam(defaultValue="") String keyword
	 
	            )
	             throws Exception{
	        
	        //레코드 갯수를 계산
	        int count = 1000;
	        
	        //페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
	        Pager pager = new Pager(count, curPage);
	        int start = pager.getPageBegin();
	        int end =  pager.getPageEnd();
	        

	        //map에 담기위해 리스트에 검색옵션, 키워드, 시작과 끝번호를 저장
	        List<ServiceCenter> list = serviceCenterService.listAll(search_option, keyword, start, end);
	        
	        ModelAndView mav = new ModelAndView();
	        Map<String,Object> map = new HashMap<>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
	        
	        map.put("list", list);                         //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
	        map.put("pager", pager);
	        map.put("count", count);
	        map.put("search_option", search_option);
	        map.put("keyword", keyword);
	        mav.addObject("map", map);                    //modelandview에 map를 저장
	        
	        mav.setViewName("service/servicecenter");                
	        
	        return mav;    //게시판 페이지로 이동
	    
	    }
	
	
	
	
	
	
// 글쓰기폼
	@RequestMapping("/service/serviceForm.do")
	public String serviceForm() {
		return "service/serviceForm";
	}
	

	
	
//	게시글 등록
	@RequestMapping(value = "/service/insertService.do",
		    method = RequestMethod.POST)
		public String insertService(ServiceCenter servicecenter, 
							RedirectAttributes redirectAttr,
							HttpSession session) {
		System.out.println("servicecenter = " + servicecenter);
		 
//		String memberId = (String)session.getAttribute("memberId");
//		
//		//로그인 되어있는지 확인하는 if문, 로그인이 안되어있으면 경고메시지를 출력하고 홈으로 넘어간다.
//		if (memberId == null) {
//			
////			write.setContentType("text/html; charset=UTF-8");
////			PrintWriter out_write = write.getWriter();
////			out_write.println("<script>alert('로그인이 되어있지 않습니다. 로그인을 먼저 해주세요.');</script>");
////			out_write.flush();
//			
//			
//			
//		} else {

		//업무로직
		int result = serviceCenterService.insertService(servicecenter);
		String msg = (result > 0) ? "문의글 등록 성공!" : "문의글 등록 실패!";
		System.out.println("msg = " + msg);
		
		
		redirectAttr.addFlashAttribute("msg", msg);
		
		
		
		return "forward:/servicecenter.do";
		}
			
	
	
	

	
}

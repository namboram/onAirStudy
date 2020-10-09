package com.kh.onairstudy.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * DispatcherServlet --- Handler
 * 
 * 1. preHandler : 핸들러메소드 호출전
 * 2. postHandler : 핸들러메소드가 DispatcherServlet으로 리턴되기 전
 * 3. afterCompletrion : view단 처리가 끝난 시점. 
 * 
 */
public class LoggerInterceptor extends HandlerInterceptorAdapter{

	private static Logger log = LoggerFactory.getLogger(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.debug("================= START =================");
		log.debug(request.getRequestURI());
		log.debug("-----------------------------------------");
		
		//true를 리턴해야 정상적인 흐름이 가능하다.
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {

		
		super.postHandle(request, response, handler, mav);
		
		log.debug("-----------------------------------------");
		log.debug("mav = {}", mav);
		log.debug("-----------------------------------------");
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
		
		log.debug("=====================END=====================\n");
	}

	
	
}

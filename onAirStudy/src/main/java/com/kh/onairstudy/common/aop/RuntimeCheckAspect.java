package com.kh.onairstudy.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class RuntimeCheckAspect {
	
//	@Pointcut("execution(String com.kh.spring.memo.controller.MemoController.insertMemo(..))")
	public void pointcut() {
		
	}
	
	@Around("pointcut()")
	public Object runtimeCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		
		//StopWatch
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object obj = joinPoint.proceed();
		
		
		stopWatch.stop();
		log.debug("실행시간 : {} ms", stopWatch.getTotalTimeMillis());
		
		return obj;
	}
	
	
	
	
	
}

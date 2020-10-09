package com.kh.onairstudy.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LoggerAspect {

	/**
	 * 여러 joinpoint중에 advice를 실행할 joinpoint를 가리키는 표현식 작성
	 */
	
	
//	@Pointcut("execution(* com.kh.spring.memo..*(..))")
	public void pointcut() {
		
	}
	
	@Around("pointcut()")
	public Object aroundLogger(ProceedingJoinPoint joinPoint) throws Throwable{
		
		Signature signiture = joinPoint.getSignature();
		String type = signiture.getDeclaringTypeName();
		String methodName = signiture.getName();
		
		//joinPoint 실행전
		log.debug("[Around - Before] {}.{}" , type, methodName);
		Object obj = joinPoint.proceed();
		
		//joinPoint 실행후
		log.debug("[Around - After] {}.{}" , type, methodName);
		
		return obj;
		
	}
	
	//@Before("pointcut()")
	public void beforeLogger(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		String type = signature.getDeclaringTypeName(); //클래스명
		String methodName = signature.getName(); //메소드명
		log.debug("[Before] {}.{}", type, methodName);
	}
	
	
	//@AfterReturning(value = "pointcut()",
	//				returning = "returnObj")
	public void afterReturningLogger(JoinPoint joinPoint,
									Object returnObj) {
		Signature signature = joinPoint.getSignature();
		String type = signature.getDeclaringTypeName(); //클래스명
		String methodName = signature.getName(); //메소드명
		log.debug("[AfterReturning] {}.{}", type, methodName);
		log.debug("returnObj = {}", returnObj);
	}
	
}

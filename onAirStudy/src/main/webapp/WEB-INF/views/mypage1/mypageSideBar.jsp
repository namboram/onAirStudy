<%@page import="com.kh.onairstudy.member.model.vo.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">



	<nav class="side-navbar mypage-sideBar">
		<!-- Sidebar Header-->
		<div class="sidebar-header py-5">
			<div class="avatar">
				<img src="${ pageContext.request.contextPath }/resources/images/avatar-7.jpg" alt="...">
				<h3>${loginMember.memberId }</h3>
				<c:if test="${ loginMember.memberRole eq 'P'}">
					<h5>premium</h5>
				</c:if>
			</div>
				<div class="d-day-display">
		        <hr>
		        <span>D - 56</span></br>
		        <span>2020.11.02</span></br>
		        <span>토익시험</span></br>
		    	<hr>
	   		</div>
		</div>
		<span class="heading">Menu</span>
		
		<ul class="list-unstyled">
			<li><a href="${ pageContext.request.contextPath}/mypage1/invitationlist.do">초대내역</a></li>
			<li><a href="${ pageContext.request.contextPath }/premium.do">프리미엄          
				<div class="badge badge-info" style="margin-left:5px;">
				<c:if test="${ not empty memberInfo.paymentDay}">
					D-${ memberInfo.paymentDay }
				</c:if>
				</div>
				</a></li>
			<li><a href="${ pageContext.request.contextPath}/mypage1/mystudylist.do">내 스터디방</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/scheduler.do">스케줄러</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/memberDetail.do">내 정보</a></li>
		</ul>
	</nav>
	
	
	
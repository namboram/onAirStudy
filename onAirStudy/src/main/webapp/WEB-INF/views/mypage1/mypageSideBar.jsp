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
			<c:if test="${ not empty memberInfo }">
				<div class="d-day-display">
					<hr>
					<h5>D - ${memberInfo.dayCnt }</h5> 
					<h5><fmt:formatDate value="${memberInfo.startDate }" pattern="yyyy/MM/dd"></fmt:formatDate></h5>
					<h5>${memberInfo.content }</h5>
					<hr>
				</div>
			</c:if>
		</div>
		<span class="heading">Menu</span>
		
		<ul class="list-unstyled">
			<li><a href="${ pageContext.request.contextPath}/mypage1/invitationlist.do">초대내역</a></li>
			<li><a href="${ pageContext.request.contextPath }/premium.do">프리미엄          
				<div class="badge badge-info" style="margin-left:5px;">
				<c:if test="${ not empty sideBarInfo.paymentDay}">
					D-${ sideBarInfo.paymentDay }
				</c:if>
				</div>
				</a></li>
			<li><a href="${ pageContext.request.contextPath}/mypage1/mystudylist.do">내 스터디방</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/scheduler.do">스케줄러</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/memberDetail.do">내 정보</a></li>
			<%-- <li class="mylist">
				<a href="#">내정보</a>
				  <div id="myListDropdown" class="mylist-dropdown-content">
				    <a href="${ pageContext.request.contextPath }/mypage1/memberDetail.do">정보수정</a>
				    <a href="${ pageContext.request.contextPath }/mypage1/mypage1_paymentList.do">결제내역</a>
				  </div>
			</li> --%>
		</ul>
	</nav>
	
<script>
$(".d-day-display").click(function(){

	var startDate = "<fmt:formatDate value='${memberInfo.startDate }' pattern='yyyy/MM/dd'></fmt:formatDate>";
	
	location.href="${pageContext.request.contextPath}/mypage1/search.do?startDate="+startDate;
});

</script>
	
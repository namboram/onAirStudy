<%@page import="com.kh.onairstudy.member.model.vo.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">
<style>
.sidenav-header-inner img{
	width: 150px;
	height: 150px;
}
</style>
	<nav class="side-navbar mypage-sideBar" style="width:100%; padding:5%; height:100%;"  >
		<div class="sidenav-header d-flex align-items-center justify-content-center">
			<!-- User Info-->
			<div class="sidenav-header-inner text-center">
				<%-- <img src="${pageContext.request.contextPath }/resources/images/avatar-7.jpg" alt="" class="img-fluid rounded-circle"> <br /> --%>
				<c:if test="${ not empty sideBarInfo.profile }">
					<img src="${ pageContext.request.contextPath }/resources/upload/${sideBarInfo.profile}" alt="" class="img-fluid rounded-circle">
				</c:if>
				<c:if test="${ empty sideBarInfo.profile }">
					<img src="${ pageContext.request.contextPath }/resources/upload/basicPic.png" alt="" class="img-fluid rounded-circle"> 
				</c:if>
				<h2 class="h5" style="margin-top: 10px;">${loginMember.memberId }</h2>
				<c:if test="${ loginMember.memberRole eq 'P'}">
					<span>Premium</span>
				</c:if>
				<c:if test="${ loginMember.memberRole eq 'M'}">
					<span>Member</span>
				</c:if>
				<c:if test="${ not empty memberInfo }">
					<div class="d-day-display">
						<hr>
							<c:set var="cnt" value="${ memberInfo.dayCnt }"/>
							<c:if test="${ cnt eq 0 }">
								<span>D - day</span></br>
							</c:if>
							<c:if test="${ cnt ne 0 }">
								<span>D - ${ cnt }</span></br>
							</c:if>
						<span><fmt:formatDate value="${memberInfo.startDate }" pattern="yyyy/MM/dd"></fmt:formatDate></span></br>
						<span>${memberInfo.content }</span>
						<hr>
					</div>
				</c:if>	
			</div>
		</div>
		<span class="heading">Menu</span>
		<ul class="list-unstyled">
			<li><a
				href="${ pageContext.request.contextPath}/mypage1/invitationlist.do">초대내역</a></li>
			<li><a href="${ pageContext.request.contextPath }/premium.do">프리미엄
				<c:if test="${ not empty sideBarInfo.paymentDay}">
					<div class="badge badge-info" style="margin-left: 5px;">D-${ sideBarInfo.paymentDay }
					</div>
				</c:if>
			</a>
			</li>
			<li><a href="${ pageContext.request.contextPath}/mypage1/mystudylist.do">내스터디방</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/scheduler.do">스케줄러</a></li>
			<li><a href="${ pageContext.request.contextPath }/mypage1/memberDetail.do">내정보</a></li>
		</ul>
</nav>
<script>
$(".d-day-display").click(function(){

	var startDate = "<fmt:formatDate value='${memberInfo.startDate }' pattern='yyyy/MM/dd'></fmt:formatDate>";
	
	location.href="${pageContext.request.contextPath}/mypage1/search.do?startDate="+startDate;
});

</script>
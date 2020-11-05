<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<style>
.sidenav-header-inner img{
	width: 150px;
	height: 150px;
}
.collapse a:before {
	display : none;
}
</style>
	<nav class="side-navbar" style="width:100%; padding:5%; height:100%;">
		<!-- Sidebar Header-->
		<div class="sidenav-header d-flex align-items-center justify-content-center">
			<!-- User Info-->
			<div class="sidenav-header-inner text-center" style="padding : 5%;">
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
			</div>
			<input type="hidden" id="attendDay" value="${roomInfo.attendDay}"/>
			<input type="hidden"  id="attendTime" value="${roomInfo.attendTime }"/>
		</div>
		
		
		<br />
		<span class="heading">Menu</span>
		<!-- Sidebar Navidation Menus-->
		<ul class="list-unstyled">
			<li><a onclick="goToIndex(${roomInfo.srNo})">우리 스터디방</a></li>
			<li>
				<a href="#participantsDropdown" aria-expanded="false" data-toggle="collapse">참여인원</a>
				<ul id="participantsDropdown" class="collapse list-unstyled">
					<c:forEach var="part" items="${participants }">
						<li>
							<div class="participantsJH">
								<c:if test="${part.leaderYN eq 'Y'}">
									<i class="fa fa-star" aria-hidden="true"></i>
									<input type="hidden" id="leaderId" value="${part.memberId }" />
									<c:set var="leader" value="${part.memberId}"></c:set>
								</c:if>
								<span>${part.memberId }</span>
								<c:if test="${part.leaderYN ne 'Y'}">
									<i class="fa fa-envelope" onclick="msgSend('${part.memberId}');" aria-hidden="true"></i>
								</c:if>
								<c:if test="${ loginMember.memberId eq leader}">
									<i class="fa fa-thumbs-o-down"  aria-hidden="true" onclick="giveWarning('${part.memberId}');"></i>
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li>
				<a href="#testDropdown" aria-expanded="false" data-toggle="collapse">시험</a>
				<ul id="testDropdown" class="collapse list-unstyled ">
					<li><a onclick="goToQuestion()">시험문제등록</a></li>
					<li><a onclick="goToTest()">시험보기</a></li>
				</ul>
			</li>
			<li><a onclick="goToInvitation()">초대하기</a></li>
			<li><a onclick="goToSchduler(${roomInfo.srNo})">스케줄러</a></li>
			<c:if test="${ leader eq loginMember.memberId}">
				<li>
					<a href="#applicantsDropdown" aria-expanded="false" data-toggle="collapse">신청인원</a>
					<ul id="applicantsDropdown" class="collapse list-unstyled ">
						<c:forEach var="app" items="${ applicants }">
							<li><div class="applicantsJH">
								<span>${app}</span>
								<button value="${app}" class="btnAcceptJH btnApplicantsJH"
									onclick="acceptMember(this.value, ${ roomInfo.srNo} )">수락</button>
							</div></li>
						</c:forEach>
					</ul>
				</li>
			</c:if>
			<li><a onclick="exitRoom()">방 나가기</a></li>
		</ul>
	</nav>
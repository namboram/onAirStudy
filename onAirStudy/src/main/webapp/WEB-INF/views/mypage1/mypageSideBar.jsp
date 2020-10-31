<%@page import="com.kh.onairstudy.member.model.vo.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">

	<nav class="side-navbar mypage-sideBar" style="width:100%; padding:5%; height:100%;"  >
		<!-- Sidebar Header-->
		<div class="sidebar-header">
			<div class="avatar">
			<c:if test="${ not empty sideBarInfo.profile }">
				<img
					src="${ pageContext.request.contextPath }/resources/upload/${sideBarInfo.profile}"
					alt="...">
			</c:if>
			<h3>${loginMember.memberId }</h3>
			<c:if test="${ loginMember.memberRole eq 'P'}">
				<h5>premium</h5>
			</c:if>
			<c:if test="${ loginMember.memberRole eq 'M'}">
				<h5>member</h5>
			</c:if>
		</div>
		</div>
		<span class="heading">Menu</span>
			<!-- Sidebar Navidation Menus-->
		<ul class="list-unstyled">
			<li><a
				href="${ pageContext.request.contextPath}/mypage1/invitationlist.do">초대내역</a></li>
			<li><a href="${ pageContext.request.contextPath }/premium.do">프리미엄
					<div class="badge badge-info" style="margin-left: 5px;">
						<c:if test="${ not empty sideBarInfo.paymentDay}">
						D-${ sideBarInfo.paymentDay }
					</c:if>
					</div>
			</a></li>
			<li><a
				href="${ pageContext.request.contextPath}/mypage1/mystudylist.do">내
					스터디방</a></li>
			<li><a
				href="${ pageContext.request.contextPath }/mypage1/scheduler.do">스케줄러</a></li>
			<li><a
				href="${ pageContext.request.contextPath }/mypage1/memberDetail.do">내
					정보</a></li>
		</ul>
</nav>
<script>
$(".d-day-display").click(function(){

	var startDate = "<fmt:formatDate value='${memberInfo.startDate }' pattern='yyyy/MM/dd'></fmt:formatDate>";
	
	location.href="${pageContext.request.contextPath}/mypage1/search.do?startDate="+startDate;
});

</script>
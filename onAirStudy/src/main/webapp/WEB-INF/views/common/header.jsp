<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
​ ​
<c:if test="${ not empty msg }">
	<script>
		alert("${ msg }");
	</script>
</c:if>
​
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
​ ​
<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css" />
​
</head>
<body>
	<header>

		<nav class="navbar navbar-expand-sm" style="height:30px;">
			<a class="navbar" href="${pageContext.request.contextPath}"> 
			<img src="${pageContext.request.contextPath }/resources/images/logo.png"
				width="190px" style="margin-top: 10px;" />
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav w-100 justify-content-center" style="margin-right:10%;">
                    <li class="nav-item active" style="margin-right:2%;">
                        <a class="nav-link" href="#">스터디방</a>
                    </li>
                    <li class="nav-item"  style="margin-right:2%;">
                        <a class="nav-link"
                           onclick="location.href='${ pageContext.request.contextPath }/diary/diaryList.do'">공부다이어리</a></a>
                    </li>
                    <li class="nav-item"  style="margin-right:2%;">
                        <a class="nav-link">공지사항</a>
                    </li>
                    <li class="nav-item"  style="margin-right:2%;">
                        <a class="nav-link">고객센터</a>
                    </li>
                </ul>
			</div>

			<c:if test="${ empty loginMember }">

				<ul class="navbar-nav navbar-right" style="margin-right:1%;">
					<li class="nav-item">
						<a href="<%=request.getContextPath()%>/member/memberLogin.do">login</a>
					</li>
					&nbsp;
					&nbsp;
					<li class="nav-item">
						<a href="<%=request.getContextPath()%>/member/memberEnroll.do">Join</a>
					</li>
				</ul>

			</c:if>

			<c:if test="${ not empty loginMember }">
				<a href="${ pageContext.request.contextPath }">${ loginMember.memberName }</a>님, 안녕하세요.
			    &nbsp;
			    <button class="btn my-2 my-sm-0"
					type="button" id="logoutBtn"
					onclick="location.href='${ pageContext.request.contextPath }/member/memberLogout.do';">로그아웃</button>
			</c:if>


		</nav>
		
		<!-- Navbar End -->
		​



	</header>







 	<!-- <section id="content">  -->
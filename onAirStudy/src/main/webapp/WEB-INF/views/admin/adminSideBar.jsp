<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">

	<nav class="side-navbar admin-sideBar" style="padding:5%; height:100%;"  >
		<!-- Sidebar Header-->
		<div class="sidebar-header">
			<div class="message-icon-line" >
				<div class="icon icon-mail message" style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/message/messageList.do'" style=""></div>
				<div class="messageAlarm" id="serviceCnt" style="opacity:0;">1</div>
			</div>
			<div class="avatar">
				<img src="${ pageContext.request.contextPath }/resources/images/avatar-7.jpg" alt="...">
				<h3 style="cursor:pointer;" onclick="location.replace('${ pageContext.request.contextPath }/admin/main.do')">Admin</h3>
				<h5>관리자</h5>
			</div>
		</div>
		<span class="heading">Menu</span>
		<!-- Sidebar Navidation Menus-->
		<ul class="list-unstyled">
			<li id="serviceLiB"><a href="${ pageContext.request.contextPath }/admin/serviceList.do">문의사항 <div class="countingAlarm" id="serviceCnt">6</div></a></li>
			<li id="reportLiB"><a href="${ pageContext.request.contextPath }/admin/reportList.do">신고내역</a></li>
			<li id="memberLiB"><a href="${ pageContext.request.contextPath }/admin/memberList.do?">회원관리</a></li>
			<li id="studyLiB"><a href="${ pageContext.request.contextPath }/admin/studyList.do">그룹관리</a></li>
		</ul>
	</nav>
	
	<script>
	$(".dropdownStart a").click(function(){
		 $(this).next("ul").slideToggle(300, 'linear');
		
	});

	$(document).ready(function(){
		$.ajax({
			url:"${ pageContext.request.contextPath }/admin/serviceCnt.do",
			success:function(data){
				console.log("성공");
				$("#serviceCnt").html(data);
			},
			error:function(){
				console.log("실패");
			}
		});

	});

	$(document).ready(function(){

		$.ajax({
			url:"${ pageContext.request.contextPath }/admin/messageCnt.do",
			success:function(num){
				console.log(num);

				if(num!=0)
					$("#serviceCnt").css("opacity", "1").html(num);
			},
			error:function(xhr){
				console.log("실패");
				console.log(xhr);
			}
		});

	});
	</script>
	
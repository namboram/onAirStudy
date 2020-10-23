<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<!-- <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	<nav class="side-navbar col-lg-2">
		<!-- Sidebar Header-->
		<div class="sidebar-header">
			<div class="message-icon-line">
				<div class="icon icon-mail message" onclick="" style=""></div>
				<div class="messageAlarm">1</div>
			</div>
			<div class="avatar">
				<img
					src="${ pageContext.request.contextPath }/resources/images/avatar-7.jpg"
					alt="...">
				<h3>Honggd</h3>
				<h5>premium</h5>
			</div>
			<div class="d-day-display">
				<hr>
				<span>D - 37</span></br> <span>2020.11.02</span></br> <span>토익시험</span></br>
				<hr>
			</div>
		</div>
		<span class="heading">Menu</span>
		<!-- Sidebar Navidation Menus-->
		<ul class="list-unstyled">
			<li><a href="#">우리 스터디방</a></li>
			<li>
				<a href="#participantsDropdown" aria-expanded="false" data-toggle="collapse">참여인원</a>
				<ul id="participantsDropdown" class="collapse list-unstyled">
					<c:forEach var="part" items="${participants }">
						<li><div class="participantsJH">
							<div class="status"></div>
							<span>${part.memberId }</span>
							<div class="icon icon-mail message"  onclick="alert('쪽지를 보내봅시다~')"></div>
						</div></li>
					</c:forEach>
				</ul>
			</li>
			<li>
				<a href="#testDropdown" aria-expanded="false" data-toggle="collapse">시험</a>
				<ul id="testDropdown" class="collapse list-unstyled ">
				<li><a>시험문제등록</a></li>
				<li><a>시험보기</a></li>
				</ul>
			</li>
			<li><a href="#">스케줄러</a></li>
			<li>
				<a href="#applicantsDropdown" aria-expanded="false" data-toggle="collapse">신청인원</a>
				<ul id="applicantsDropdown" class="collapse list-unstyled ">
					<c:forEach var="app" items="${ applicants }">
						<li><div class="applicantsJH">
							<span>${app}</span>
							<button value="accept" class="btnAcceptJH btnApplicantsJH"
								onclick="alert('멤버아이디 들고 컨트롤러로 갑니다~')">수락</button>
							<button value="reject" class="btnRejectJH btnApplicantsJH"
								onclick="alert('멤버아이디 들고 컨트롤러로 갑니다~')">거절</button>
						</div></li>
					</c:forEach>
				</ul>
			</li>
			<li><a onclick="">방 나가기</a></li>
		</ul>
	</nav>
	
<script>
$(function(){
	var popupObj; //팝업 창 생성 여부 확인, 전역 변수로 설정
	var stopTimeCheck = ""; //해당 팝업을 다시 열었을 경우 타이머 초기화
	//popupOpen();
	
});

function popupOpen() { //이 메서드를 통해 팝업을 오픈 시킨다.
	var url = "popup.html";
	var name = "popup test";
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	popupObj = window.open(url, name, option);

	/*  if(stopTimeCheck != "")                                        //팝업을 다시 열 경우 기존 타이머를 초기화한다. 단 
		   clearTimeout(stopTimeCheck);           */            
	   
	stopTimeCheck = setTimeout(closePopup, 3000); //10초 후에 closePopup 메서드를 실행시킨다.
}

function closePopup() {
	if (popupObj != undefined) {
		popupObj.close(); //팝업 종료
		popupObj = undefined;
	}
}
</script>
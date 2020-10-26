<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<!-- <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">



<div class="row">	
	<nav class="side-navbar col-lg-2">
		<!-- Sidebar Header-->
		<div class="sidebar-header">
			<div class="message-icon-line">
				<div class="icon icon-mail message" onclick="" style=""></div>
				<div class="messageAlarm">1</div>
			</div>
			<div class="avatar">
				<img src="${ pageContext.request.contextPath }/resources/images/avatar-7.jpg" alt="...">
				<h3>Honggd</h3>
				<h5>premium</h5>
			</div>
			<div class="d-day-display">
				<hr>
				<span>D - 37</span></br> <span>2020.11.02</span></br> <span>토익시험</span></br>
				<hr>
			</div>
			<input type="hidden" name="day" id="attendDay" value="${roomInfo.attendDay}"/>
			<input type="hidden" name="time" id="attendTime" value="${roomInfo.attendTime }"/>
		</div>
		<span class="heading">Menu</span>
		<!-- Sidebar Navidation Menus-->
		<ul class="list-unstyled">
			<li><a onclick="goToIndex()">우리 스터디방</a></li>
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
					<li><a onclick="goToQuestion()">시험문제등록</a></li>
					<li><a onclick="goToTest()">시험보기</a></li>
				</ul>
			</li>
			<li><a onclick="goToInvitation()">초대하기</a></li>
			<li><a onclick="goToSchduler()">스케줄러</a></li>
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
			<li><a onclick="exitRoom()">방 나가기</a></li>
		</ul>
	</nav>
	<div class="col-lg-7 changeDiv"></div>
	<div class="col-lg-3 chattingDiv" >
		<c:if test="${ not empty roomInfo }">
			<h1>${ roomInfo.srTitle }</h1>
		</c:if>
	<!-- 채팅 include 들어갈 자리 -->
	</div>
</div>

<script>
$(function(){
	var d = new Date();
	var week = new Array('일','월','화','수','목','금','토');
	
	var day = week[d.getDay()];  //오늘 요일
	var now = d.getHours() + ":" + d.getMinutes(); //현재시각

	var attendDay = $("#attendDay").val().split(","); //출석체크 요일
	var attendTime = $("#attendTime").val().split(/[:,]/); //출석체크 시간

	var popupObj; //팝업 창 생성 여부 확인, 전역 변수로 설정
	var stopTimeCheck = ""; //해당 팝업을 다시 열었을 경우 타이머 초기화

	console.log(attendTime);
	
	for(var i in attendDay){
		if(attendDay[i] == day){
			var startTime = new Date(d.getFullYear(), d.getMonth(), d.getDate(), attendTime[i*2] , attendTime[(i*2)+1] );
			var endTime = new Date(d.getFullYear(), d.getMonth(), d.getDate(),  startTime.getHours(), startTime.getMinutes()+10 );
			if(startTime.getTime() <= d.getTime() && d.getTime() <=endTime.getTime() ){
				popupOpen();
			}
		}
	}
});

function popupOpen() { //이 메서드를 통해 팝업을 오픈 시킨다.
	var url = "popup.html";
	var name = "출석체크";
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	popupObj = window.open(url, name, option);
	/*
		if(stopTimeCheck != "")                                        //팝업을 다시 열 경우 기존 타이머를 초기화한다. 단 
		   clearTimeout(stopTimeCheck);   
	*/                     
	   
	stopTimeCheck = setTimeout(closePopup, 3000); //10초 후에 closePopup 메서드를 실행시킨다.
}

function closePopup() {
	if (popupObj != undefined) {
		popupObj.close(); //팝업 종료
		popupObj = undefined;
	}
}

function exitRoom() {
	if(confirm("방을 나가시겠습니까?") == true){
		location.href = "${pageContext.request.contextPath}/mypage1/mypage1_index.do";
		//이 부분 뒤로가기 막아서,,, 다시 방으로 못들어가게 합시당
	}
}

function acceptMember(id, roomNum){

	console.log(id, roomNum);
	post_to_url("${pageContext.request.contextPath}/studyroom/accept.do", {"id" : id, "roomNum" : roomNum});
}

function post_to_url(path, params, method) {
    method = method || "post"; 
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

</script>

<script>
	function goToSchduler(){
		 $(".changeDiv").load("${pageContext.request.contextPath}/studyroom/scheduler.do");
	}
	
	function goToQuestion(){
		$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/mypage2_question.do");
	}
	
	function goToTest(){
		$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/pretest.do");
	}

	function goToInvitation(){
		//$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/pretest.do");
	}
	
	function goToIndex(){
		//$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/pretest.do");
	}

	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
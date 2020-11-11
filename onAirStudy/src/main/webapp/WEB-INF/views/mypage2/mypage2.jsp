<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">
<!-- 출석체크 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Attendance Check</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	출석체크를 위해 check버튼을 눌러주세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="goToAttendCheck('${roomInfo.srNo}')">check</button>
      </div>
    </div>
  </div>
</div>
<!-- 쪽지 보내기 모달 -->
		<div class="modal" id="replyMyModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">쪽지 보내기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div class="form-group">
							받는 사람 : <strong id="receivedIdK"></strong>
							<hr />

							<h5>내용</h5>
							<textarea id="replyContents" style="width:100%;" rows="5"></textarea>
						</div>

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal"
							onclick="doSend();">보내기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
<div class="row">	
	<div class="col-lg-2">
		<jsp:include page="/WEB-INF/views/mypage2/studyRoomSideBar.jsp"></jsp:include>
	</div>
	<div class="col-lg-7 changeDiv p-0">
		<jsp:include page="/WEB-INF/views/mypage2/mypage2_index.jsp"></jsp:include>
	</div>
	<div class="col-lg-3 chattingDiv" >
		<jsp:include page="/WEB-INF/views/mypage2/chatting.jsp"></jsp:include>
	</div>
</div>

<script>
$(function(){

	//시험문제 등록 후 해당 페이지 로드
	<c:if test="${ not empty test}">
		$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/mypage2_question.do");
	</c:if>


	//출석체크 여부로 모달창 띄우기
	<c:if test="${ empty attendAlready}">
		var d = new Date();
		var week = new Array('일','월','화','수','목','금','토');
		
		var day = week[d.getDay()];  //오늘 요일
		var attendDay = $("#attendDay").val().split(","); //출석체크 요일
		var attendTime = $("#attendTime").val().split(/[:,]/); //출석체크 시간
	
		for(var i in attendDay){
			if(attendDay[i] == day){
				var startTime = new Date(d.getFullYear(), d.getMonth(), d.getDate(), attendTime[i*2] , attendTime[(i*2)+1] );
				var endTime = new Date(d.getFullYear(), d.getMonth(), d.getDate(),  startTime.getHours(), startTime.getMinutes()+10 );
				if(startTime.getTime() <= d.getTime() && d.getTime() <=endTime.getTime() ){
					 $('#myModal').modal('show'); 
				}
			}
		}

	</c:if>
});


</script>

<script>
	//쪽지모양 클릭시 모달창 열기
	function msgSend(receiverId) {
		$("#replyMyModal").modal('show');
		$("#receivedIdK").html(receiverId);
	};
	
	//보내기 버튼 클릭시
	function doSend() {
		if (confirm("쪽지를 보내시겠습니까?")) {
			$.ajax({
				url : "${pageContext.request.contextPath}/message/insertMessage.do",
				type : "POST",
				data : {
					senderId : "${loginMember.memberId}",
					receiverId : $("#receivedIdK").text(),
					msgContent : $("#replyContents").val()
				},
				dataType : "json",
				success : function(result) {
					if (result > 0)
						alert("쪽지 전송이 완료되었습니다.");
				},
				error : function(xhr, status, err) {
					console.log("처리실패!");
					console.log(xhr);
					console.log(status);
					console.log(err);
				}
			});

		}
	}

	function exitRoom() {
		if(confirm("방을 나가시겠습니까?") == true){
			location.href = "${pageContext.request.contextPath}/studyroom/exit.do";
		}
	}
	
	function acceptMember(id, roomNum){
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

	function goToSchduler(roomNum){
		 $(".changeDiv").load("${pageContext.request.contextPath}/mypage1/scheduler.do?roomNum="+roomNum);
	}
	
	function goToQuestion(){
		$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/mypage2_question.do");
	}
	
	function goToTest(){
		$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/pretest.do");
	}

	function goToInvitation(){
		$(".changeDiv").load("${pageContext.request.contextPath}/mypage2/invitation.do");
	}
	
	function goToIndex(roomNum){
		location.href = "${ pageContext.request.contextPath}/studyroom/main.do?roomNum=" + roomNum;
	}

	function goToAttendCheck(roomNum){
		location.href = "${ pageContext.request.contextPath}/studyroom/main.do?roomNum=" + roomNum;
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
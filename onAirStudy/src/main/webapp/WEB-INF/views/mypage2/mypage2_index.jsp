<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>
<style>
.roomInfo h1{
	text-align: center;
}

</style>
<div class="roomInfo">
	<header>
		<h1 class="h3 display">우리 스터디방</h1>
	</header>
	<div class="col-lg-11 p-0" style="margin: 0 auto; margin-top: 2.5em">
		<div class="card">
			<div class="card-header d-flex align-items-center">
				<label class="col-sm-12 form-control-label"
					style="text-align: center">${roomInfo.srTitle }   (${roomInfo.category })</label>
			</div>
			<div class="card-body">
				<form class="form-horizontal">
					<div class="form-group row">
						<label class="col-sm-4 form-control-label">한줄  소개</label>
						<div class="col-sm-8">
							<p>${roomInfo.srComment }</p>
						</div>
					</div>
					<hr />
					<c:if test="${ not empty roomInfo.srGoal }">
					<div class="form-group row">
						<label class="col-sm-4 form-control-label">우리방 목표</label>
						<div class="col-sm-8">
							<p>${roomInfo.srGoal }</p>
						</div>
					</div>
					<hr />
					</c:if>
					<div class="form-group row">
						<label class="col-sm-4 form-control-label">출석체크</label>
						<div class="col-sm-8">
							<c:set var="arrDay" value="${fn:split(roomInfo.attendDay, ',') }" />
							<c:set var="arrTime" value="${fn:split(roomInfo.attendTime, ',') }" />
							<p>매주 ${ roomInfo.attendDay }</p>
							<div class="form-group">
								<c:forEach var="i" begin="0" end="${fn:length(arrDay)-1}">
									<p>- ${arrDay[i] }   ${arrTime[i] }</p>
								</c:forEach>
							</div>
						</div>
					</div>
					<hr />
					<c:if test="${roomInfo.forceExitYN == 'Y'}">
						<div class="form-group row">
							<label class="col-sm-4 form-control-label">우리방 규칙</label>
							<div class="col-sm-8">
								<p>팀장 경고 누적 ${ roomInfo.forceExitOpt }회시 자동 탈퇴 처리</p>
							</div>
						</div>
						<hr />
					</c:if>
					<div class="form-group row">
						<label class="col-sm-4 form-control-label">출석현황</label>
						<div class="col-sm-8">
							<p>전체 출석 일수 : ${roomInfo.attendanceCnt}days</p>
							<c:forEach var="attend" items="${attendList }">
								<p>${attend.memberId }: ${attend.attendCnt }days</p>
							</c:forEach>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-5 offset-sm-7">
							<c:forEach var="p" items="${ participants}">
								<c:if
									test="${ loginUser.memberId eq p.memberId && p.leaderYN eq 'Y' }">
									<button type="button" class="btn btn-primary"
										onclick="modifyInfo()">방 정보 수정</button>
								</c:if>
							</c:forEach>
							<button type="button" class="btn btn-outline-danger" onclick="withdraw('${loginMember.memberId}', '${roomInfo.srNo }')">스터디 탈퇴</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>



<script>
function modifyInfo(){
	var no = ${roomInfo.srNo};
	$(".changeDiv").load("${pageContext.request.contextPath}/studyroom/updateInfo.do");
}


function withdraw(myId, srNo){

	var teamLeader = $("#leaderId").val();

	if(confirm("스터디방을 탈퇴하시겠습니까?")){
		if(myId == teamLeader){
			location.href = "${pageContext.request.contextPath}/studyroom/updateLeader.do?roomNum="+srNo;
		}else{
			location.href = "${pageContext.request.contextPath}/studyroom/withdraw.do?roomNum="+srNo;
		}
	} 
	
}


</script>
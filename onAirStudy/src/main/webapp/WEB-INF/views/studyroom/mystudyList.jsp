<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.onairstudy.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mystudygruop.css"> --%>

<style>
.bnt{
	border-radius:15px;
    background-color: white;
    border-color: rgb(141, 109, 109);
    color: rgb(141, 109, 109); }
.btn:hover,
.btn:focus {
    border-color: rgb(141, 109, 109);
    background-color: rgb(141, 109, 109);
    color: #FFF; }
.btn:active,
.btn:visited,
.btn:focus,
.btn:active:hover {
    border-color:rgb(141, 109, 109);
    background-color:rgb(141, 109, 109);
    color: #FFF; }
  
#rBtn {
	float:right;
	padding-right:10%;
}
.table thead{
    border-style: groove;
    border-color: rgba(173, 134, 134, 0.753);
    background-color: white;
    color:black;
}

.table tbody{
   border-bottom: groove 1.5px rgba(173, 134, 134, 0.753);
}
.tbody tr:nth-child(2n) {
    background-color: white;
  }
.tbody tr:nth-child(2n+1) {
    background-color: #F9F1ED;
  }
</style>

<div class="invitation" style="margin-bottom: 0;">


	<div class="col-sm" style="background-color: #FBF7FD; padding: 5%;">
		<h2 class="text-gray" style="float: left; padding-right: auto;">
			My Study Group</h2>
		<div id="rBtn" >
			<button type="button" class="btn btn-outline-primary" id="btnJoin" >
				<a href="${pageContext.request.contextPath }/mypage1/newstudy.do">스터디
					방 만들기</a>
			</button>
		</div>
		<br />
		<br />
		<hr>
		<div class="container">

			<div class="col-sm"
				style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px;">
				<h3 style="text-decoration: underline;">내 스터디 그룹</h3>

				<table class="table">
					<thead class="thead-rounded">
						<tr style="padding-left: 30px;">
							<th></th>
							<th>카테고리</th>
							<th>그룹 이름</th>
							<th>그룹 소개</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${ studyList }" var="studyroom">
							<c:if test="${studyroom.memberId eq loginMember.memberId }">
								<tr>									
									<td><c:if test="${studyroom.sleader != 'N'}"><img class="roomPic"
							src="${pageContext.request.contextPath }/resources/images/crown.png" style="height:20px;"></c:if></td>
									<td>${studyroom.sCategory}</td>
									<td>${studyroom.srTitle}</td>
									<td>${studyroom.srComment}</td>

									<td>
										<button type="button" class="btn btn-outline-primary"
											onclick="studyEntry('${studyroom.srNo}')">입장하기</button>
									</td>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<br>
			<div class="col-sm"
				style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px; overflow:auto;">
				<h3 style="text-decoration: underline;">대기중인 그룹</h3>

				<table class="table">
					<thead class="thead-rounded">
						<tr>
							<th></th>
							<th>카테고리</th>
							<th>그룹 이름</th>
							<th>그룹 소개</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ waitingList }" var="studyroomwaiting">
							<c:if
								test="${studyroomwaiting.memberId eq loginMember.memberId }">
								<tr>
									<td></td>
									<td>${studyroomwaiting.aCategory}</td>
									<td>${studyroomwaiting.aTitle}</td>
									<td>${studyroomwaiting.aComment}</td>
									<td>
										<button type="button" class="btn btn-outline-primary" onclick="applyR('${ studyroomwaiting.srNo }')">
											${studyroomwaiting.aStatus == 'Y' ? '대기중' : '만료'}</button>
									</td>

								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<br>
			<div class="col-sm"
				style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px; overflow:auto;">
				<h3 style="text-decoration: underline;">내가 찜한 그룹</h3>

				<table class="table">
					<thead class="thead-rounded">
						<tr>
							<th></th>
							<th>카테고리</th>
							<th>그룹 이름</th>
							<th>그룹 소개</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ wishList }" var="studyroomwish">
							<c:if test="${studyroomwish.memberId eq loginMember.memberId }">
								<tr>
									<td></td>
									<td>${studyroomwish.wCategory}</td>
									<td>${studyroomwish.wTitle}</td>
									<td>${studyroomwish.wComment}</td>


									<td>
									<form id="favRoom" 
								action="${ pageContext.request.contextPath }/studyroom/delfavStudyroom.do"
								method="POST">
								
								<input type="text" class="form-control" name="srNo"	value="${studyroomwish.srNo }"  hidden> 
								<input type="text" class="form-control" name="memberId"	value="${loginMember.memberId }" hidden >
								
										<button type="submit" class="btn btn-outline-primary" <c:if test="${studyroomwish.wStatus != 'Y'}">disabled</c:if>>
											${studyroomwish.wStatus == 'Y' ? '신청가능' : '만료'}</button>
									</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>

	</div>
</div>

<script>
function studyEntry(roomNum){
	location.href = "${ pageContext.request.contextPath}/studyroom/main.do?roomNum=" + roomNum;
}

</script>


<!-- 신청 -->
<div class="modal fade" id="applyRFrm" role="dialog"
	aria-labelledby="deleteMemoModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">스터디 룸 가입 신청 취소</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<form
				action="${ pageContext.request.contextPath }/studyroom/deleteAlpplystudyroom.do"
				name="applyFrm" method="POST">
				<input type="text" class="form-control" name="srNo" id="srNo" hidden>
				<input type="text" class="form-control" name="memberId"
					id="memberId" value="${ loginMember.memberId }" hidden>
				<div class="modal-body">스터디 룸 가입을 취소 하시겠습니까?</div>
				<!-- Modal footer -->

				<div class="modal-footer">
					<button type="submit" class="btn btn-outline">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</form>


		</div>
	</div>
</div>

<script>
	function applyR(srNo) {
		$("#applyRFrm").modal().find("[name=srNo]").val(srNo);
	}
</script>


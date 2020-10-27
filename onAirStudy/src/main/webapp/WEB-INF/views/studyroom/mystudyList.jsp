<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.onairstudy.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mystudygruop.css">


<div class="invitation" style="margin-bottom: 0;">


	<div class="col-sm" style="background-color: #FBF7FD; padding: 20px;">
		<h2 class="text-gray" style="float: left; padding-right: auto;">
			My Study Group</h2>
<button type="button" class="btn btn-outline-primary"			
			style="border-radius: 35px;">
			<a href="${pageContext.request.contextPath }/mypage1/newstudy.do">스터디
				방 만들기</a>
		</button>
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
									<td>${studyroom.sLeader}</td>
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
				style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px;">
				<h3 style="text-decoration: underline;">대기중인 그룹</h3>

				<table class="table">
					<thead class="thead-rounded">
						<tr>
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
									<td>${studyroomwaiting.aCategory}</td>
									<td>${studyroomwaiting.aTitle}</td>
									<td>${studyroomwaiting.aComment}</td>
									<td>
										<button type="button" class="btn btn-outline-primary">
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
				style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px;">
				<h3 style="text-decoration: underline;">내가 찜한 그룹</h3>

				<table class="table">
					<thead class="thead-rounded">
						<tr>
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
									<td>${studyroomwish.wCategory}</td>
									<td>${studyroomwish.wTitle}</td>
									<td>${studyroomwish.wComment}</td>


									<td>
										<button type="button" class="btn btn-outline-primary">
											${studyroomwish.wStatus == 'Y' ? '가입가능' : '만료'}</button>
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



<%-- 	<div class="modal" id="roomC">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header" style="background-color:#E2A182;">
					<h4 class="modal-title">스터디방 만들기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				
				<div class="modal-body">
				<input type="hidden" id="memId" value="${loginMember.memberId }" />
										
				<div class="col-lg-12 p-4 text-center">		
				
				<h5>새로 만들 스터디 그룹의 카테고리를 선택해 주세요</h5>
				<br />	
				<label for="groupCategory">카테고리를 선택하세요.</label> 
				<select
				class="custom-select" id="srCategory" name="srCategory">
						<option value="1">자격증</option>
						<option value="2">면접</option>
						<option value="3">입시</option>
						<option value="4">취미/예술</option>
						<option value="5">컴퓨터/IT</option>
						<option value="6">창업</option>
						<option value="7">어학</option>
						<option value="8">기타</option>
				</select>
				
				</div>
					
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-light-outline" data-dismiss="modal"
						onclick="nRoom();">방 만들러 가기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	 --%>

<!-- <script>
	//방생성
	 function roomOn() {
		$("#roomC").modal('show');		
}

		//모달 창 안
		function nRoom() {
			if (confirm("새로운 스터디 방을 생성 하시겠습니까?")) {
				$.ajax({
							url : "${pageContext.request.contextPath}/mypage1/creatR.do",
							type : "POST",
							
							data : {								
								memberId : $("#memId").val(),								
								srCategory : $("#srCategory").val()
							},
							dataType : "json",
							success : function(data) {
								window.location.href="${pageContext.request.contextPath}mypage1/newstudy.do";
									
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
		</script>
		 -->



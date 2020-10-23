<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.onairstudy.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/mystudygruop.css">



<div class="invitation" style="margin-bottom: 0;">


	<div class="col-sm" style="background-color: #FBF7FD; padding: 20px;">
		<h2 class="text-gray" style="float: left; padding-right: auto;">
			My Study Group</h2>
		<button type="button" class="btn btn-outline-primary"
			data-toggle="modal" data-target="#myModal_ok"
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
	location.href = "${pageContext.request.contextPath}/studyroom/main.do?roomNum="+roomNum;
}
</script>


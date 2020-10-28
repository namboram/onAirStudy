<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<!-- css -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/adminCommon.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script>
$(document).ready(function(){
	console.log($("#studyLiB"));
	$("#studyLiB a").css("background-color", "#C9C7D1").css("font-weight", "bold").css("color", "white");
})
</script>

<div class="row">

	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>

	<div class="col-lg-10 adDivB p-0">
	<div style="padding:5%;">
	
		<table class="table tableB">
				<tr>
					<th>방번호</th>
					<td>${ s.SR_NO }</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>${ s.CATEGORY }</td>
				</tr>
				<tr>
					<th>방장아이디</th>
					<td><a href="${ pageContext.request.contextPath }/admin/memberDetail.do?mid=${ s.MEMBER_ID }">${ s.MEMBER_ID }</a></td>
				</tr>
				<tr>
					<th>참여회원</th>
					<td>
					<c:if test="${ list != null }">
						<c:forEach items="${ list }" var="m">
							<a href="${ pageContext.request.contextPath }/admin/memberDetail.do?mid=${ m }"> ${ m } </a>
						</c:forEach>
					</c:if>
					<c:if test="${ list == null }">
						참여회원 없음
					</c:if>
					</td>
				</tr>
				<tr>
					<th>방제목</th>
					<td>${ s.SR_TITLE }</td>
				</tr>
				<tr>
					<th>한줄소개</th>
					<td>${ s.SR_COMMENT }</td>
				</tr>
				<tr>
					<th>목표</th>
					<td>${ s.SR_GOAL }</td>
				</tr>
				<tr>
					<th>방종류</th>
					<td>${ s.SR_SORT } </td>
				</tr>
				<tr>
					<th>생성일</th>
					<td><fmt:formatDate value="${ s.SR_ENROLL_DATE }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<th>오픈여부</th>
					<td>${ s.SR_OPENED_YN }</td>
				</tr>
				<tr>
					<th>삭제여부</th>
					<td id="deleteB">${ s.SR_ENDED_YN }</td>
				</tr>
		
		</table>
		
		<button type="button" class="btn btn-danger" onclick="studyDelete();">방 삭제하기</button>
		
	</div>
</div>

<script>

	function studyDelete() {
		if (confirm("방을 삭제처리 하시겠습니까? 적용 시 복구할 수 없습니다."))
			location.replace('${ pageContext.request.contextPath }/admin/studyDelete.do?no=${ s.SR_NO }');

	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


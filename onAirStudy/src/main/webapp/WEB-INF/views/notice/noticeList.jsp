<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

​
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/diary.css" />


<!-- diarylist  -->
<div class="diary-container">
	<h2>NOTICE</h2>

	<div class="diary-top-container">
		<img
			src="${pageContext.request.contextPath }/resources/images/studydiaryicon.png"
			width="120px" height="120px" />
	</div>


	<!-- 공부다이어리 목록 -->
	<table class="table">
		<tr class="header">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:if test="${ list != null }">
			<c:forEach items="${ list }" var="n" varStatus="status">
				<tr>
					<td>${ status.count }</td>
					<td><a
						href="${ pageContext.request.contextPath }/notice/noticeDetail.do?no=${ n.NO }">${ n.TITLE }</a></td>
					<td>관리자</td>
					<td>${ n.READ_CNT }</td>
					<td><fmt:formatDate value="${ n.NOTICE_DATE}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>


	<nav aria-label="Page navigation example"
		style="display: inline-block;">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>

</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
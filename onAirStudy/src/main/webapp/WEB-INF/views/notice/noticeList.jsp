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

	<c:if test="${ loginMember.memberRole == 'A' }">
		<div style="text-align: right; margin: 3%;">
			<button class="btn btn-light" type="button" onclick="location.href='${ pageContext.request.contextPath }/notice/noticeDetail.do'">글쓰기</button>
		</div>
	</c:if>

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
	
	
	<div id='pageBar'>
		${ pageBar }
	</div>

</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
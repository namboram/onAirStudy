<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/diary.css" />

<style>
.container {
	width: 80%;
	padding: 10%;
}
.tableB {
	border-bottom: 1px solid gray;
}
.tableB th {
	width: 10%;
}
#contentB {
	height: 100%;
	padding: 5%;
}
</style>

<div class="diary-container">

	<h2>NOTICE</h2>

	<div class="diary-top-container">
		<img
			src="${pageContext.request.contextPath }/resources/images/studydiaryicon.png"
			width="120px" height="120px" />
	</div>


	<c:if test="${ not empty map }">
		<!-- 일반회원일 때 -->
		<c:if test="${ loginMember.memberRole != 'A'}">

			<table class="table tableB">
				<tr>
					<th>제목</th>
					<td>${ map.TITLE }</td>
					<th>작성자</th>
					<td>관리자</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><fmt:formatDate value="${ map.NOTICE_DATE }"
							pattern="yyyy.MM.dd" /></td>
					<th>조회수</th>
					<td>${ map.READ_CNT }</td>
				</tr>
				<tr>
					<td id="contentB" colspan=4>${ map.CONTENT }</td>
				</tr>
			</table>
		</c:if>

		<!-- 관리자일때  수정가능-->
		<c:if test="${ loginMember.memberRole == 'A'}">
			<form action="${ pageContext.request.contextPath }/notice/noticeUpdate.do" 
					method="post">
					<input type="hidden" name="no" value="${ map.NO }" />
				<table class="table tableB">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" class="form-control"
							value="${ map.TITLE }" /></td>
						<th>작성자</th>
						<td>관리자</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><fmt:formatDate value="${ map.NOTICE_DATE }"
								pattern="yyyy.MM.dd" /></td>
						<th>조회수</th>
						<td>${ map.READ_CNT }</td>
					</tr>
					<tr>
						<td id="contentB" colspan=4><textarea name="content" class="form-control"
								aria-label="With textarea">${ map.CONTENT }</textarea></td>
					</tr>
				</table>

				<div style="text-align: right; margin: 3%;">
					<button class="btn btn-light" type="submit" >수정하기</button>
				</div>
			</form>
		</c:if>

	</c:if>

	<c:if test="${ empty map }">
		<form
			action="${ pageContext.request.contextPath }/notice/noticeInsert.do"
			method="post">
			<table class="table tableB">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" class="form-control" required /></td>
				</tr>
				<tr>
				<th>내용</th>
					<td id="contentB" colspan=3>
					<textarea class="form-control" name="content" aria-label="With textarea" required></textarea>
					</td>
				</tr>
			</table>
			<div style="text-align: right; margin: 3%;">
				<button class="btn btn-light" type="submit">등록하기</button>
			</div>
		</form>
	</c:if>
	
	<button class="btn btn-secondary" onclick="location.href='${ pageContext.request.contextPath }/notice/noticeList.do'">목록으로</button>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 한글 깨짐 방지 --%>
<%-- <fmt:requestEncoding value="utf-8" /> --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#containerMsgK {
	background-color: #F9F1ED;
}

#contentMsgK {
	background-color: white;
}
</style>
<div class="row">
	<jsp:include page="/WEB-INF/views/mypage1/mypageSideBar.jsp"></jsp:include>
	<!-- 차트 링크 -->
	<!-- 	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
	<div class="col-sm" id="containerMsgK">
		<h1>${title}</h1>
		<div class="row mb-3">
		<div class="input-group col-sm-5 offset-sm-3">
			<div class="input-group-prepend mr-2">
				<select class="custom-select">
					<option selected>검색 유형 선택</option>
					<option value="id">아이디</option>
					<option value="content">내용</option>
				</select>
			</div>
			<input type="text" class="form-control mr-2"
				aria-label="Text input with dropdown button">
			<button type="button" class="btn btn-secondary" >검색</button>
		</div>
		<div class="text-right offset-sm-2">
			<button type="button" class="btn btn-secondary" onclick="receivedMsg();">수신함</button>
			<button type="button" class="btn btn-secondary" onclick="sentMsg();" >발신함</button>
			<button type="button" class="btn btn-secondary" >삭제</button>
		</div>
		</div>
		<div id="contentMsgK" class="mr-3">
			<table class="table text-center">
				<thead>
					<tr >
						<th scope="col">#</th>
						<th scope="col">보낸사람</th>
						<th scope="col">받는사람</th>
						<th scope="col">내용</th>
						<th scope="col">날짜</th>
						<th scope="col">읽음여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${messageList}" var="message" varStatus="status">

						<tr>
							<th scope="row">${status.count}</th>
							<td>${message.senderId}</td>
							<td>${message.receiverId}</td>
							
							<c:choose>
								<c:when test="${fn:length(message.msgContent) gt 15}">
									<td><a href="${pageContext.request.contextPath}/message/messageDetail.do?no=${message.no}"><c:out value="${fn:substring(message.msgContent, 0, 15)}"></c:out>...</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="${pageContext.request.contextPath}/message/messageDetail.do?no=${message.no}">${message.msgContent}</a></td>
								</c:otherwise>
							</c:choose>
							<td><fmt:formatDate value="${message.sendDate }"
									pattern="yy/MM/dd HH:mm:ss" /></td>
							<c:if test="${message.readYN eq 'Y'}">
								<td class="text-grey">읽음</td>
							</c:if>
							<c:if test="${message.readYN eq 'N'}">
								<td>안읽음</td>
							</c:if>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
function receivedMsg(){

	window.location = "${pageContext.request.contextPath}/message/sendReceiveFilter.do?type=receive";

}
function sentMsg(){

	window.location = "${pageContext.request.contextPath}/message/sendReceiveFilter.do?type=send";
}
</script>

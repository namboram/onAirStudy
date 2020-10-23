<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<style>
	#adDivB{
		/* width:calc(100%-270px); */
		display:inline-block;
		height:100%;
		background-color:skyblue;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-2">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>
	<div class="col-lg-10">
		
		<form id="serviceSerch" method="post">
		<input type="text"/>
		<button type="submit">검색</button>
		</form>
		<table class="table">
			
		<tr>
		<th>문의번호</th>
		<th>답변상태</th>
		<th>카테고리</th>
		<th>문의제목</th>
		<th>문의한 아이디</th>
		<th>문의 날짜</th>
		</tr>
		
		<c:if test="${ not empty list }">
		<c:forEach items="${ list }" var="s">
			<tr>
				<td>${ s.NO }</td>
				<td>${ s.SERVICE_STATUS}</td>
				<td>${ s.cate }</td>
				<td><a href="${ pageContext.request.contextPath }/admin/serviceDetail.do?no=${s.NO}">${ s.SERVICE_TITLE }</a></td>
				<td>${ s.MEMBER_ID }</td>
				<td><fmt:formatDate type="date" value="${ s.SERVICE_DATE }"/></td>
			</tr>
		</c:forEach> 
		</c:if>
	
		
		</table>
		
	</div>
</div>
<script>
	$(document).ready(function(){

		
	});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
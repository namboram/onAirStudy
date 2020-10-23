<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<style>
	.adDivB{
		display:inline-block;
		background-color:#e8f4ff;
		padding:100px;
		text-align:center;
	}
	.tableB{
		background-color:white;
		border:2px solid #b0d9ff;
		padding:50px;
	}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-2">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>
	<div class="col-lg-10 adDivB">
		
		<form id="serviceSerchB" method="post">
		<select name="searchType" id="searchTypeB">
			<option value="memberId">작성자</option>
			<option value="category">카테고리</option>
			<option value="status">답변상태</option>
		</select>
		<div id="hide1B">
			<input type="text" name="searchContent" value=""/>
			<button type="button" class="btn">검색</button>
		</div>
		<div id="hide2B">
			<select name="searchContent" id="searchContentB">
				<option value="1">신고</option>
				<option value="2">이용</option>
				<option value="3">결제</option>
				<option value="4">기타</option>
			</select>
		</div>
		<div id="hide3B">
			<input type="radio" name="searchContent" value="답변대기" />답변대기
			<input type="radio" name="searchContent" value="답변완료"/>답변완료
		</div>
		</form>
		<table class="table tableB">
			
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
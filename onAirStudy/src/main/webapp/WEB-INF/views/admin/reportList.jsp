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
	<div class="col-lg-2 adDivB">
		
		<table class="table tableB">
					<tr>
		<th>신고번호</th>
		<th>카테고리</th>
		<th>신고당한 아이디</th>
		<th>신고날짜</th>
		<th>유효(Y/N)</th>
		</tr>
		
		<c:if test="${ not empty list }">
		<c:forEach items="${ list }" var="r">
			<tr>
				<%-- <td>${ s.NO }</td>
				<td>${ s.SERVICE_STATUS}</td>
				<td>${ s.cate }</td>
				<td><a href="${ pageContext.request.contextPath }/admin/serviceDetail.do?no=${s.NO}">${ s.SERVICE_TITLE }</a></td>
				<td>${ s.MEMBER_ID }</td>
				<td><fmt:formatDate type="date" value="${ s.SERVICE_DATE }"/></td> --%>
			</tr>
		</c:forEach> 
		</c:if>
	
		
		
		</table>
	
	
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
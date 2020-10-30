<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberDetail.css" /><div class="col-lg p-0">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
</div>
<div class="row">
	<div class="col-lg-2">
		<jsp:include page="/WEB-INF/views/mypage1/mypageSideBar.jsp"></jsp:include>
	</div>
	
	<div class="col-lg-10 p-0" id="member-update-container">
		<h4>내정보</h4>
		<hr />
		
		<table class="table" class="table table-striped table-hover">
	    <tr class="header">
	      <th>번호</th>
	      <th>일시</th>
	      <th>금액</th>
	    </tr>
	    <c:forEach items="${ list }" var="payment">
	    <tr>
	      <td>${ payment.no }</td>
	      <td><fmt:formatDate value="${ payment.paymentDate }" pattern="yy/MM/dd"/></td>
	      <td>${ payment.paymentAmount }</td>
		</tr>
		</c:forEach>
		</table>
	</div>
</div>
<div class="col-lg p-0">
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>


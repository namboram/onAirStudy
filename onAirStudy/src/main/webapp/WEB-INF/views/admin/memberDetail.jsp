<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%-- <jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/> --%>
<style>
	#adDivB{
		 width:calc(100%-270px);
		display:inline-block;
		height:100%;
		background-color:skyblue;
	}
</style>
<div id="adDivB col-lg-10">
	<h3>회원 상세보기</h3>
	<table class="table">
			<tr>
				<th>아이디</th>
				<td>${ m.MEMBER_ID }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${ m.MEMBER_NAME }</td>
			</tr>
			<tr>
				<th>회원 등급</th>
				<td>${ m.MEMBER_ROLE }</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td>${ m.PHONE }</td>
			</tr>
			<tr>
				<th>성실포인트</th>
				<td>${ m.DILIGENT_POINT } 점</td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td>${ m.COMMENT  == null ? "없음" : m.COMMENT } </td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>${ m.cate }</td>
			</tr>
			<tr>
				<th>신고내역</th>
				<td>
				<c:if test="${ m.report == 0 }">
				${ m.report } 회
				</c:if>
				<c:if test="${ m.report > 0 }">
				<a href="${ pageContext.request.contextPath }/admin/report?mid=${ m.MEMBER_ID }"> ${ m.report } </a> 회
				</c:if>
				</td>
			</tr>
			<tr>
				<th>블랙리스트</th>
				<td>${ m.BLACKLIST_YN }</td>
			</tr>
	
	</table>
	
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
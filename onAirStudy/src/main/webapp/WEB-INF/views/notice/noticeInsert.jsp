<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/diary.css" />

<style>
	.container{
		width:80%;
		padding:10%;
	}
	.tableB{
		border-bottom:1px solid gray;
	}
	.tableB th{
		width:10%;
	}
	#contentB{
		height:100%;
		padding:5%;
	}
	#contentB input{
		
	} 
</style>

<div class="diary-container">

	<h2>NOTICE</h2>

	<div class="diary-top-container">
		<img
			src="${pageContext.request.contextPath }/resources/images/studydiaryicon.png"
			width="120px" height="120px" />
	</div>

<table class="table tableB">
	<tr>
		<th>제목</th>
		<td><input type="text" value="${ map.TITLE }" /></td>
		<th>작성자</th>
		<td>관리자</td>
	</tr>
	<tr>
		<td id="contentB" colspan=4 ><input type="text" value="${ map.CONTENT }" /></td>
	</tr>
</table>

	<div style="text-align:right;margin:3%;">
	<button class="btn btn-light" type="button">등록하기</button>
	</div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



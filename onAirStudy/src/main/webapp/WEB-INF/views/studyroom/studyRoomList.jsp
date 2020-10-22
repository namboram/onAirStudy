<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.onairstudy.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/studyRoomList.css">


	<div class="studyRoomList" style="margin-bottom: 0;">
		<div class="col-lg-12 p-4 text-center">
			<input class="form-control col-sm-6" id="search" type="text" placeholder="어떤 스터디 그룹을 찾으시나요?"> 
			<br>
			<c:forEach items="${ sCategory }" var="sCategory">
				<input type="checkbox" name="srCategory" id="srCategory"
					value="${ sCategory.no }" />
				<label for="srCategory">${ sCategory.category }</label>
			</c:forEach>
		</div>
		<div class="container-sm">
		<div class="row" id="srlistG">
			<c:forEach items="${ srList }" var="roomList">
			
			
			
				<div class="col-sm-3" id="srProfile">
					<div class="sr_pic">
					<img class="roomPic"
						src="${pageContext.request.contextPath }/resources/upload/${ roomList.srPic }"	width="150px"> 
					</div>
					<img class="memPic"
						src="${pageContext.request.contextPath }/resources/upload/${ roomList.mPic }"	width="150px"> 						
						<a href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/heart.png"
							 width="20px"></a> <br>
					<h5 class="text-center">
						${ roomList.sTitle }
					</h5>
					<h5 class="text-center">
						그룹 리더 : ${ roomList.memberId }
						</h5>
						
						<h5 class="text-center">
						${ roomList.srOpenedYN == 'Y' ? "모집중" :  "모집완료"}
						</h5>
						
						<br>
				
			
						
							<button type="button" class="btn btn-light btn-sm">둘러보기</button>
							<button type="submit" class="btn btn-light btn-sm">신청하기</button>
							<button type="button" class="btn btn-danger btn-sm">신고하기</button>
						
				</div>
		
				
				
				
				<br />
			</c:forEach>
		</div>
	</div>

	</div>
	<script>
	$(document).ready(function(){
		  $("#search").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#srlistG").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>




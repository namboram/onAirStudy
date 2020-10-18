<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.onairstudy.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>StudyRoomList</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/studyRoomList.css">


</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

</html>


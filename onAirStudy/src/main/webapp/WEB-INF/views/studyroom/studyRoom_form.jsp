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
<title>New Study Room</title>
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
	href="${pageContext.request.contextPath }/resources/css/mystudygruop.css">


</head>

<body>
	<div class="newstudygroup" style="margin-bottom: 0;">

		<div class="row">
			<div class="col-sm p-4" style="background-color: #FBF7FD;">
				<h2 class="text-gray" style="float: left; padding-right: auto;">
					My Study Group</h2>
				<br />
				<hr>
				<div class="container">
					<div class="col-sm-9 pt-5 pb-4 bg-white">
						<h2>Study Group</h2>
						<hr>
						<br>
						<div class="col-sm p-4" style="background-color: #F9F1ED;">
							<label for="gruopName"><h4>그룹이름</h4></label> <input type="text"
								class="col-lg-10" id="gruopName" style="border-radius: 15px;">
							<br /> <br /> <label for="groupCategory">카테고리를 선택하세요.</label> <select
								class="form-control" id="groupCategory" name="sellist1">
								<c:forEach items="${sCategory }" var="cate">
									<option>${cate.category}</option>
								</c:forEach>
							</select>
						</div>
						<br />
						<div class="col-sm p-3">
							<h4>모집 인원</h4>
							<hr />
						</div>
						<div class="col-sm p-4" style="background-color: #F9F1ED;">
							<div class="custom-file mb-3">
								<input type="file" class="custom-file-input" id="customFile"
									name="filename"> <label class="custom-file-label"
									for="customFile">그룹 이미지를 올려주세요</label>
							</div>
							<br /> <br /> <label for="question_box_G"><h4>한줄
									소개</h4></label> <br />
							<textarea id="question_box_G" rows="3" class="col-lg-12"
								style="border-radius: 15px;">그룹을 소개해주세요</textarea>
						</div>
						<div class="col-sm pt-3 text-center">
                        <button type="submit" class="btn btn-outline-primary" style="margin-right: 30px;" data-toggle="modal" data-target="#myModal_ok_G">등록 </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
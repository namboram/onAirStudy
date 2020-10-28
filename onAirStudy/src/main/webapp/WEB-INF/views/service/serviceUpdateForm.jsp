<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script>

$(document).ready(function(){
    $("#list").on("click",function(){
    	location.href = '${pageContext.request.contextPath}/servicecenter.do'
    })
    $("#modify").on("click",function(){
    	location.href = '${pageContext.request.contextPath}/serviceUpdate.do'
    })
});


</script>

<!-- 맨위 배너 -->
	<div class="container-fluid" style="height: 20vh; background-color: rgb(247, 235, 229);">
	    <div class="col-md-15">
	    <br>
	    	<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/service.png" width="60px">
		    <h2 class="text-center">무엇을 도와드릴까요?</h2>
		    <p class="text-center">onAir Study 고객센터입니다.</p>
		</div>
	</div>


	
	<div>
	<h2 class="text-center">고객센터 수정하기</h2>
	<form name="serviceUpdateFrm" action="${pageContext.request.contextPath}/serviceUpdate.do" method="post">
		<table class="board_view">
		
		<div class="form-group row">
		  <label for="title" class="col-sm-2 col-form-label">제목</label>
		  <div class="col-sm-10">
		    <input type="text" class="form-control" id="name" name="title" value="${ map.SERVICE_TITLE }" required>
		  </div>
		</div>
		<div class="form-group row">
		  <label for="category" class="col-sm-2 col-form-label">카테고리</label>
		  <div class="form-group">
                     <select class="form-control" id="category" name="category">
                        <option value="1">선택</option>
                        <option value="1">신고</option>
                        <option value="2">이용</option>
                        <option value="3">결제</option>
                        <option value="4">기타</option>
                     </select>
                  </div>
		</div>
		<div class="form-group row">
		  <label for="MEMBER_ID" class="col-sm-2 col-form-label">작성자</label>
		  <div class="col-sm-10">
		    <input type="MEMBER_ID" class="form-control" id="MEMBER_IDl" name="MEMBER_ID" value="${ map.MEMBER_ID }" readonly>
		  </div>
		</div>
		<div class="form-group row">
		  <label for="content" class="col-sm-2 col-form-label">내용</label>
		  <div class="col-sm-10">
		    <input type="text" class="form-control" id="content" name="content" value="${ map.SERVICE_CONTENT}" required>
		  </div>
		</div>
        
    </table>
    </form>
   
   <div class="text-center"> 
		<a href="#this" id="list" class="btn">목록으로</a>
		<input type="hidden" name="no" value="${ map.NO }">
		<button type="submit" class="btn" id="modify">수정하기</button>
		</div>
	
	


</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
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
<%-- <c:if test="${ not empty service }"> --%>
	<form name="serviceUpdateFrm" 
		 action="${pageContext.request.contextPath}/serviceUpdate.do"
		 method="post">
		 <input type="hidden" name="no" value="${ Service.NO }" />
		<table class="board_view">
		
		<div class="form-group row">
		  <label for="title" class="col-sm-2 col-form-label">제목</label>
		  <div class="col-sm-10">
		    <input type="text" class="form-control" id="service_title" name="service_title" value="${ service.SERVICE_TITLE }" required>
		  </div>
		</div>
		
		<div class="form-group row">
		  <label for="MEMBER_ID" class="col-sm-2 col-form-label">작성자</label>
		  <div class="col-sm-10">
		    <input type="MEMBER_ID" class="form-control" id="MEMBER_ID" name="MEMBER_ID" value="${ service.MEMBER_ID }"  readonly>
		  </div>
		</div>
		<div class="form-group row">
		  <label for="content" class="col-sm-2 col-form-label">내용</label>
		  <div class="col-sm-10">
		  <textarea class="form-control" name="content" rows="5">${ service.SERVICE_CONTENT}</textarea>
		  </div>
		</div>
        
    </table>
    </form>
   
   <div class="text-center"> 
		<a href="#this" id="list" class="btn">목록으로</a>
		
		<button type="submit" class="btn">수정하기</button>
		</div>
	
<%-- </c:if> --%>

</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
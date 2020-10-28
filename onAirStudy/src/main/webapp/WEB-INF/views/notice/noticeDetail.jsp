<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<style>
div#board-container {
	width: 400px;
}
input, button, textarea {
	margin-bottom: 15px;
}
button {
	overflow: hidden;
}
</style>


<div id="diary-container" class="mx-auto text-center" style="width:60%;">
	<h2>STUDY DIARY</h2>
	
	<div id="diary-main-container">
		<input type="text" class="form-control" 
			   name="diaryTitle" id="title" 
			   value="${ map.TITLE }" required>
		<input type="text" class="form-control" 
			   name="memberId" 
			   value="관리자" readonly required>
	    <input type="number" class="form-control" name="readCount" title="조회수"
			   value="${ map.READ_CNT }" readonly>
		<hr />
		
	    <textarea class="form-control" name="content" 
	    		  placeholder="내용">${ map.CONTENT }</textarea>
	</div>

</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
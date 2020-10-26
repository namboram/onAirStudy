<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
div#diary-container{width:400px;}
input, button, textarea {margin-bottom:15px;}
button {
	overflow: hidden;
}
/* 부트스트랩 : 파일라벨명 정렬*/
div#diary-detail-container label.custom-file-label{text-align:left;}
</style>


<div id="diary-container" class="mx-auto text-center">
	<h2>STUDY DIARY</h2>
	
	<div id="diary-main-container">
		<input type="text" class="form-control" 
			   placeholder="제목" name="diaryTitle" id="title" 
			   value="${ diary.diaryTitle }" required>
		<input type="text" class="form-control" 
			   name="memberId" 
			   value="${ diary.memberId }" readonly required>
	   
	    <input type="number" class="form-control" name="readCnt" title="조회수"
			   value="${ diary.readCnt }" readonly>
		
		<input type="datetime-local" class="form-control" name="diaryDate" 
			   value='<fmt:formatDate value="${ diary.diaryDate }" pattern="yyyy-MM-dd'T'HH:mm"/>'>
		<hr />
		
		<c:forEach items="${ diary.attachList }" var="attach">
		<!-- 다이어리 사진 송출  -->
			<button type="button" 
					class="btn btn-outline-success btn-block">
				첨부파일 - ${ attach.originalFilename }
			</button>
		</c:forEach>
		
		
	    <textarea class="form-control" name="diaryContent" 
	    		  placeholder="내용" required>${ diary.diaryContent }</textarea>
	</div>

</div>
<div id="diary-reply-container">
	<h5>댓글달기</h5>
	<hr />
	
</div>
<script>
function fileDownload(no){
	location.href = "${ pageContext.request.contextPath }/board/fileDownload.do?no=" + no;
}


</script>

<jsp:include page="/WEB-INF/views/diary/diaryReply.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

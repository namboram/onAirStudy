<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
/* div#diary-container{width:400px;} */
input, button, textarea {margin-bottom:15px;}
button {
	overflow: hidden;
}
/* 부트스트랩 : 파일라벨명 정렬*/
div#diary-detail-container label.custom-file-label{text-align:left;}
</style>


<div id="diary-container" class="mx-auto col-sm-10 offset-sm-1">
	<div class="text-center">
		<h2>STUDY DIARY</h2>
	</div>
	<%-- <div id="diary-main-container">
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
	</div> --%>
	<div class="border border-secondary">
		${diary.diaryContent}
	</div>
	<c:if test="${loginMember.memberId eq diary.memberId }">
	<form action="${ pageContext.request.contextPath }/diary/deleteDiary.do" method="post" onsubmit="return deleteSubmit();">
	<input type="hidden" value="${diary.no}" name="no"/>
	<button type="submit" class="btn btn-danger">삭제</button>
	</form>
	</c:if>
</div>
<div id="diary-reply-container">
	  <c:if test="${ loginMember.memberId != null }">
	  <hr />
	  <input type="text" class="form-control col-sm-6" name="replyContent" id="replyContent" placeholder="댓글을 적어주세요" required/>&nbsp;
      <!-- <input type="password" class="form-control col-sm-2" name="DRpassword" maxlength="4" placeholder="비밀번호" required/>&nbsp; -->
      <button class="btn btn-outline-success" id="btnReply" >댓글작성</button>
	  </c:if>
</div>
<!-- 댓글 목록 출력할 위치  -->


<script>

//삭제
function deleteSubmit(){
	if(confirm("삭제 하시겠습니까?")){
		return true;
	}else
		return false;
}

$(document).ready(function(){

	/* listReply(); */
			
	$("#btnReply").click(function(){
		var replyContent = $("#replyContent").val();
		var diaryNo = ${diary.no}
		var param = "replyContent="+replyContent+"&diaryNo="+diaryNo+"&memberId=${loginMember.memberId}";
		console.log("diaryNo="+diaryNo);
		console.log("param="+param);
		
		 $.ajax({
			type: "get",
			url : "${ pageContext.request.contextPath }/diary/insertDiaryReply.do",
			data : param,
			success: function(){
				alert("댓글이 등록되엇습니다.");
				window.location.reload();
			}
		}); 
	
	});

});






</script>

<jsp:include page="/WEB-INF/views/diary/diaryReply.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

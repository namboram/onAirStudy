<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/diaryDetail.css" />


<div id="diary-container" class="mx-auto col-sm-10 offset-sm-1">
	<div class="text-center">
		<hr class="hr-text" data-content="STUDY DIARY">
	</div>
	<div class="diary-detail-info">
		작성자  ${ diary.memberId } / 작성일 <fmt:formatDate value="${ diary.diaryDate }" pattern="yy.MM.dd"/> / 조회수 ${ diary.readCnt }
		<hr class="hr-color">
	</div>
	<div class="border border-secondary">
		${diary.diaryContent}
	</div>
	<button type="button" class="btn" id="listbtn">목록</button>
	<c:if test="${loginMember.memberId eq diary.memberId }">
		<form action="${ pageContext.request.contextPath }/diary/deleteDiary.do" method="post" onsubmit="return deleteSubmit();">
			<input type="hidden" value="${diary.no}" name="no"/>
			<button type="submit" class="deletebtn">게시글삭제</button>
		</form>
	</c:if>
</div>
<br />
<hr />
<div id="diary-reply-container">
	  <c:if test="${ loginMember.memberId != null }">
		  <input type="text" class="" name="replyContent" id="replyContent" placeholder="댓글을 적어주세요" maxlength="25" required/>
	      
	      <button class="btn" id="replybtn" >댓글작성</button>
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
			
	$("#replybtn").click(function(){
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

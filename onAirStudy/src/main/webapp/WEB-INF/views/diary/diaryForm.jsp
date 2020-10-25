<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
div#board-container{width:400px; margin:0 auto; text-align:center;}
div#board-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}

</style>
<script>
/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
function boardValidate(){
	var $content = $("[name=diaryContent]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

$(function(){
	//파일 선택/취소 파일라벨명을 업로드된 파일로 변경한다.
	$("[name=upFile]").on("change", function(){
		//방금 선택한 파일
		var file = $(this).prop('files')[0];
		var $label = $(this).next(".custom-file-label");
	
		if(file == undefined)
			$label.html("파일을 선택하세요");
		else
			$label.html(file.name);
	});
	
	
});

</script>
<div id="diary-container">
	<form name="diaryFrm" 
		  action="${pageContext.request.contextPath}/diary/diaryEnroll.do" 
		  method="POST"
		  enctype="multipart/form-data"  
		  onsubmit="return diaryValidate();">
		<input type="text" class="form-control" placeholder="제목" name="diaryTitle" id="title" required>
		<input type="text" class="form-control" name="memberId" value="${ loginMember.memberId }" readonly required>
\
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" >
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div>
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일2</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile2" >
		    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
		  </div>
		</div>
	    <textarea class="form-control" name="diaryContent" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
	</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

​ 
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/diary.css" />


<!-- Modal -->
<div class="modal fade" id="diaryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">다이어리 기록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<form name="boardEnrollFrm" 
		  	<%--   action="${pageContext.request.contextPath}/diary/diaryEnroll.do"  --%>
		  	  method="post" onsubmit="return diaryValidate();">
		  
		  <div class="diary-form-group">
		    <label for="formGroupExampleInput">제목</label>
		    <input type="text" class="form-control" id="diary-title" placeholder="" required>
		  </div>
		  <div class="diary-form-group">
		    <input type="file" class="form-control-file" id="diary-fileup">
		  </div>
		  <div class="diary-form-group">
		    <label for="exampleFormControlTextarea1">내용</label>
		    <textarea class="form-control" id="diary-content" rows="3" required></textarea>
		  </div>	
					
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>


	
<div class="diary-container">
	<p>STUDY DIARY</p>
	<div class="diary-top-container">
		<img src="${pageContext.request.contextPath }/resources/images/studydiaryicon.png" width="120px" height="120px" />
	</div>
    
    <form id="diarySearchFrm" 
    	  action= "diaryList.do" 
    	  class="form-inline" 
    	  method="post">
        <select name ="diary-select-bar">
         	<option value="제목">제목</option> 
         	<option value="작성자">작성자</option>
        </select>
    </form>
 
        <input type="search" class="form-control col-sm-6" name="search" placeholder="검색할 키워드를 입력하세요"/>&nbsp;
        <button class="btn btn-outline-diary-search" type="submit" >검색</button>
        
        <!-- call model button -->
        <button class="btn btn-light" 
        		id="diary-addbtn" data-toggle="modal" data-target="#diaryModal">글쓰기</button>

    
    <br />
    <!-- 공부다이어리 목록 -->
	<table class="table">
	    <tr>
	      <th>번호</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>작성일</th>
	      <th>첨부파일</th> <!-- 첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
	      <th>조회수</th>
	    </tr>
	    <c:forEach items="${ list }" var="diary">
	    <tr>
	      <td>${ diary.no }</td>
	      <td><a></a>${ diary.diaryTitle }</td>
	      <td>${ diary.memberId }</td>
	      <td><fmt:formatDate value="${ diary.diaryDate }" pattern="yy/MM/dd"/></td>
	      <td>
	      	<%-- 
	      	<c:if test="${ diary.fileCount gt 0 }">
					<img src="${ pageContext.request.contextPath }/resources/images/file.png"
						 style="width:16px;"/>
			</c:if> 
			--%>
	      </td>
	      <td>${ diary.readCnt }</td>
		</tr>
	    </c:forEach>
	</table>
	<div class="diary-bottom-container">
		
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
	</div>
	
</div>





<!-- call diaryForm.jsp ! -->
<script>
/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
function diaryValidate(){
	var $content = $("[name=content]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}
/* 
$(function(){
	//파일 선택/취소 파일라벨명을 변경한다.
	$("#diary-content").on("change", function(){
		var file = $(this).prop('files')[0];
		var $label = $(this).next(".custom-file-label");

		if(file == undefined)
			$label.html("파일을 선택하세요");
		else
			$label.html(file.name);
	}); */
	
	
});
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

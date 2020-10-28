<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

​ 
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/diary.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Secular+One&display=swap" rel="stylesheet">


<style>
tr[data-no]{
	cursor:pointer;
}
</style>
<script>
$(function(){
	$("tr[data-no]").click(function(){
		var no = $(this).attr("data-no");
		console.log(no);
		location.href = "${ pageContext.request.contextPath }/diary/diaryDetail.do?no=" + no;
		});	
});

function goDiaryForm(){
	location.href = "${pageContext.request.contextPath}/diary/diaryForm.do";
}
</script>
<!-- 검색창 --> 
<div class="diary-container">
	<h2>STUDY DIARY</h2>
	
	<div class="diary-top-container">
		<img src="${pageContext.request.contextPath }/resources/images/studydiaryicon.png" width="120px" height="120px" />
	</div>
    

  	<div class="diary-search-write-container">
  		
  		<form action="/diary/diarySearch" method="GET" id="selectFrm">
	 		 <select name ="diary-select-bar" id="diary-select-bar">
	         	<option value="제목">제목</option> 
	         	<option value="작성자">작성자</option>
	        </select>
	  		<span class="pink_window">
		        <input type="search" class="search" 
		        	   id="keywordS" name="keywordS" placeholder="검색어를 입력해주세요"/>&nbsp;
	  		</span>
		        <button class="btn btn-outline-danger" id="diary-searchbtn"type="submit">검색</button>
  		</form>
		    <input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goDiaryForm();"/>
  	</div>
		
    <br />
    
    <!-- 공부다이어리 목록 -->
	<table class="table" class="table table-striped table-hover">
	    <tr class="header">
	      <th>번호</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>작성일</th>
	     <!--  <th>첨부파일</th> --> <!-- 첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
	      <th>조회수</th>
	    </tr>
	    <c:forEach items="${ list }" var="diary">
	    <tr data-no="${ diary.no }">
	      <td >${ diary.no }</td>
	      <td><a></a>${ diary.diaryTitle }</td>
	      <td>${ diary.memberId }</td>
	      <td><fmt:formatDate value="${ diary.diaryDate }" pattern="yy/MM/dd"/></td>
	   <%--    <td>
	      	<c:if test="${ diary.fileCount gt 0 }">
					<img src="${ pageContext.request.contextPath }/resources/images/file.png"
						 style="width:16px;"/>
			</c:if>  
	      </td> --%>
	      <td>${ diary.readCnt }</td>
		</tr>
	    </c:forEach>
	    </table>

</div>

<script>

	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

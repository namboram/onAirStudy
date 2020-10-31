<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

​ 
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/diary.css" />


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
<div class="diary-container" style="height:100%;">
		<div class="text-center">
			<hr class="hr-text" data-content="STUDY DIARY">
		</div>
	
		<div class="diary-top-container">
			<img src="${pageContext.request.contextPath }/resources/images/studydiaryicon.png" width="120px" height="120px" />
		</div>
	    
	
	  	<div class="diary-search-write-container" style="padding:1%;">
	  		
	  		<form id="selectFrm">
		 		 <select name ="searchType" id="diary-select-bar">
		         	<option value="title" ${ map.searchType == 'title' ? 'selected' : '' }>제목</option> 
		         	<option value="memberId" ${ map.searchType == 'memberId' ? 'selected' : '' }>작성자</option>
		        </select>
		  		<span class="pink_window">
			        <input type="search" class="search" 
			        	   id="keywordS" name="searchKeyword" placeholder="검색어를 입력해주세요" value="${ map.searchKeyword }"/>&nbsp;
		  		</span>
			        <button class="btn btn-outline-danger" id="diary-searchbtn" type="button" onclick="search();">검색</button>
	  		</form>
	  			<!-- 내가 쓴 글 조회하는 버튼 -->
			    <!-- <input type="button" value="내가 쓴 글" id="btn-search" class="btn btn-outline-success"/> -->
			    <input type="button" value="글쓰기" id="diary-writebtn" class="btn" onclick="goDiaryForm();"/>
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
	    <c:if test="${ empty list }">
	    <tr><td colspan=5>조회 결과가 없습니다.</td></tr>
	    </c:if>
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
	    
	    <div id='pageBar'>
			${ map.pageBar }
		</div>

</div>

<script>

	var action = "${pageContext.request.contextPath}/diary/diaryList.do?";

	function search() {
		var searchType = $("#diary-select-bar option:selected").val();
		var searchKeyword = $("[name=searchKeyword]").val();

		console.log("searchType = " + searchType);
		console.log("searchKeyword = " + searchKeyword);

		action += "searchType=" + searchType;
		action += "&searchKeyword=" + searchKeyword;

		location.href = action;

	}

	$(document).ready(function(){
		$("#btn-search").click(function(){

			action += "searchType=memberId";
			action += "&searchKeyword=" + "${ loginMember.memberId }";

			console.log(action);
			location.href=action;
			
		});

	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

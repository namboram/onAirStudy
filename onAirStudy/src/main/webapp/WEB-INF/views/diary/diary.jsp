<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공부다이어리" name="title"/>
</jsp:include>

<style>
div#memo-container{width:60%; margin:0 auto;text-align:center;}
</style>
<div id="diary-container">
	<p>STUDY DIARY</p>
    <form id="diarySearchFrm" 
    	  action="${pageContext.request.contextPath}/diary/diary.do" 
    	  class="form-inline" 
    	  method="post">
        <select name ="title">
         	<option value="제목">제목</option> 
         	<option value="작성자">작성자</option>
        </select>
        <input type="text" class="form-control col-sm-6" name="search" placeholder="검색할 키워드를 입력하세요"/>&nbsp;
        <button class="btn btn-outline-success" type="submit" >검색</button>
    </form>
    <br />
    <!-- 공부다이어리 목록 -->
	<table class="table">
	    <tr>
	      <th>번호</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>작성일</th>
	      <th>첨부파일</th>
	      <th>조회수</th>
	    </tr>
	    <c:forEach items="${ list }" var="diary">
	    <tr>
	      <td>${ diary.no }</td>
	      <td>${ diary.diaryTitle }</td>
	      <td>${ diary.memberId }</td>
	      <td><fmt:formatDate value="${ diary.diaryDate }" pattern="yy/MM/dd"/></td>
	      <td></td>
	      <td>${ diary.redCnt }</td>
		</tr>
	    </c:forEach>
	</table>
</div>


<script>
/* $("#memoEnrollFrm, #memoDelFrm").submit(function(){

	var $password = $(this).find("[name=password]");

	if(/^\d{4}$/.test($password.val()) == false){
		alert("비밀번호는 정수 4자리로 작성하세요.");
		return false;
	}
	
	return true;
}); 
 */

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

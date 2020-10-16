<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include> 


<style>
div#diary-container{width:60%; height:900px; margin:0 auto;text-align:center; }
/* input#btn-diary-add{ margin: 0 0 15px;} */

</style>

	
<div id="diary-container">
	<p>STUDY DIARY</p>
    <form id="diarySearchFrm" 
    	  action= "diaryList.do" 
    	  class="form-inline" 
    	  method="post">
        <select name ="title">
         	<option value="제목">제목</option> 
         	<option value="작성자">작성자</option>
        </select>
 
        <input type="search" class="form-control col-sm-6" name="search" placeholder="검색할 키워드를 입력하세요"/>&nbsp;
        <button class="btn btn-outline-diary-search" type="submit" >검색</button>
        
        <!-- call model button -->
        <button class="btn btn-outline-diary-write" 
        		data-toggle="modal" data-target="#myModal" id="btn-diary-add">글쓰기</button>

    
    </form>
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
</div>



<!-- Modal -->
<div id="myModal" class="modal">
     <div class="modal-dialog">
          <div class="modal-content">
               <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Confirmation</h4>
               </div>
               <div class="modal-body">
                    <p>Do you want to save changes you made to document before closing?</p>
                    <p class="text-warning"><small>If you don't save, your changes will be lost.</small></p>
               </div>
               <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
               </div>
          </div>
     </div>
</div>
<!-- call diaryForm.jsp ! -->
<script>
$(document).ready(function(){
    function alignModal(){
        var modalDialog = $(this).find(".modal-dialog");
        
        // Applying the top margin on modal dialog to align it vertically center
        modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
    }
    // Align modal when it is displayed
    $(".modal").on("shown.bs.modal", alignModal);
    
    // Align modal when user resize the window
    $(window).on("resize", function(){
        $(".modal:visible").each(alignModal);
    });   
});
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<style>
.box {
	width: 90%; 
	margin-left:10%;
	padding-right:10%;
}
.tableB {
	border-bottom: 1px solid gray;
}
.tableB th {
	width: 10%;
}
#contentB {
	height: 100%;
	padding: 5%;
}
</style>


<!-- 맨위 배너 -->
	<div class="container-fluid" style="height: 20vh; background-color: rgb(247, 235, 229);">
	    <div class="col-md-15">
	    <br>
	    	<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/service.png" width="60px">
		    <h2 class="text-center">무엇을 도와드릴까요?</h2>
		    <p class="text-center">onAir Study 고객센터입니다.</p>
		</div>
	</div>


	<h2 class="text-center p-3 ">고객센터 상세보기</h2>
	
	<c:if test="${map.MEMBER_ID ne loginMember.memberId }">
		<div class="box">
		<table class="table tableB" >
        
            <tr>
                <th>제목</th>
                <td>${map.SERVICE_TITLE}</td>
                <th>카테고리</th>
                
                 <c:choose>
					<c:when test="${ map.CATEGORY == 1}">
						<td>신고</td>
					</c:when>
					<c:when test="${ map.CATEGORY == 2}">
						<td>이용</td>
					</c:when>
					<c:when test="${ map.CATEGORY == 3}">
						<td>결제</td>
					</c:when>
					<c:when test="${ map.CATEGORY == 4}">
						<td>기타</td>
					</c:when>
				</c:choose>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${map.MEMBER_ID}</td>
                <th>작성시간</th>
                <td><fmt:formatDate value="${ map.SERVICE_DATE}" 
                		pattern="yy/MM/dd" /></td>
            </tr>
            <tr>
                <th>내용</th>
                <td  id="contentB" colspan=4 class="text-center">
                    ${map.SERVICE_CONTENT }
                </td>
            </tr>
    </table>
    <div class="text-center">
		<button class="btn btn-light"
			onclick="location.href='${pageContext.request.contextPath}/servicecenter.do'">목록으로</button> 
    </div>
    </c:if>
 </div> 
    
    
    
    <!-- 본인이 작성한글 수정하기 -->
    <c:if test="${map.MEMBER_ID eq loginMember.memberId }">
 	<div class="box">   	
	    <form name="serviceUpdateFrm" 
			 action="${pageContext.request.contextPath}/serviceUpdate.do"
			 method="post">
			 <input type="hidden" name="no" value="${ map.NO }" />
			<table class="board_view">
			
			<div class="form-group row">
			  <label for="title" class="col-sm-2 col-form-label">제목</label>
			  <div class="col-sm-10">
			    <input type="text" class="form-control" id="serviceTitle" name="serviceTitle" value="${ map.SERVICE_TITLE }" required>
			  </div>
			</div>
			
			<div class="form-group row">
			  <label for="MEMBER_ID" class="col-sm-2 col-form-label">작성자</label>
			  <div class="col-sm-10">
			    <input type="MEMBER_ID" class="form-control" id="memberId" name="memberId" value="${ map.MEMBER_ID }"  readonly>
			  </div>
			</div>
			<div class="form-group row">
			  <label for="content" class="col-sm-2 col-form-label">내용</label>
			  <div class="col-sm-10">
			  <textarea class="form-control" name="serviceContent" rows="5" value="${ map.SERVICE_CONTENT}">${ map.SERVICE_CONTENT}</textarea>
			  </div>
			</div>
	        
	    </table>
    
	    	<div class="text-center">
	    		<button class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/servicecenter.do'">목록으로</button>
				<button type="submit" class="btn btn-light">수정하기</button>
				<button type="button" class="btn btn-light" id="delete"
						onclick="location.href='${pageContext.request.contextPath}/serviceDelete.do?no=${map.NO}'">삭제하기</button>		
	
			</div>
	   </form>
    </c:if>
    
</div>

	
	



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
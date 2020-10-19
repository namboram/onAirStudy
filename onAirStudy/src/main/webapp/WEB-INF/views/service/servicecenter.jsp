<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    
    
    <!-- 맨위 배너 -->
	<div class="container-fluid" style="height: 20vh; background-color: rgb(247, 235, 229);">
	    <div class="col-md-15">
	    <br>
	    	<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/service.png" width="60px">
		    <h2 class="text-center">무엇을 도와드릴까요?</h2>
		    <p class="text-center">onAir Study 고객센터입니다.</p>
		</div>
	</div>

<div class="row">
	
	<!-- 서비스별 질문 -->

	<div class="m-5">
	
		<h3>서비스별 질문</h3>
		<hr>
			<ul class="row">
			<li>
				<div class="mx-auto d-block">
				<a href="#">
					<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/hand.png" width="60px">
					<h4 style="margin-top:20%;">결제</h4>	
				</a>
				</div>
			</li>
						
							<li><div class="mx-auto">
								<a href="#">
									<img class="mx-auto" src="${pageContext.request.contextPath }/resources/images/message.png" width="60px">
									<h4 style="margin-top:20%;">채팅</h4></a></div>
							</li>
							<li>
								<div class="mx-auto d-block">
									<a href="#">	
										<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/hand.png" width="60px">
										<h4 style="margin-top:20%;">탈퇴</h4></a></div>	
							</li>
							<li>
								<div class="mx-auto d-block">
									<a href="#">
										<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/warning.png" width="60px">
										<h4 style="margin-top:20%;">신고</h4>	
									</a></div></li>
						</ul><hr>
				
				</div>
				
<!-- 자주묻는 질문 -->
<div class="m-5">
	<h3>자주하는 질문</h3>
	
	<div class="bs-example">
	    <div class="accordion" id="accordionExample">	        
	       <c:forEach items="${ serviceContentList }" var="sc">      
		        <div class="card">
		            <div class="card-header">
		                <h2 class="mb-0">
		                    <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapseOne">${ sc.title }</button>									
		                </h2>
		            </div>
		            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
		                <div class="card-body">
		                    <p>${ sc.content } <a href="" target="_blank">Learn more.</a></p>
		                </div>
		            </div>
		        </div>
	        </c:forEach>
	        
	    </div>
	</div>			
</div> 

</div>

<br>
<!-- 문의게시판 목록 -->
	<div>
	<h3>문의게시판</h3>
		 <form id="diarySearchFrm" 
    	  action= "diaryList.do" 
    	  class="form-inline" 
    	  method="post">
    	 
        <select name ="title">
         	<option value="제목">제목</option> 
         	<option value="카테고리">카테고리</option>
         	<option value="작성자">작성자</option>
        </select>
 
        <input type="search" class="form-control col-sm-6" name="search" placeholder="검색할 키워드를 입력하세요"/>&nbsp;
        <button class="btn btn-outline-diary-search" type="submit" >검색</button>
        
        <!-- call model button -->
        <button class="btn btn-outline-diary-write" 
        		data-toggle="modal" data-target="#myModal" id="btn-diary-add">글쓰기</button>
		<input type="checkbox" id="chk" name="chk" value="내가 작성한글 보기"/>내가 작성한글 보기
    	</form>
    
    
    
		<form role="form" method="get">
					<table class="table table-hover">
					    <tr>
					      <th>번호</th>
					      <th>답변상태</th>
					      <th>제목</th>
					      <th>작성자</th>
					      <th>작성날짜</th>
					    </tr>
					    <c:forEach items="${ serviceList }" var="service">
					    <tr>
					      <td>${ service.no }</td>
					      <td>${ service.serviceStatus }</td>
					      <td><a></a>${ service.serviceTitle }</td>
					      <td>${ service.memberId }</td>
					      <td><fmt:formatDate value="${ service.serviceDate }" pattern="yy/MM/dd"/></td>
						</tr>
					    </c:forEach>
				</table>				
				</form>




	




</div>


								
</div>








<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



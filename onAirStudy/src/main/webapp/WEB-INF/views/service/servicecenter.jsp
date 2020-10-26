<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script>
//아래쪽에서 이 함수를 호출해서 페이지값을 컨트롤러에 맵핑시킨다
function list(page){
    console.log("페이지를 이동합니다.");
    location.href="${pageContext.request.contextPath}/list.do?curPage="+page;
}
</script>
    
    
    <!-- 맨위 배너 -->
	<div class="container-fluid" style="height: 20vh; background-color: rgb(247, 235, 229);">
	    <div class="col-md-15">
	    <br>
	    	<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/service.png" width="60px">
		    <h2 class="text-center">무엇을 도와드릴까요?</h2>
		    <p class="text-center">onAir Study 고객센터입니다.</p>
		</div>
	</div>

	

	<!--   서비스별 질문 -->
<div class="row" >
	<div class="m-5">
	
		<h3>서비스별 질문</h3>
		<hr>
			<ul class="row" >
			<li>
				<div class="mx-auto d-block">
				<a href="#">
					<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/hand.png" width="60px">
					<h4 style="margin-top:20%;">결제</h4>	
				</a>
				</div>
			</li>
			
			<li>
				<div class="mx-auto d-block">
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
			</ul>
			<hr>
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



<!-- 문의게시판 목록 -->
<div class="m-5">
	<h3 class="text-center">문의게시판</h3>
			
			<button id="createBtn" type="button" class="btn btn-info btn-sm float-right" 
				onclick="location.href='${pageContext.request.contextPath}/service/serviceForm.do'">새 글 쓰기</button>



<!-- 검색 -->
	<form name="form1" method="post" action="${pageContext.request.contextPath}/list.do">
	 <div class="form-group row justify-content-center">
				<div class="w100" style="padding-right:10px">
			 <select name="search_option">
		        <option value="memberId"
		<c:if test="${map.search_option == 'memberId'}">selected</c:if>
		   >작성자</option>
		
		        <option value="title" 
		<c:if test="${map.search_option == 'serviceTitle'}">selected</c:if>
		        >제목</option>
		
		        <option value="content" 
		<c:if test="${map.search_option == 'serviceContent'}">selected</c:if>
		        >내용</option>
		
		        <option value="all" 
		<c:if test="${map.search_option == 'all'}">selected</c:if>
		        >작성자+내용+제목</option>
		
		    </select>
		    <input name="keyword" placeholder="검색어를 입력하세요" value="${map.keyword}">
		    <input class="btn btn-sm btn-primary" name="search" type="submit" value="조회">
	
		</div>
	</div>
			
	</form>
			

        
     
        <div class="float-right" >
			<input type="checkbox" id="chk" name="chk" value="">내가 작성한글 보기</input>
		</div>
		
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
				
				
				
				
				<!-- 페이징처리 -->			
				<div class="container">
					
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











<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



<%@page import="com.kh.onairstudy.servicecenter.model.vo.ServiceCenter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	List<ServiceCenter> list = (List<ServiceCenter>)request.getAttribute("serviceList"); 
	System.out.println("흠냐뤼~"+list);
%>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script>
/* function selectCategory(category) {
	console.log(category);
    location.href="${pageContext.request.contextPath}/list.do?category="+category;
}
function searchClick() {
	var selectOption = $("#searchOption").val();
	var keyword = $("#keyword").val();
	location.href="${pageContext.request.contextPath}/list.do?search_option="+selectOption + "&keyword=" + keyword;
}
function isLogined() {
	var memberid = $("#member_id").val();
	if(memberid != null) {
		return memberid;
	} else {
		alert("로그인을 해주세요!");
		return false;
	}
}
$(document).ready(function() {
	$("#chk").change(function() {
		if(this.checked) {
			var memberid = isLogined() ? isLogined() : false;
			if(memberid) {
				$("#search_option").val('member_id');
				$("#keyword").val(memberid);
				searchClick();
			} else {
				return false;
			}
			
		} else {
			location.href = '${pageContext.request.contextPath}/servicecenter.do'
		}
	})
}); */
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
	<!-- <div class="row" style="margin-left:15%;" > -->
		<div class="m-5">
		
			<h3 class="text-center">서비스별 질문</h3>
			<hr style="border:2px solid rgb(247, 235, 229);">
				<ul class="row" style="list-style:none; width:700px; margin-left:27%;">
					<li>
						<div class="mx-auto d-block p-5">
						<!-- <a href="#" onclick="selectCategory(1)"> -->
							<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/warning.png" width="60px">
							<!-- </a> --><br><h4 class="text-center" style="margin-top:20%; color=black; cursor:pointer;">신고</h4>	
						</div></li>
					<li>
						<div class="mx-auto d-block p-5">
						<!-- <a href="#" onclick="selectCategory(2)"> -->
							<img class="mx-auto" src="${pageContext.request.contextPath }/resources/images/message.png" width="60px">
							<!-- </a> --><br><br><h4 class="text-center" style="margin-top:20%; color=black; cursor:pointer;" >이용</h4>
						</div>
					</li>
					<li>
						<div class="mx-auto d-block p-5">
						<!-- <a href="#" onclick="selectCategory(3)"> -->
							<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/hand.png" width="60px"><!-- </a> -->
							<br><h4 class="text-center" style="margin-top:20%; color=black; cursor:pointer;">결제</h4>	
						
						</div>
					</li>
					<li>
						<div class="mx-auto d-block p-5">
						<!-- <a href="#" onclick="selectCategory(4)"> -->	
							<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/etc.png" width="60px"><!-- </a> -->
							<br><h4 class="text-center" style="margin-top:20%;  color=black; cursor:pointer;" >기타</h4></div>	
					</li>
					
				</ul>
				<hr style="border:2px solid rgb(247, 235, 229);">
		</div>
			
				
	<!-- 자주묻는 질문 -->
	<div class="m-5"> 
		<h3 class="text-center">
		<img src="${ pageContext.request.contextPath }/resources/images/question.png" width="60px">
		&nbsp;&nbsp;
		자주하는 질문</h3>
		<br>
	 <div class="bs-example" >
		    <div class="accordion" id="accordionExample">	        
		       
		       <c:forEach items="${ serviceContentList }" var="sc" varStatus="status">      
			        <div class="card text-center" style="width:400px; margin-left:37%; background-color:rgb(247, 235, 229);">
			            <div class="card-header">
			                    <button type="button" class="btn btn-link " data-toggle="collapse" data-target="#collapseOne${status.index}">
			                    <p class="text-center" style="color:black; font-weight: bold;">${ sc.title }</p>
			                    </button>									
			            </div>
			            <div id="collapseOne${status.index}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
			                <div class="card-body text-center" style="background-color:rgb(250, 246, 244);">
			                    <p>${ sc.content }</p>
			                </div>
			            </div>
			        </div>
		        </c:forEach>
		    </div>
		</div>			
	</div> 
<!-- </div> -->


  <c:if test="${ list != null }">
<!-- 문의게시판 목록 -->
<div class="m-5" >
	<h3 class="text-center">문의게시판
			
			<button id="createBtn" type="button" class="btn btn-info btn-sm float-right" 
				onclick="location.href='${pageContext.request.contextPath}/service/serviceForm.do'">새 글 쓰기</button>
	</h3>


<!-- 검색 -->
<%-- 	<form name="form1">
	 <div class="form-group row justify-content-center">
		<div class="w100" style="padding-right:10px">
			 <select name="search_option" id="searchOption">
				        <option value="member_id"
				<c:if test="${map.search_option == 'member_id'}">selected</c:if>
					   >작성자</option>
				
				        <option value="service_title" 
				<c:if test="${map.search_option == 'service_title'}">selected</c:if>
				        >제목</option>
				
				        <option value="service_content" 
				<c:if test="${map.search_option == 'service_content'}">selected</c:if>
				        >내용</option>
				
				        <option value="all" 
				<c:if test="${map.search_option == 'all'}">selected</c:if>
				        >작성자+내용+제목</option>
				
		    </select>
		    <input name="keyword" id="keyword" placeholder="검색어를 입력하세요" value="${map.keyword}">
		    <input class="btn btn-sm btn-primary" name="search" type="button" onclick="searchClick()" value="조회">
	
		</div>
	</div>
			
	</form> --%>
			

  
    
     <div class="container1" style="padding-left:5%;padding-right:5%;">
       <%--  <div class="float-right" >
			<input type="checkbox" id="chk" name="chk">내가 작성한글 보기</input>
			<input type="hidden" id="member_id" name="member_id" value="${memberId}" />
		</div> --%>
		
		
					  
					<table class="table table-hover" id="board">
					    <tr>
					      <th>번호</th>
					      <th>답변상태</th>
					      <th>카테고리</th>
					      <th>제목</th>
					      <th>작성자</th>
					      <th>작성날짜</th>
					    </tr>
					    
					 <!-- index에 접근하여 중첩 for문을 사용하기 위해 스크립틀릿 이용 -->
					 <% if(list!=null){ %>
					 <%! int index = 1; %>
					    <% for(int i = 0 ; i<list.size() ; i++){ %>
					    	<%if(list.get(i).getServiceLevel()==1){ %>
					    		<tr>
								      <td><%= index++ %></td>
								      <td><%= list.get(i).getServiceStatus() %></td>
								      <td>
									      <% if(list.get(i).getCategory() == 1){ %>
									   		   신고
									      <%} %>
									      <% if(list.get(i).getCategory() == 2){ %>
									   		   이용
									      <%} %>
									      <% if(list.get(i).getCategory() == 3){ %>
									   		   결제
									      <%} %>
									      <% if(list.get(i).getCategory() == 4){ %>
									   		   기타
									      <%} %>
								      </td>
								      <td>
									      <a href="${ pageContext.request.contextPath }/serviceDetail.do?no=<%= list.get(i).getNo()%>">
									      <%= list.get(i).getServiceTitle() %>
								      </a>
								      </td>
								      <td><%= list.get(i).getMemberId() %></td>
								      <td><fmt:formatDate value="<%= list.get(i).getServiceDate() %>" pattern="yy/MM/dd"/></td>
								</tr>
								<%} %>
					    	<% for(int j = 0 ; j<list.size();j++){ %>
					    		<% if(list.get(i).getNo() == list.get(j).getReplyNo()){ %>
									<tr>
										<td>#</td>
										<td>#</td>
										<td>#</td>
										<td>
									    <a href="${ pageContext.request.contextPath }/serviceDetail.do?no=<%= list.get(j).getNo()%>">
									      └ 답변 : <%= list.get(i).getServiceTitle() %>
									    </a>
									    </td>
									    <td>관리자</td>
									    <td><fmt:formatDate value="<%= list.get(i).getServiceDate() %>" pattern="yy/MM/dd"/></td>
									</tr>
								<%} %>
							<%} %>
					    <%} %>
							<% index = 1; %>
					  <%} %>
				</table>
			</div>	
				
				
				
				<!-- 페이징처리 -->			
			<%-- 	<div class="container2 text-center">
					<div id="paging">
						<c:if test="${paging.prev }">
							<a href="${paging.startPage -1 }"> [이전] </a>
						</c:if>
						
						<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
							&nbsp; <a href="${pageContext.request.contextPath}/servicecenter.do?pageNum=${num }">${num }</a> &nbsp;
						</c:forEach>
						
						<c:if test="${paging.next }">
							<a id="next" href="${paging.endPage + 1 }"> [다음] </a>
						</c:if>
						
					</div>
					
					
					<form id="pagingForm" name="pagingForm" action="list.do" method="post">
						<input type="hidden" id="pageNum" name="pageNum" value="${paging.cri.pageNum }" >
						<input type="hidden" id="amount" name="amount" value="${paging.cri.amount }" >
					</form>
				</div> --%>
				




</div> 
</c:if>








<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
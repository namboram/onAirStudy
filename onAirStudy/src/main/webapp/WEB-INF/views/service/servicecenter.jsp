<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script>

function selectCategory(category) {
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
			const memberid = isLogined() ? isLogined() : false;
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
});
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
	<div class="row" style="margin-left:15%;" >
		<div class="m-5" >
		
			<h3 class="text-center">서비스별 질문</h3>
			<hr style="border:2px solid rgb(247, 235, 229);">
				<ul class="row" style="list-style:none; ">
				<li>
					<div class="mx-auto d-block p-5">
					<a href="#" onclick="selectCategory(1)">
						<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/warning.png" width="60px">
						</a><br><h4 class="text-center" style="margin-top:20%; color=black; cursor:pointer;" onclick="selectCategory(1)">신고</h4>	
					</div></li>
				<li>
					<div class="mx-auto d-block p-5">
					<a href="#" onclick="selectCategory(2)">
						<img class="mx-auto" src="${pageContext.request.contextPath }/resources/images/message.png" width="60px">
						</a><br><br><h4 class="text-center" style="margin-top:20%; color=black; cursor:pointer;" onclick="selectCategory(2)">이용</h4>
					</div>
				</li>
				<li>
					<div class="mx-auto d-block p-5">
					<a href="#" onclick="selectCategory(3)">
						<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/hand.png" width="60px"></a>
						<br><h4 class="text-center" style="margin-top:20%; color=black; cursor:pointer;" onclick="selectCategory(3)">결제</h4>	
					
					</div>
				</li>
				<li>
					<div class="mx-auto d-block p-5">
					<a href="#" onclick="selectCategory(4)">	
						<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/etc.png" width="60px"></a>
						<br><h4 class="text-center" style="margin-top:20%;  color=black; cursor:pointer;" onclick="selectCategory(4)">기타</h4></div>	
				</li>
				
				</ul>
				<hr style="border:2px solid rgb(247, 235, 229);">
		</div>
			
				
	<!-- 자주묻는 질문 -->
	<div class="m-5">
		<h3 class="text-center">자주하는 질문</h3>
		
	 <div class="bs-example" >
		    <div class="accordion" id="accordionExample">	        
		       
		       <c:forEach items="${ serviceContentList }" var="sc" varStatus="status">      
			        <div class="card">
			            <div class="card-header">
			                <h2 class="mb-2 text-center" style="width:300px; ">
			                    <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapseOne${status.index}">${ sc.title }</button>									
			                </h2>
			            </div>
			            <div id="collapseOne${status.index}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
			                <div class="card-body">
			                    <p>${ sc.content }</p>
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
	<form name="form1">
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
			
	</form>
			

        
     
        <div class="float-right" >
			<input type="checkbox" id="chk" name="chk">내가 작성한글 보기</input>
			<input type="hidden" id="member_id" name="member_id" value="${memberId}" />
		</div>
		
		
					  
					<table class="table table-hover" id="board">
					    <tr>
					      <th>번호</th>
					      <th>답변상태</th>
					      <th>카테고리</th>
					      <th>제목</th>
					      <th>작성자</th>
					      <th>작성날짜</th>
					    </tr>
					    
					      <c:if test="${ serviceList != null }">
						    <c:forEach items="${ serviceList }" var="s" >
						    <tr>
							      <td>${ s.no }</td>
							      <td>${ s.serviceStatus }</td>
							      <td>${ s.category }</td>
							      <td>
							      <a href="${ pageContext.request.contextPath }/serviceDetail.do?no=${ s.no }">${ s.serviceTitle }</a></td>
							      <td>${ s.memberId }</td>
							      <td><fmt:formatDate value="${ s.serviceDate }" pattern="yy/MM/dd"/></td>
							</tr>
						    </c:forEach>
					    </c:if>
				</table>	
				
				
				
				
				<!-- 페이징처리 -->			
				<div class="container">
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
				</div>
				
				




</div> 




<script>/* 
	$(document).ready(function() {
		$("paging a").click(function(e) {
			e.preventdefault();
			$("#pageNum").val($(this).attr("href"));
			pagingForm.submit();
		})		
	})
 */
</script>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



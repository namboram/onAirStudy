<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<!-- css -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/adminCommon.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<script>
$(document).ready(function(){
	console.log($("#reportLiB"));
	$("#reportLiB a").css("background-color", "#C9C7D1").css("font-weight", "bold").css("color", "white");
})
</script>

<div class="row">
	
	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>
	
	
	<div class="col-lg-10 adDivB p-0">
	
	<div style="padding:5%;">
	
		<div style="margin: 50px;">
			<form id="reportListFrm"
				action="${ pageContext.request.contextPath }/admin/reportList.do"
				method="get">
				<select class="custom-select" name="searchType" id="searchTypeB">
					<option value="">피신고자</option>
				</select>
				<input type="text" name="searchKeyword" value="${ searchKeyword }" placeholder="아이디" />

				<button type="button" class="btn btn-info" onclick="searchNow();">검색</button>
			</form>
		</div>


		<table class="table tableB">
			<tr>
				<th>신고번호</th>
				<th>신고루트</th>
				<th>카테고리</th>
				<th>신고자</th>
				<th>피신고자</th>
				<th>신고일</th>
				<th>유효(Y/N)</th>
			</tr>

			<c:if test="${ not empty list }">
				<c:forEach items="${ list }" var="r">
					<tr>
						<td>${ r.no }</td>
						<td>${ r.category }</td>
						<c:if test="${ r.CONTENT_CATEGORY ==  'R' }">
							<td><a href="${ pageContext.request.contextPath }/admin/studyDetail.do?no=${ r.CONTENT_ID }">방신고</a></td>
						</c:if>
						<c:if test="${ r.CONTENT_CATEGORY ==  'C' }">
							<td><a href="#" onclick="showModal('${r.CONTENT_CATEGORY}', ${ r.no });">채팅</a></td>
						</c:if>
						<c:if test="${ r.CONTENT_CATEGORY ==  'M' }">
							<td><a href="#" onclick="showModal('${r.CONTENT_CATEGORY}', ${ r.no });">쪽지</a></td>
						</c:if>
						<td><a
							href="${ pageContext.request.contextPath }/admin/memberDetail.do?mid=${ r.REPORTER }">${ r.REPORTER }</a></td>
						<td><a
							href="${ pageContext.request.contextPath }/admin/memberDetail.do?mid=${ r.REPORTED_MEMBER }">${ r.REPORTED_MEMBER }</a></td>
						<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${ r.REPORTED_DATE  }" /></td>
						<td>
						<c:if test="${ r.VAILD_YN == 'Y' }">
						<button type="button" class="btn btn-light" onclick="updateR(${ r.no });">${ r.VAILD_YN }</button>
						</c:if>
						<c:if test="${ r.VAILD_YN == 'N' }">
						<button type="button" class="btn btn-light">${ r.VAILD_YN }</button>
						</c:if>
						
						</td>
					</tr>
				</c:forEach>
			</c:if>

		</table>

		<div id='pageBar'>
			${ pageBar }
		</div>


		<!-- Modal -->
		<div class="modal fade" id="modalUpB" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">채팅내용</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<table class="table" id="changeSubjectB">




						</table>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	</div>


<script>

	function searchNow(){
		
		$("#reportListFrm").submit();	
	}

	//검색유지
	$(document).ready(function(){

		if(${ searchContent != null } )
			$("[name=searchKeyword]").val(${ searchKeyword });
		
	});

	function showModal(category, no){

			var html = "";
			var title = $("#exampleModalLabel");
			title.html("");

			$.ajax({
				url:"${ pageContext.request.contextPath }/admin/showModal.do",
				data : "category="+category+"&no="+no,
				success:function(data){
					console.log(data);


					//채팅일때
					if(category == "C"){
	
						html = "<tr><th>방번호</th>"
							+ "<td>"+data.SR_NO+"</td></tr>" 
							+ "<tr><th>발신인</th>"
							+ "<td>"+data.MEMBER_ID+"/<td></tr>"
							+ "<tr><th>내용</th>"
							+ "<td>"+data.CHAT_CONTENT+"</td></tr>"
							+ "<tr><th>발신일</th>"
							+ "<td>"+data.SEND_DATE+"</td></tr>";

							title.html("채팅내용");
						
					}
					//쪽지일때
					else{

						html = "<tr><th>발신인</th>"
							+ "<td>"+data.SENDER_ID+"/<td></tr>"
							+ "<tr><th>수신인</th>"
							+ "<td>"+data.RECEIVER_ID+"/<td></tr>"
							+ "<tr><th>내용</th>"
							+ "<td>"+data.MSG_CONTENT+"</td></tr>"
							+ "<tr><th>발신일</th>"
							+ "<td>"+data.SEND_DATE+"</td></tr>";

							title.html("쪽지내용");
					}

					
					
				},
				error:function(){
					html= "<tr><td><h3>해당 정보가 없습니다.</h3><td></tr>";

				},
				complete:function(){

					$("#changeSubjectB").empty();
					$("#changeSubjectB").append(html);
					$("#modalUpB").modal("show");

					
				}
				
			});
		}

	function updateR(no){

		var loc = "${ pageContext.request.contextPath }/admin/updateReport.do?no="+no;
		var searchKeyword = $("[name=searchKeyword]");	

		//검색어저장
		if(searchKeyword.val() != "" && searchKeyword.val()!=null)
			loc += "&searchKeyword="+searchKeyword.val();
				
		
		if(confirm(no+"번 신고내역을 무효처리 하시겠습니까? 적용 시 복구할 수 없습니다."))
			location.href = loc;
	}
		

</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>





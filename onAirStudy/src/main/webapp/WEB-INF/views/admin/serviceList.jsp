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
	console.log($("#serviceLiB"));
	$("#serviceLiB a").css("background-color", "#C9C7D1").css("font-weight", "bold").css("color", "white");
})
</script>

<div class="row">

	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>
	
	<div class="col-lg-10 adDivB p-0">
		<div style="padding:5%;">
		
		<div style="margin: 50px;">
		
			<form id="serviceSearchB" action="${ pageContext.request.contextPath }/admin/serviceList.do" method="post">
			<select class="custom-select" name="searchType" id="searchTypeB">
				<option value="memberId" >작성자</option>
				<option value="category" >카테고리</option>
				<option value="status" >답변상태</option>
			</select>
			<div id="hide1B" style="display:inline-block">
				<input type="text" name="searchKeyword"  value=""/>
				<button type="button" class="btn btn-info" onclick="searchNow();">검색</button>
			</div>
			<div id="hide2B" style="display:none;">
				<select class="custom-select" name="searchKeyword">
					<option value="none" selected disabled>선택</option>
					<option value="1">신고</option>
					<option value="2">이용</option>
					<option value="3">결제</option>
					<option value="4">기타</option>
				</select>
			</div>
			<div id="hide3B" style="display:none;">
				<input type="radio" name="searchKeyword" value="답변대기" />답변대기
				<input type="radio" name="searchKeyword" value="답변완료"/>답변완료
			</div>
			</form>
		</div>
		
		
		
		<table class="table tableB">
			
		<tr>
		<th>문의번호</th>
		<th>답변상태</th>
		<th>카테고리</th>
		<th>문의제목</th>
		<th>문의한 아이디</th>
		<th>문의 날짜</th>
		</tr>
		
		<c:if test="${ not empty list }">
		<c:forEach items="${ list }" var="s">
			<tr>
				<td>${ s.NO }</td>
				<td>${ s.SERVICE_STATUS}</td>
				<td>${ s.cate }</td>
				<td><a href="${ pageContext.request.contextPath }/admin/serviceDetail.do?no=${s.NO}">${ s.SERVICE_TITLE }</a></td>
				<td>${ s.MEMBER_ID }</td>
				<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${ s.SERVICE_DATE }"/></td>
			</tr>
		</c:forEach> 
		</c:if>
	
		
		</table>
		
		<div id='pageBar'>
			${ pageBar }
		</div>
		
	</div>
	
</div>	

<script>

	var a = $("#hide1B");
	var b = $("#hide2B");
	var c = $("#hide3B");

	$(document).ready(function() {
		$("#searchTypeB").change(function() {
			var st = $("#searchTypeB option:selected").val();
			console.log(st);

			$("#hide1B input").val("");

			if (st == "memberId") {
				console.log("아이디");
				a.css("display", "inline-block");
				b.css("display", "none");
				c.css("display", "none");
			} else if (st == "category") {
				console.log("카테고리");
				a.css("display", "none");
				b.css("display", "inline-block");
				c.css("display", "none");
			} else {
				console.log("답변유무");
				a.css("display", "none");
				b.css("display", "none");
				c.css("display", "inline-block");
			}

		});

	});

	function searchNow() {
		console.log($("[name=searchType]"))
		$("#serviceSearchB").submit();
	}

	$(document).ready(function() {
		$("#hide2B select").change(function() {
			$("[name=searchKeyword]").val($("#hide2B option:selected").val());
			searchNow();
		});
	});

	$(document).ready(function() {
		$("#hide3B input").change(function() {
			$("[name=searchKeyword]").val($("#hide3B input:checked").val());
			searchNow();
		});
	});

	var searchType = "<c:out value="${search['searchType']}"/>";
	var searchKeyword = "<c:out value="${search['searchKeyword']}"/>";

	//검색유지
	$(document).ready(
			function() {
				if (searchType != "" && searchKeyword != "") {
					if (searchType == 'memberId') {
						$("#hide1B input").val(searchKeyword);
					} else if (searchType == 'category') {
						a.css("display", "none");
						b.css("display", "inline-block");
						$('#hide2B ption:eq()').prop('selected', true);
					} else if (searchType == 'status') {
						a.css("display", "none");
						c.css("display", "inline-block");
						$('#hide3B [name=searchKeyword]:radio[value='+ searchKeyword + ']').prop('checked', true);
					}
					$('[name=searchType]').val(searchType).prop('selected',
							true);
				}
			});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


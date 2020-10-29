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
	console.log($("#studyLiB"));
	$("#studyLiB a").css("background-color", "#C9C7D1").css("font-weight", "bold").css("color", "white");
})
</script>

<div class="row">
	
	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>
	
	
	<div class="col-lg-10 adDivB p-0">
	<div style="padding:5%;">
		<div style="margin: 50px;">
			<form id="studySearchB" action="${ pageContext.request.contextPath }/admin/studyList.do" method="post">
			<select class="custom-select" name="searchType" id="searchTypeB">
				<option value="srNo" >방번호</option>
				<option value="memberId" >방장아이디</option>
				<option value="srSort" >방종류</option>
			</select>
			<div id="hide1B" style="display:inline-block">
				<input type="text" name="searchKeyword"  value=""/>
				<button type="button" class="btn btn-info" onclick="searchNow();">검색</button>
			</div>
			<div id="hide2B" style="display:none;">
				<input type="radio" name="searchKeyword" value="N" />기본방
				<input type="radio" name="searchKeyword" value="P"/>프리미엄방
			</div>
			</form>
		</div>
			
			<table class="table tableB">
				
			<tr>
			<th>방번호</th>
			<th>카테고리</th>
			<th>방장아이디</th>
			<th>방제목</th>
			<th>생성날짜</th>
			<th>방종류</th>
			</tr>
			
			<c:if test="${ not empty list }">
			<c:forEach items="${ list }" var="s">
				<tr>
					<td>${ s.SR_NO }</td>
					<td>${ s.CATEGORY }</td>
					<td><a href="${ pageContext.request.contextPath }/admin/memberDetail.do?mid=${s.MEMBER_ID}">${ s.MEMBER_ID }</a></td>
					<td><a href="${ pageContext.request.contextPath }/admin/studyDetail.do?no=${s.SR_NO}">${ s.SR_TITLE }</a></td>
					<td>${ s.SR_ENROLL_DATE }</td>
					<td>${ s.SR_SORT }</td>
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

	$(document).ready(function() {
		$("#searchTypeB").change(function() {
			var st = $("#searchTypeB option:selected").val();
			console.log(st);

			$("#hide1B input").val("");

			if (st == "srNo" || st == "memberId") {
				console.log("방번호/아이디");
				a.css("display", "inline-block");
				b.css("display", "none");
			} else {
				console.log("방상태");
				a.css("display", "none");
				b.css("display", "inline-block");
			}
		});
	});


	
	function searchNow() {
		console.log($("[name=searchType]").val());
		console.log($("#studySearchB input:checked").val());
		$("#studySearchB").submit();
	}


	
	$(document).ready(function() {
		$("#hide2B input").change(function() {
			searchNow();
		});
	});


	
	var searchType = "<c:out value="${search['searchType']}"/>";
	var searchKeyword = "<c:out value="${search['searchKeyword']}"/>";


	
	//검색유지
	$(document).ready(
			function() {
				if (searchType != "" && searchKeyword != "") {
					if (searchType == 'memberId' || searchType == 'srNo') {
						$("#hide1B input").val(searchKeyword);
					} else if (searchType == 'srSort') {
						a.css("display", "none");
						b.css("display", "inline-block");
						$('#hide2B [name=searchKeyword]:radio[value='+ searchKeyword + ']').prop('checked',true);
					}
					$('[name=searchType]').val(searchType).prop('selected',true);
				}
			});
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>




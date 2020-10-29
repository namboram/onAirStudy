<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<!-- css -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/adminCommon.css" />

<style>
	#memberTableB{
		width:100%;
		text-align:center;
	}
	#memberTableB td{
		width:150px;
	}
	#searchTypeBB{
		width:200px;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<script>
$(document).ready(function(){
	console.log($("#memberLiB"));
	$("#memberLiB a").css("background-color", "#C9C7D1").css("font-weight", "bold").css("color", "white");
})
</script>


<div class="row">

	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>

	<div class="col-lg-10 adDivB p-0">
	<div style="padding:5%;">
		<div style="margin: 50px;">
			<form id="memberListFrm"
				action="${ pageContext.request.contextPath }/admin/memberList.do"
				method="post">
				<select class="custom-select" name="searchType" id="searchTypeBB">
					<option value="memberId">아이디</option>
					<option value="blacklist">블랙리스트 여부</option>
				</select>

				<div id="hide1B" style="display: inline-block">
					<input type="text" name="searchKeyword" />
					<button type="button" class="btn btn-info" onclick="searchNow();">검색</button>
				</div>
				<div id="hide2B" style="display: none;">
					<select class="custom-select" name="searchContent">
						<option value="none" selected disabled>선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</div>
			</form>
		</div>

		<table class="table tableB">

			<tr>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>결제 여부</th>
				<th>블랙리스트 여부</th>
			</tr>

			<c:if test="${ not empty list }">
				<c:forEach items="${ list }" var="m">
					<tr>
						<td><a
							href="${ pageContext.request.contextPath }/admin/memberDetail.do?mid=${m.memberId}">${ m.memberId }</a></td>
						<td>${ m.memberName }</td>
						<td>${ m.memberRole == 'P'? '프리미엄' : m.memberRole == 'A'? '관리자': '일반' }</td>
						<td>${ m.blacklist }</td>
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

	var value = "";
	$(document).ready(function() {
		$("#searchTypeBB").change(function() {
			console.log("??");
			value = $(this).children("option:selected").val();

			$("#hide1B input").val("");

			if (value == "blacklist") {
				$("#hide1B").css("display", "none");
				$("#hide2B").css("display", "inline-block");
				return;
			}
			$("#hide2B").css("display", "none");
			$("#hide1B").css("display", "inline-block");

		});
	});

	function searchNow() {
		$("#memberListFrm").submit();

	}

	$(document).ready(function() {
		$("#hide2B select").change(function() {
			$("[name=searchKeyword]").val($("#hide2B option:selected").val());
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
					} else if (searchType == 'blacklist') {
						$("#hide1B").css("display", "none");
						$("#hide2B").css("display", "inline-block");
						$("#hide2B option[value="+searchKeyword+"]").prop('selected', true);
					}
					$('[name=searchType]').val(searchType).prop('selected',
							true);
				}
			});
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
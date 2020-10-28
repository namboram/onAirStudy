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
	.adDivB button{
		text-align:right;
		margin-top:50px;
	}
	#contdB{
		text-align:center;
		padding-top:50px;
		height: 300px;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<script>
$(document).ready(function(){
	console.log($("#serviceLiB"));
	$("#serviceLiB a").css("background-color", "#C9C7D1").css("font-weight", "bold").css("color", "white");
})
</script>


<div class="row">

	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp" />
	</div>

	<div class="col-lg-10 adDivB p-0">
	<div style="padding:5%;">

		<h3>문의 상세보기</h3>
		<table class="table tableB">
			<tr>
				<th>번호</th>
				<td>${ sv.NO }</td>
				<th>카테고리</th>
				<td>${ sv.cate }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${ sv.SERVICE_TITLE }</td>
				<th>아이디</th>
				<td>${ sv.MEMBER_ID }</td>
			</tr>
			<tr>
				<td colspan="4" id="contdB">${ sv.SERVICE_CONTENT }</td>
			</tr>
		</table>
		<br />

		<h3>답변하기</h3>
		<form id="insertService"
			action="${ pageContext.request.contextPath }/admin/insertService.do"
			method="post">
			<c:if test="${ not empty av }">
				<input type="text" name="serviceContent"
					value="${ av.SERVICE_CONTENT }" disabled />
			</c:if>
			<c:if test="${ empty av }">
				<input type="text" name="serviceContent" value=""
					placeholder="답변을 등록해주세요." />
				<input type="hidden" name="category" value="${ sv.CATEGORY }" />
				<input type="hidden" name="serviceStatus" value="답변완료" />
				<input type="hidden" name="serviceTitle" value="답변" />
				<input type="hidden" name="replyNo" value="${ sv.NO }" />
				<input type="hidden" name="serviceLevel" value="2" />
				<input type="hidden" name="memberId" value="${ sv.MEMBER_ID }" />
				<br />
				<button type="button" class="btn btn-info">등록하기</button>
			</c:if>
		</form>
	</div>

</div>


<script>
	$(document).ready(function() {
		$("#insertService button").click(function() {
			if ($("#serviceContent").val() == "") {
				alert("내용을 입력하세요");
				return;
			}

			if (confirm("답변을 등록하시겠습니까?"))
				$("#insertService").submit();

		})
	});
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>
<style>
	#adDivB{
		width:calc(100%-270px);
		display:inline-block;
		height:100%;
		background-color:#e8f4ff;
		padding:50px;
	}
	#memberTableB{
		width:100%;
		text-align:center;
	}
	#memberTableB td{
		width:150px;
	}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="row">
	<div class="col-lg-2">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/>
	</div>

	<div class="col-lg-10">
		
		<div style="margin:50px;">
		<form id="memberListFrm" method="post">
			<select name="serchType" id="serchType">
				<option value="memberId">아이디</option>
				<option value="blacklist">블랙리스트 여부</option>
			</select>
			
			<div id="hideB1">
			<input type="text"/>
			<button type="submit" onclick="gogo();">검색</button>
			</div>
			<div id="hideB2" style="display:none;">
			<input type="radio" name="seatchContent"/>
			<label for="Y">Y</label>
			<input type="radio" name="seatchContent"/>
			<label for="N">N</label>
			</div>
		</form>
		</div>
	
	<table class="table" id="memberTableB">
		
		<tr>
		<th>회원 아이디</th>
		<th>회원 이름</th>
		<th>결제 여부</th>
		<th>블랙리스트 여부</th>
		</tr>
		
		<c:if test="${ not empty list }">
		<c:forEach items="${ list }" var="m">
			<tr>
				<td><a href="${ pageContext.request.contextPath }/admin/memberDetail.do?mid=${m.memberId}">${ m.memberId }</a></td>
				<td>${ m.memberName }</td>
				<td>${ m.memberRole == 'P'? '프리미엄' : m.memberRole == 'A'? '관리자': '일반' }</td>
				<td>${ m.blacklist }</td>
			</tr>
		</c:forEach> 
		</c:if>
		
	</table>
	
	
	</div>
</div>



<script>

		var value = "";
	$(document).ready(function(){
		$("#serchType").change(function(){
			value = $(this).children("option:selected").val();
			if(value=="blacklist"){
				$("#hideB1").css("display", "none");
				$("#hideB2").css("display", "block");
				return;
			}
				$("#hideB2").css("display", "none");
				$("#hideB1").css("display", "block");

		});
	});

	function gogo(){
		

	}
	

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@page import="com.kh.onairstudy.servicecenter.model.vo.ServiceCenter"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script>

	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#serviceForm").submit();
	});


	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		
		location.href="${pageContext.request.contextPath}/servicecenter.do";
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


	<article>

		<div class="container" role="main">
			<h2>문의글 작성</h2>
			<br>
			<form name="serviceForm" id="serviceForm" role="form" method="post" action="${pageContext.request.contextPath}/service/insertService.do">

				<div class="mb-3">
					<label for="category">카테고리</label>
					<select name="category">
						<option value="0" selected>선택없음</option>
						<option value="1" >신고문의</option>
						<option value="2" >이용문의</option>
						<option value="3" >결제문의</option>
						<option value="4" >기타</option>
					</select>
				</div>
				
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="serviceTitle" id="serviceIitle" placeholder="제목을 입력해 주세요">
				</div>
				<!-- <div class="mb-3">
					<label for="memberId">작성자</label>
					<input type="text" class="form-control" name="memberId" id="memberId" placeholder="이름을 입력해 주세요">
					  <input type="MEMBER_ID" class="form-control" id="memberId" name="memberId" value=""  readonly>
				</div> -->
				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="10" name="serviceContent" id="serviceContent" placeholder="내용을 입력해 주세요" ></textarea>
				</div>


			</form>

			<div class="text-center m-5" >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-light" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>




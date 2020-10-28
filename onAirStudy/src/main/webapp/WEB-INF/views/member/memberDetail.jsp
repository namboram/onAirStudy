<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
div#update-container{width:400px; margin:0 auto; text-align:center;}
div#update-container input, div#update-container select {margin-bottom:10px;}
</style>
<div id="update-container">
	<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
		<input type="text" class="form-control" placeholder="아이디" name="memberId" id="memberId" readonly value="${ loginMember.memberId }"  readonly/>
		<input type="text" class="form-control" placeholder="비밀번호" name="password" id="password_" value="${ loginMember.password }" required />
		<input type="date" class="form-control" placeholder="비밀번호체크" name="passwordCheck" id="passwordCheck_" value="${ loginMember.password }"  />
				<input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" value="${ loginMember.memberName }" required />
		<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="${ loginMember.phone }" required />
		<input type="text" class="form-control" placeholder="자기소개" name="comment" id="comment" value="${ loginMember.comment }" />
		
		<input type="text" class="form-control" placeholder="성실포인트" name="diligentPoint" id="diligentPoint" value="${ loginMember.diligentPoint }" />
		<input type="text" class="form-control" placeholder="블랙리스트" name="blacklist" id="blacklist" value="${ loginMember.blacklist }" />
		<br />
		<input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
		<input type="reset" class="btn btn-outline-success" value="취소">
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

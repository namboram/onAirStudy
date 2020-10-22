<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 한글 깨짐 방지 --%>
<%-- <fmt:requestEncoding value="utf-8" /> --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
#containerMsgK {
	background-color: #F9F1ED;
}

#contentMsgK {
	background-color: white;
}
</style>
<div class="row">
	<jsp:include page="/WEB-INF/views/mypage1/mypageSideBar.jsp"></jsp:include>
	<!-- 차트 링크 -->
	<!-- 	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
	<div class="col-sm" id="containerMsgK">
		<h1>쪽지함</h1>
		<div class="row mb-3">
		<div class="offset-sm-10">
			<button type="button" class="btn btn-secondary" onclick="">답장하기</button>
			<button type="button" class="btn btn-secondary" onclick="" >삭제</button>
			<button type="button" class="btn btn-secondary" >신고</button>
		</div>
		</div>
		<div id="contentMsgK">
			<p class="text-right"><fmt:formatDate value="${message.sendDate }" pattern="yy/MM/dd HH:mm:ss" /></p>
			<h5>보낸 사람 : ${message.senderId}</h5>
			<h5>받는 사람 : ${message.receiverId }</h5>
			<hr />
			<div class="text-center">
			${message.msgContent}
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>

</script>

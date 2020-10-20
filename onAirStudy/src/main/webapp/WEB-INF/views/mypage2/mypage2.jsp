<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="row">	
<jsp:include page="/WEB-INF/views/mypage2/studyRoomSideBar.jsp"></jsp:include>
<div class="col-lg-10">
<jsp:include page="/WEB-INF/views/mypage2/chatting.jsp"></jsp:include>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


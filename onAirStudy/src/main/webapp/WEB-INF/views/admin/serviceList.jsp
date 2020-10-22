<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%-- <jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp"/> --%>
<style>
	#adDivB{
		/* width:calc(100%-270px); */
		display:inline-block;
		height:100%;
		background-color:skyblue;
	}
</style>
<div id="adDivB col-lg-10">
	
	<form id="serviceSerch" method="post">
	<input type="text"/>
	<button type="submit">검색</button>
	</form>
	<table class="table">
		


	
	</table>
	
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
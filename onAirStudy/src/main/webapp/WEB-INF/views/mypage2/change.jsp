<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>
<script src="${pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script>

    // 페이지 전환
	function change(){
    $(".change").load("${pageContext.request.contextPath}/enter/chat.do?roomNo=5");
    
		}

</script>
		<div class="change" style="width : 500px; hegith : 500px;">
			<p>뿡뿡</p>
		<button onclick="change();">아 화면 바꿔여</button>
		</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

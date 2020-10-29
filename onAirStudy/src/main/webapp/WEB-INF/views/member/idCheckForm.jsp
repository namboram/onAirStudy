<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/> <!-- 한글깨짐방지 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />	
</jsp:include>
	<div style="text-align: center"> 
	<h3>* 아이디 중복확인 *</h3> 
	<form method="post" action="idCheckPro.jsp" onsubmit="return blankCheck(this)"> 
	아이디 : <input type="text" name="id" maxlength="10" autofocus> 
	<input type="submit" value="중복확인"> </form> </div> 
	
	<script> 
		function blankCheck(f){ 
			var id=f.id.value; 
			id=id.trim(); 
			if(id.length < 13 || id.length>3 ){ 
				alert("아이디는 4~12로 입력해주십시오."); 
				return false; 
			}
		}
		return true; 
	</script>


		
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
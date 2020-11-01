<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


    <!-- 댓글목록 -->
	<table class="replytable">
	    <tr>
	      <th>아이디</th>
	      <th>댓글내용</th>
	      <th>날짜</th>
	    </tr>

	    <c:forEach items="${ list }" var="diaryReply">
	    <tr>
	      <td>${ diaryReply.memberId }</td>
	      <td>${ diaryReply.replyContent }</td>
	      <td><fmt:formatDate value="${ diaryReply.replyDate }" pattern="yy/MM/dd HH:mm:ss"/></td>
	     <td>
	     	 <c:if test="${loginMember.memberId eq diaryReply.memberId }">
		      	<button 
		      		type="button" 
		      		class="btn"
		      		id="replybtn"
		      		onclick="btnReplyDel('${ diaryReply.no}')">삭제
		      	</button>
	     	</c:if>
	      </td> 
		</tr>
	    </c:forEach>
	</table>
	<form action="${ pageContext.request.contextPath }/diary/deleteReply.do" 
		  id="replyDeleteFrm" 
		  method="POST">
		<input type="hidden" name="no" />
		<input type="hidden" name="diaryNo" />
	</form>

<script>

function btnReplyDel(no){
		if( confirm("정말 삭제하시겠습니까?") == false)
			return;
		var $frm = $("#replyDeleteFrm");

		var diaryNo = ${ param.no };
		
		$frm.find("[name=no]").val(no);
		$frm.find("[name=diaryNo]").val(diaryNo);
		$frm.submit();
	
}


</script>




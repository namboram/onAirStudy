<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
div#diary-container{width:60%; margin:0 auto;text-align:center;}
</style>

    <!-- 댓글목록 -->
	<table class="table">
	    <tr>
	      <th>아이디</th>
	      <th>댓글내용</th>
	      <th>날짜</th>
	 	  <th>삭제</th> 
	    </tr>
	    <c:forEach items="${ list }" var="diaryReply">
	    <tr>
	      <td>${ diaryReply.memberId }</td>
	      <td>${ diaryReply.replyContent }</td>
	      <td><fmt:formatDate value="${ diaryReply.replyDate }" pattern="yy/MM/dd HH:mm:ss"/></td>
	     <td>
	      	<button 
	      		type="button" 
	      		class="btn btn-outline-danger"
	      		onclick="btnReplyDel('${ diaryReply.no }')">삭제</button>
	      </td> 
		</tr>
	    </c:forEach>
	</table>


<script>
function btnReplyDel(no){
	/* if( ${ loginMember.memberId } != ${ diaryReply.memberId }) 
			alert("작성하신 게시글만 삭제 가능합니다.");
		
	else( */
		var Rcheck = confirm("정말 삭제하시겠습니까?");
			if(Rcheck){
				location.href="deleteDiaryReply?no="+no;
			}
	
	
}


</script>




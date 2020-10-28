<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script>

$(document).ready(function(){
    $("#list").on("click",function(){
    	location.href = '${pageContext.request.contextPath}/servicecenter.do'
    })
 
})

function update(no){
	location.href = "${ pageContext.request.contextPath }/serviceUpdate.do?no=${ map.NO }";    
};

function delete(no){
	if(confirm("정말 삭제하시겠습니까?") == false)
		return;
	var $frm = $("#DeleteFrm");
	$frm.find("[name=no]").val(${ map.NO });
	$frm.submit();
};


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


	
	<div>
	<h2 class="text-center">고객센터 상세보기</h2>
		<table class="board_view">
        <colgroup>
            <col width="25%">
            <col width="45%">
            <col width="25%">
            <col width="*">
        </colgroup>
         
        <tbody>
          
            <tr>
                <th>제목</th>
                <td>${map.SERVICE_TITLE}</td>
                <th>카테고리</th>
                <td>${map.CATEGORY }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${map.MEMBER_ID}</td>
                <th>작성시간</th>
                <td><fmt:formatDate value="${ map.SERVICE_DATE}" pattern="yy/MM/dd" /></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    ${map.SERVICE_CONTENT }
                </td>
            </tr>
        </tbody>
        
    </table>

	<div class="text-center">
		<a href="" id="list" class="btn">목록으로</a>
		
		 <c:if test="${map.MEMBER_ID eq loginMember.memberId }"> 		
			<button type="button" class="btn" id="modify" onclick="update()">수정하기</button>
			<button type="button" class="btn" id="delete" onclick="delete()">삭제하기</button>
		</c:if> 
	</div>
	
	<form action="${ pageContext.request.contextPath }/serviceDelete.do" 
		  id="DeleteFrm" 
		  method="POST">
		<input type="hidden" name="no" />
	</form>



</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- 한글 깨짐 방지 --%>
<%-- <fmt:requestEncoding value="utf-8" /> --%>
<style>
#containerMsgK {
	background-color: E8F4FF;
}

#contentMsgK {
	background-color: white;
}
</style>
<div class="col-lg p-0">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
</div>

<div class="row">
	<div class="col-lg-2 p-0">
	<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp" />
	</div>
	<!-- 차트 링크 -->
	<!-- 	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
	<div class="col-lg-10 p-0" id="containerMsgK">
		<h1>${title}</h1>
		<div class="row mb-3">
		
		
		<form action="${pageContext.request.contextPath}/message/searchMessage.do" class="input-group col-sm-5 offset-sm-3" method="post">
		<input type="hidden" name="type" value="${title}"/>
			<div class="input-group-prepend mr-2">
				<select class="custom-select" name="keyword">
					<option selected>검색 유형 선택</option>
					<option value="id">아이디</option>
					<option value="content">내용</option>
				</select>
			</div>
			<input type="text" name="searchContent" class="form-control mr-2"
				aria-label="Text input with dropdown button"/>
			<button type="submit" class="btn btn-secondary" >검색</button>
		</form>
		
		<div class="text-right offset-sm-1">
			<button type="button" class="btn btn-secondary" onclick="receivedMsg();">수신함</button>
			<button type="button" class="btn btn-secondary" onclick="sentMsg();" >발신함</button>
			<button type="button" class="btn btn-secondary" onclick="delMsg();" >삭제</button>
		</div>
		</div>
		<div id="contentMsgK" class="m-5">
			<table class="table text-center">
				<thead>
					<tr >
						<th scope="col">#</th>
						<th scope="col">보낸사람</th>
						<th scope="col">받는사람</th>
						<th scope="col">내용</th>
						<th scope="col">날짜</th>
						<th scope="col">읽음여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${messageList}" var="message" varStatus="status">

						<tr>
							<th scope="row"><input class="form-check-input delCheck" type="checkbox" 
								name="${message.receiverId == loginMember.memberId ? 'receive' : 'send' }" value="${message.no}" >${status.count}</th>
							<td>${message.senderId}</td>
							<td>${message.receiverId}</td>
							
							<c:choose>
								<c:when test="${fn:length(message.msgContent) gt 15}">
									<td><a href="${pageContext.request.contextPath}/message/messageDetail.do?no=${message.no}"><c:out value="${fn:substring(message.msgContent, 0, 15)}"></c:out>...</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="${pageContext.request.contextPath}/message/messageDetail.do?no=${message.no}">${message.msgContent}</a></td>
								</c:otherwise>
							</c:choose>
							<td><fmt:formatDate value="${message.sendDate }"
									pattern="yy/MM/dd HH:mm:ss" /></td>
							<c:if test="${message.readYN eq 'Y'}">
								<td class="text-grey">읽음</td>
							</c:if>
							<c:if test="${message.readYN eq 'N'}">
								<td>안읽음</td>
							</c:if>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
</div>
<div class="col-lg p-0">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>

<script>
function receivedMsg(){

	window.location = "${pageContext.request.contextPath}/message/sendReceiveFilter.do?type=receive";

}
function sentMsg(){

	window.location = "${pageContext.request.contextPath}/message/sendReceiveFilter.do?type=send";
}
function delMsg(){
	var cnt = $(".delCheck:checked").length;
    var rarr = new Array();
    var sarr = new Array();
    var result = 1;
    $(".delCheck:checked").each(function() {
        if($(this).attr("name") == 'receive')
        	rarr.push($(this).val());
        else
            sarr.push($(this).val());
    });
    if(cnt == 0){
        alert("선택된 쪽지가 없습니다.");
    }
    else{
        //console.log(arr);
        var rstr = rarr.join(',');
        var sstr = sarr.join(',');
        console.log(rstr);
        console.log(sstr);
        console.log(sarr.length);
        if(rarr.length > 0){
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/message/delMessageList.do",
            data: {
					arr : rarr,
					type : "receive"
                },
            dataType:"json",
            success: function(data){
               //console.log(data);
                result*data;
            },
            error: function(){alert("서버통신 오류");}
        });
        }
        if(sarr.length > 0){
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/message/delMessageList.do",
            data: {
					arr : sarr,
					type : "send"
                },
            dataType:"json",
            success: function(data){
              result*data;
            },
            error: function(){alert("서버통신 오류");}
        });
       }
    }
    if(result > 0){
		alert("삭제가 완료되었습니다.");
		location.reload();
    }else{
		alert("삭제 실패하였습니다.");
    }
}


</script>

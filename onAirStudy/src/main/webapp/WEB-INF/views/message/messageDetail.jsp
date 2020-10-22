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
	<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">신고하기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<input type="hidden" id="contentIdK" value=""/>
						<div class="form-group">
						<label for="reportCategK">신고 카테고리</label>
						<select class="form-control" id="reportCategK" name="reportCategK">
							<option value="1">음담패설</option>
							<option value="2">부적절한 홍보</option>
							<option value="3">비방 또는 욕설</option>
						</select>
						</div>
						<hr />
						<h5>신고 대상 : <strong id="reportIdK"></strong></h5>
						
						<h5>신고 내용</h5>
						<div id="reportContents">
							
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick="doReport();">신고하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<h1>쪽지함</h1>
		<div class="row mb-3">
		<div class="offset-sm-10">
			<button type="button" class="btn btn-secondary" onclick="">답장하기</button>
			<button type="button" class="btn btn-secondary" onclick="" >삭제</button>
			<button type="button" class="btn btn-secondary reportModalK" >신고</button>
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
//신고 클릭시 모달창 열기
$(document).on("click",".reportModalK",function(){
	$("#myModal").modal('show');
	var content = "${message.msgContent}";
	$("#reportContents").html(content);
	var id = "${message.senderId}";
	$("#reportIdK").html(id);
	//var contentId = $(this).closest("li");
	//$("#contentIdK").val(contentId.attr("data-no"));
	
	
}); 
//신고하기 버튼
function doReport(){
	if(confirm("신고 하시겠습니까?")) {
		$.ajax({
			url : "${pageContext.request.contextPath}/report/insertReport.do",
			type : "POST",
			data :
				{
					contentCategory : "M",
					contentId : "${message.no}",
					reporter : "${loginMember.memberId}",
					reportedMember : "${message.senderId}",
					category : $("#reportCategK").val() 
							
				} ,
			dataType : "json",
			success : function(result) {
				if(result > 0)
					alert("신고가 완료되었습니다.");
			},
			error : function(xhr, status, err) {
				console.log("처리실패!");
				console.log(xhr);
				console.log(status);
				console.log(err);
			}
		});
		
	}
}
</script>

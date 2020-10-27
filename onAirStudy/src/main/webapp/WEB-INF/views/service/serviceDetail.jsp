<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script>

$(document).ready(function(){
    $("#list").on("click",function(e){
        e.preventDefault();
    })
    $("#modify").on("click",function(e){
        e.preventDefault();
      
    })
})


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
	
	<h2>고객센터 상세보기</h2>
		<table class="board_view">
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
         
        <tbody>
            <tr>
                <th>제목</th>
                <td>${map.serviceTitle}</td>
                <th>카테고리</th>
                <td>${map.category }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${map.memberId }</td>
                <th>작성시간</th>
                <td>${map.serviceDate }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    ${map.serviceContent}
                </td>
            </tr>
        </tbody>
    </table>
    
	<a href="#this" id="list" class="btn">목록으로</a>
    <a href="#this" id="modify" class="btn">수정하기</a>
</div>

<!-- 둘러보기 -->
<div class="modal fade" id="previewFrm" role="dialog"
	aria-labelledby="deleteMemoModalTitle" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header" style="color: #E2A182;">
				<h4 class="modal-title">그룹 둘러보기</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<!-- Modal body -->
				<div class="modal-body">
				<div id="intro"></div>
				<div id="leader"></div>
					
				</div>

			<form
				action="${ pageContext.request.contextPath }/studyroom/applystudyroom.do"
				id="applyS" method="POST">
					<input type="text" class="form-control" name="srNo" hidden>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-outline">신청하기</button>
				</div>
			</form>

		</div>
	</div>
</div>

<script>
	function previewR(srNo,leader,title) {
		$("#previewFrm").modal().find("[name=srNo]").val(srNo);

		var content = title+"의 미리 보기 입니다.";
		$("#intro").html(content);
		$("#leader").html(leader);
	}
</script>

<!-- 신청 -->
<div class="modal fade" id="applyRFrm" role="dialog"
	aria-labelledby="deleteMemoModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">스터디 룸 가입 신청</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<form
				action="${ pageContext.request.contextPath }/studyroom/applystudyroom.do"
				name="applyFrm" method="POST">
				<input type="text" class="form-control" name="srNo" id="srNo" hidden>
				<input type="text" class="form-control" name="memberId"
					id="memberId" value="${ loginMember.memberId }" hidden>
				<div class="modal-body">스터디 룸 가입을 신청 하시겠습니까?</div>
				<!-- Modal footer -->

				<div class="modal-footer">
					<button type="submit" class="btn btn-outline">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</form>


		</div>
	</div>
</div>

<script>
	function applyR(srNo) {
		$("#applyRFrm").modal().find("[name=srNo]").val(srNo);
	}
</script>
<!-- 신고 모달 -->
		<div class="modal" id="reportMyModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">신고하기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<input type="hidden" id="contentIdK" value="" />
						<div class="form-group">
							<label for="reportCategK">신고 카테고리</label> <select
								class="form-control" id="reportCategK" name="reportCategK">
								<option value="1">음담패설</option>
								<option value="2">부적절한 홍보</option>
								<option value="3">비방 또는 욕설</option>
							</select>
						</div>
						<hr />
						<h5>
							신고 대상 : <strong id="reportIdK"></strong>
						</h5>

						<h5>신고 내용</h5>
						<div id="reportContents"></div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal"
							onclick="doReport();">신고하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<script>
		//신고 클릭시 모달창 열기
		 function reportR(no,leader,title) {
			$("#reportMyModal").modal('show');
			var content = title+"방의 방장"+leader+"를 신고합니다.";
			$("#reportContents").html(content);
			$("#contentIdK").val(no);
			$("#reportIdK").html(leader);
		};
		//모달 안에 신고하기 버튼
		function doReport() {
			if (confirm("신고 하시겠습니까?")) {
				$.ajax({
							url : "${pageContext.request.contextPath}/report/insertReport.do",
							type : "POST",
							data : {
								contentCategory : "R",
								contentId : $("#contentIdK").val(),
								reporter : "${loginMember.memberId}",
								reportedMember : $("#reportIdK").text(),
								category : $("#reportCategK").val()
							},
							dataType : "json",
							success : function(result) {
								if (result > 0)
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




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/studyRoomList.css">

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

<div class="col-lg p-0 m-0">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>


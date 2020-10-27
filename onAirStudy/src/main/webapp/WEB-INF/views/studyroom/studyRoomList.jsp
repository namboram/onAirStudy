<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/studyRoomList.css">


<div class="studyRoomList" style="margin-bottom: 0;">
	<div class="col-lg-12 p-4 text-center">
	
		<form
			action="${ pageContext.request.contextPath }/studyroom/searchStudyroom.do"
			id="searchRoom" method="POST">
			<div class="row">
			
			<select class="optionFrm" name="search_option " >
			<option value="memberId"
			<c:if test="${map.search_option == 'memberId'}">selected</c:if>
  			 >그룹 리더</option>

        	<option value="sr_title" 
			<c:if test="${map.search_option == 'sr_title'}">selected</c:if>
        	>제목</option>
			
			</select>
				<input type="text" class="searchFrm form-control col-sm-6"
					name="keyword" value="${ map.Keyword }"
					placeholder="어떤 스터디 그룹을 찾으시나요?" required />

				<button type="submit" class="btn btn-light btn-sm" style="margin-top:1%;">검색</button>
			</div>
		</form>
		
		
		<br>
		<c:forEach items="${ sCategory }" var="sCategory">
			<input type="checkbox" name="srCategory" id="srCategory"
				value="${ sCategory.no }" />
			<label for="srCategory">${ sCategory.category }</label>
		</c:forEach>
	</div>

	
	<div class="container" id="container">
	
		<div class="rBtn">
			<button type="button" class="btn btn-outline-primary">
			<a href="${pageContext.request.contextPath }/mypage1/newstudy.do">스터디
				방 만들기</a>
		</button>
	</div>
	<br />
	
		<div class="row" id="srlistG">
			<c:forEach items="${ srList }" var="roomList" varStatus="status">
				 <c:set var="w" value="${(selectW[status.index])}" />
				<div class="col-sm-3" id="srProfile" style="<c:if test="${ roomList.srOpenedYN != 'Y'}">background-color:gray;</c:if>">
				<input type="hidden" name="category" vlaue="${roomList.category}" />
					<div class="sr_pic">
						<img class="roomPic"
							src="${pageContext.request.contextPath }/resources/upload/${ roomList.srPic }">
						<img class="memPic"
							src="${pageContext.request.contextPath }/resources/upload/${ roomList.mPic }">
					</div>
			
					<div class="hBtn" >
						<form
							action="${ pageContext.request.contextPath }/studyroom/favStudyroom.do"
							id="favRoom" method="POST">
							<input type="text" class="form-control" name="srNo"	value="${roomList.srNo }" hidden> 
							<input type="text" class="form-control" name="memberId"	value="${loginMember.memberId }" hidden >
														
							<button type="submit" class="heartBtn" style="<c:if test="${ loginMember.memberId eq w.memberId }">background-color:gray;</c:if>"
							<c:if test="${ loginMember.memberId eq w.memberId }"> disabled </c:if>>
								<img class="heartP"
									src="${pageContext.request.contextPath }/resources/images/heart.png" >
							</button>
							
						</form>
					
					</div>

					<div class="contentR">
						<br>
						<h5 class="text-center">${ roomList.sTitle }</h5>
						<h5 class="text-center">그룹 리더 : ${ roomList.memberId }</h5>

						<h5 id="searchT" class="text-center">${ roomList.srOpenedYN == 'Y' ? "모집중" :  "모집완료"}
						</h5>

						<c:if test="${ roomList.srOpenedYN == 'Y'}">
						<button type="button" class="btn btn-light btn-sm"
							onclick="previewR('${ roomList.srNo }','${roomList.memberId }','${roomList.sTitle }')">둘러보기</button>
						<button type="button" class="btn btn-light btn-sm"
							onclick="applyR('${ roomList.srNo }')">신청하기</button>	
						<button type="button" class="btn btn-danger btn-sm"
							onclick="reportR('${ roomList.srNo }','${roomList.memberId }','${roomList.sTitle }')">신고하기</button>						
						</c:if>
						
					</div>
				</div>
				<br />
			</c:forEach>
		</div>
	</div>
</div>

<!-- <script>
$(':checkbox[name="srCategory"]').on({
    click: function(e) {
        $('#srlistG').eq(':checkbox[name="srCategory"]').val();
    }
});
</script> -->


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

<div class="col-lg p-0 m-0">
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/studyRoomList.css">

<div id="carouselExampleCaptions" class="carousel slide"
	data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleCaptions" data-slide-to="0"
			class="active"></li>
		<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
	</ol>


	<div class="carousel-inner">
		<div class="carousel-item active">
			 <img src="${ pageContext.request.contextPath }/resources/images/onlinestudy.jpg" class="d-block w-50" style="margin-left:640px;" >
			<div class="carousel-caption" id="caption1">
				<p>Welcome</p>
				<h2>onAirStudy 가</h2>
				<h2>&nbsp;&nbsp;처음이신가요?</h2>
				<button class="btn my-2 my-sm-5" type="button"
					onclick="location.href='${ pageContext.request.contextPath }/#';">이용방법 안내</button>
			</div>
		</div>
		
		
		<div class="carousel-item">
			<img src="${ pageContext.request.contextPath }/resources/images/team.png" class="d-block w-50" style="margin-left:200px;" >
			<div class="carousel-caption" id="caption2">
				<h2><strong style="color:#505050;">프리미엄 가입</strong>하면</h2>
				<h3>실시간 채팅이?</h3>
				<br>
				<img src="${ pageContext.request.contextPath }/resources/images/chat-bubble.png" width="80px">
				<br>
				<button class="btn my-2 my-sm-5" type="button"
					onclick="location.href='${ pageContext.request.contextPath }/premium.do';">프리미엄 혜택보기</button>
			</div>
		</div>
		
		
		<div class="carousel-item">
		<img src="${ pageContext.request.contextPath }/resources/images/test2.png" class="d-block w-50" style="margin-left:200px;" >
			<div class="carousel-caption" id="caption3">
				<h2><strong style="color:#505050;">프리미엄 가입</strong>하면</h2>
				<h2>온라인 TEST</h2>
				<h3>멤버들이 작성한 <strong style="color:#505050;">문제풀기</strong> + <strong style="color:#505050;">채점</strong>까지 ?</h3>
				<button class="btn my-2 my-sm-5" type="button"
					onclick="location.href='${ pageContext.request.contextPath }/premium.do';">프리미엄 혜택보기</button>
			</div>
	</div>
	</div>


	<a class="carousel-control-prev" href="#carouselExampleCaptions"
		role="button" data-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>





<!-- 어떤점이 좋나요? -->
	<div class="container">
		<h1 class="text-left" style="color: rgb(255, 195, 163)">
			<strong>onAir Study</strong>
		</h1>
		<h2>어떤 점이 좋나요?</h2>
		<br>
	
		<div class="row">
			<div class="col-md-4">
				<img class="mx-auto d-block"
					src="${pageContext.request.contextPath }/resources/images/online.png"
					width="100px">
				<h3 class="text-center">온라인상의 STUDY</h3>
				<br>
				<h5>
					코로나로 인해 만나기 어려울 때, <strong>온라인에서 스터디원 모집 및 진행에 필요한 서비스 제공</strong>
				</h5>
	
			</div>
			<div class="col-md-4">
				<img class="mx-auto d-block"
					src="${pageContext.request.contextPath }/resources/images/study.png"
					width="100px">
				<h3 class="text-center">다양한 카테고리의 스터디 그룹</h3>
				<br>
				<h5>
					<strong>자격증, 면접, 컴퓨터/IT등 다양한 카테고리</strong>로 분류되어 자신의 목표에 맞는 그룹 찾기 가능
				</h5>
			</div>
			<div class="col-md-4">
				<img class="mx-auto d-block"
					src="${pageContext.request.contextPath }/resources/images/rank.png"
					width="100px">
				<h3 class="text-center">개인/팀별로 경쟁심 자극</h3>
				<br>
				<h5>
					자신 혹은 그룹의 <strong>출석 및 랭킹</strong>을 실시간으로 확인하면서 공부효율 높일수 있는 서비스
				</h5>
			</div>
		</div>
	</div>
	<br>



<!-- 이달의 성실멤버 -->
	<div class="container-fluid" style="background-color: #F2EDEA; height:850px; " >
		<br>
		<h3 class="text-center">
		<img src="${pageContext.request.contextPath }/resources/images/badge2.png" width=50px;>
			이달의 성실 멤버
		<img src="${pageContext.request.contextPath }/resources/images/badge2.png" width=50px;>
			</h3>
		<br>
			<div class="container">
			<div class="row" id="srlistG">
					
				<c:forEach items="${ dm_List }" var="dm" end="9">
					<div class="m-2 p-5" id="mProfile">
						<div class="">
						
						<div>
							<c:choose>
								<c:when  test="${ dm.MPic != null }">
								<img class="mPic"
									src="${pageContext.request.contextPath }/resources/upload/${ dm.MPic }" > 						
								</c:when>
								<c:otherwise>
								<img class="mPic" 
									src="${pageContext.request.contextPath }/resources/upload/basicPic.png">
								</c:otherwise>					
							</c:choose>
						</div>
						
							<div>
								<h5 class="text-center">${ dm.memberId }</h5>	
								<p class="text-center"><strong>${ dm.memberName }</strong></p>
								<p class="text-center" style="margin-top:-10%;">${ dm.comment }</p>
								<p class="text-center" style="margin-top:-15%;">
									 <strong width="100px">성실도 : ${ dm.diligentPoint }점</strong>
								</p>						
								<br>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	

<!-- 이달의 성실 스터디방 -->
	<div class="container-fluid" style="background-color: #E3DBD6;  height:560px;">
	<br>
		<h3 class="text-center">
		<img src="${pageContext.request.contextPath }/resources/images/trophy.png" width=70px;>
		이달의 성실 스터디방
		<img src="${pageContext.request.contextPath }/resources/images/trophy.png" width=70px;>
		</h3>
			
		<div class="container-sm-5" style="margin-left:4%;">
			<div class="row" id="srlistRank" style="margin-left:10%;">
				
				<c:forEach items="${ ds_List }" var="ds" end="4">
					<div class="m-3" id="sr">
						<div class="">
						<div class="sr_rank_pic">
							<c:choose>
								<c:when test="${ ds.SR_PIC != null }">
									<img class="rPic"
										src="${pageContext.request.contextPath }/resources/upload/${ ds.SR_PIC }">
								</c:when>
								
								<c:otherwise>
									<img class="rPic"
										src="${pageContext.request.contextPath }/resources/upload/background.jpg">
								</c:otherwise> 
							</c:choose>

						</div>
						<br><br><br><br><br><br><br>
							<div class="sr_rank_content">
								<p class="text-center" style="margin-top:10px;">
								<strong>${ ds.srTitle }</strong>
								</p>	
								<p class="text-center">그룹 리더 :<strong> ${ ds.memberId }</strong></p>
								<P class="text-center" style="margin-top:-10px;">
									${ ds.SR_GOAL }
								</P>
								<p class="text-center" style="margin-top:-15px;">
									 ${ ds.srComment }
									</p>
							</div>
								<br>
						</div>
					</div>
				</c:forEach>
				
				
			</div>
		</div>
	</div>



<!-- 스터디방 리스트 -->
	<div class="container-fluid"
		style="background-color: rgb(209, 203, 200); height:1150px;">
		<br>
		<h3 class="text-center">
			현재 모집중인 스터디
			<button type="button" class="btn btn-light" onclick="location.href='${ pageContext.request.contextPath }/studyroom/studyroomlist.do'">더 보기</button>
			</h3>
			<br>
			
			<div class="container-sm">
			<div class="row" id="srlistG">
				<c:forEach items="${ srList }" var="roomList" end="5">
				
				
					<div class="col-sm-3" id="srProfile" style="<c:if test="${ roomList.srOpenedYN != 'Y'}">background-color:gray;</c:if>">
						<input type="hidden" name="category" vlaue="${roomList.category}" />
						
						<div class="sr_pic">
					<c:choose>
					<c:when test="${ roomList.srPic != null }">	
					<img class="roomPic" 
					src="${pageContext.request.contextPath }/resources/upload/${ roomList.srPic }">
					</c:when>
					<c:otherwise>
					<img class="roomPic" 
					src="${pageContext.request.contextPath }/resources/upload/background.jpg">
					</c:otherwise>
					</c:choose>
					
					<c:choose>
					<c:when  test="${ roomList.mPic != null }">
					<img class="memPic" 
					src="${pageContext.request.contextPath }/resources/upload/${ roomList.mPic }">
					</c:when>
					<c:otherwise>
					<img class="memPic" 
					src="${pageContext.request.contextPath }/resources/upload/basicPic.png">
					</c:otherwise>					
					</c:choose>

						
					</div>
						
							<div class="hBtn" >
						<form id="favRoom" 
								action="${ pageContext.request.contextPath }/studyroom/favStudyroom.do"
								method="POST">
				
							<input type="text" class="form-control" name="srNo"	value="${roomList.srNo }"  hidden> 
							<input type="text" class="form-control" name="srNo"	value="${roomList.wishNo }" hidden> 
							<input type="text" class="form-control" name="memberId"	value="${loginMember.memberId }" hidden >
							
														
							<button type="submit" class="heartBtn" style="<c:if test="${roomList.wishNo == roomList.srNo}">background-color:gray;</c:if>" >
								<img class="heartP"
									src="${pageContext.request.contextPath }/resources/images/heart.png" >
							</button>
							
						</form>
					
					</div>
							
							<br>
							
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
					<br/>
				</c:forEach>
			</div>
		</div>
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
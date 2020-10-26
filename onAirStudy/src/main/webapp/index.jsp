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
	<div class="container-fluid" style="background-color: #F2EDEA; height:900px; " >
		<h3 class="text-center">
			이달의 성실 멤버
			</h3>
		
			<div class="container-sm-5 p-5">
			<div class="row" id="srlistG">
				
				<c:forEach items="${ dm_List }" var="dm">
					<div class="" id="srProfile" style="border: 4px solid rgb(247, 175, 141); border-radius: 5%;  width: 200px; height: 330px;">
						<div class="">
						
						<%-- <img class="mPic"
							src="${pageContext.request.contextPath }/resources/upload/${ dm.mPic }"	width="150px"> 						
							<a href="${pageContext.request.contextPath }/"></a>  --%>
						
						<h5 class="text-center">
							${ dm.memberId }
						</h5>	
						<h5 class="text-center">
							${ dm.memberName }
						</h5>
						<h5 class="text-center">
							 ${ dm.comment }
							</h5>
						<h5 class="text-center">
							 성실도 : ${ dm.diligentPoint }점
							</h5>
						
							<br>
						</div>
					</div>
				</c:forEach>
				
				
				
				
				
				
				
			</div>
		</div>
	</div>




<!-- 이달의 성실 스터디방 -->
	<div class="container-fluid" style="background-color: #E3DBD6;  height:550px;">
		<h3 class="text-center">
			이달의 성실 스터디방
			</h3>
					<div class="container-sm-5 p-5">
			<div class="row" id="srlistG">
				<c:forEach items="${ ds_List }" var="ds">
				
				
				
					<div class="" id="srProfile" style="border: 4px solid rgb(247, 175, 141); border-radius: 5%;  width: 200px; height: 330px;">
						<div class="">
						
						<%-- <img class="mPic"
							src="${pageContext.request.contextPath }/resources/upload/${ dm.mPic }"	width="150px"> 						
							<a href="${pageContext.request.contextPath }/"></a>  --%>
						
						<h5 class="text-center">
							${ ds.srTitle }
						</h5>	
						<h5 class="text-center">
							 ${ ds.memberId }
							</h5>
						<h5 class="text-center">
							${ ds.srGoal }
						</h5>
						<h5 class="text-center">
							 ${ ds.srComment }
							</h5>
						
							<br>
						</div>
					</div>
				</c:forEach>
				
				
			</div>
		</div>
	</div>



<!-- 스터디방 리스트 -->
	<div class="container-fluid"
		style="background-color: rgb(209, 203, 200); height:900px;">
		<h3 class="text-left">
			현재 모집중인 스터디
			<button type="button" class="btn btn-light" onclick="location.href='${ pageContext.request.contextPath }/studyroom/studyroomlist.do'">더 보기</button>
			</h2>
			
			<div class="container-sm">
			<div class="row" id="srlistG">
				<c:forEach items="${ srList }" var="roomList" end="5">
				
				
					<div class="col-sm-3" id="srProfile">
						<div class="sr_pic">
						<img class="roomPic"
							src="${pageContext.request.contextPath }/resources/upload/${ roomList.srPic }"	width="150px"> 
						</div>
						<img class="memPic"
							src="${pageContext.request.contextPath }/resources/upload/${ roomList.mPic }"	width="150px"> 						
							<a href="${pageContext.request.contextPath }/">
							<img src="${pageContext.request.contextPath }/resources/images/heart.png"
								 width="20px"></a> <br>
						<h5 class="text-center">
							${ roomList.sTitle }
						</h5>
						<h5 class="text-center">
							그룹 리더 : ${ roomList.memberId }
							</h5>
							
							<h5 class="text-center">
							${ roomList.srOpenedYN == 'Y' ? "모집중" :  "모집완료"}
							</h5>
							
							<br>
					
				
							
								<button type="button" class="btn btn-light btn-sm">둘러보기</button>
								<button type="submit" class="btn btn-light btn-sm">신청하기</button>
								<button type="button" class="btn btn-danger btn-sm">신고하기</button>
							
					</div>
			
					
					
					
					<br />
				</c:forEach>
			</div>
		</div>
	</div>






<jsp:include page="/WEB-INF/views/common/footer.jsp" />

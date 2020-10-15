<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>
​



</head>
<body>
	<div class="container-fluid" style="height:750px;">
		<h2 class="text-center">프리미엄 서비스 회원이 누릴 수 있는 혜택</h2>
		
		<div class="text-center">
			<ul class="list-unstyled">
				<li class="col-md-12">
					<h3>카테고리 상관없이 최대 3개 방 생성 기능</h3>
					<h4>여러 종류의 스터디방에 입장 가능해요</h4>
				</li>
				<li class="col-md-12">
					<h3>스터디방내 채팅 기능</h3>
					<h4>팀원들과 채팅으로 정보 공유 , 공부 진행상황 공유 가능해요</h4>
				</li>
				<li class="col-md-12">
					<h3>팀내 날짜 및 시간 설정 -> 출석체크 기능</h3>
					<h4>팀 별 출석률로 성실도 점수가 들어가요</h4>
				</li>
				<li class="col-md-12">
					<h3>팀 공용 캘린더 기능</h3>
					<h4>스터디 요일 및 TEST 날짜를 설정할 수 있어요</h4>
				</li>
				<li class="col-md-12">
					<h3>팀원들끼리 문제등록 후, 시험 참여 가능</h3>
					<h4>팀원들이 내준 문제를 풀어보고 채점 후 , 개인 점수로 적용</h4>
				</li>
			</ul>
		</div>



		<div class="text-center col-md-12">
			<h3>지금 바로 프리미엄에 가입하시겠어요 ?</h3>
			<button type="button"
                	onclick="location.href='${ pageContext.request.contextPath }'">메인화면 가기</button>
			
			<button type="button"
                	onclick="location.href='${ pageContext.request.contextPath }/payment/';">프리미엄 가입하기</button>
		</div>
		
		
			
	</div>

		



</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
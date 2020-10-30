<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script>
	function kakaopaypopup(){

		if("${loginMember}" == "" ){
			location.href= "${ pageContext.request.contextPath }/member/memberLogin.do";
			alert("로그인해주세요");
		}else if( "${loginMember.memberRole}" == 'P'){
			location.href="redirect:/";
			alert("이미 프리미엄회원입니다.");
		}else{
			var url = "${ pageContext.request.contextPath }/pay/kakao";
			var title = "kakaoPay";
			var spec = "left=400px, top=60px, width=600px, height=700px";
			
			open(url, title, spec);
			self.close();
		}
	}
</script>


	<div class="container-fluid" style="height: 100%; background-color: rgb(247, 235, 229);">
 <!-- 맨위 배너 -->
	    <div class="col-md-15">
	    <br>
	    	<img class="mx-auto d-block" src="${pageContext.request.contextPath }/resources/images/premium.png" width="50px">
		<h2 class="text-center m-4"><strong>프리미엄 서비스 회원</strong>이 누릴 수 있는 혜택은 ?</h2>
		</div>
	
	
	
	<div class="container"> 
		<div class="text-center">
				<div class="col-m-5 p-3" style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; margin-top:1%;"> 
					<h3>카테고리 상관없이 <strong style="color:#ff6666;">최대 3개 방 생성</strong> 기능</h3>
					<h4 style="color:gray;">: 여러 종류의 스터디방에 입장 가능해요</h4>
				</div> 
		
				<div class="col-m-5 p-3" style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; margin-top:1%;">
					<h3>스터디방내 <strong style="color:#ff6666;">채팅</strong> 기능</h3>
					<h4 style="color:gray;">: 팀원들과 채팅으로 정보 공유 , 공부 진행상황 공유 가능해요</h4>
				</div>			
				<div class="col-m-5 p-3" style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; margin-top:1%;">
					<h3>팀내 날짜 및 시간 설정 -> <strong style="color:#ff6666;">출석체크</strong> 기능</h3>
					<h4 style="color:gray;">: 팀 별 출석률로 성실도 점수가 들어가요</h4>
				</div>
				<div class="col-m-5 p-3" style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; margin-top:1%;">
					<h3>팀 <strong style="color:#ff6666;">공용 캘린더</strong> 기능</h3>
					<h4 style="color:gray;">: 스터디 요일 및 TEST 날짜를 설정할 수 있어요</h4>
				</div>
				<div class="col-m-5 p-3" style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; margin-top:1%;">
					<h3>팀원들끼리 <strong style="color:#ff6666;">문제등록</strong> 후, <strong style="color:#ff6666;">시험 참여</strong> 가능</h3>
					<h4 style="color:gray;">: 팀원들이 내준 문제를 풀어보고 채점 후 , 개인 점수로 적용</h4>
				</div>
		</div>


	<br>
		<div class="text-center col-md-12">
			<h3>지금 바로 프리미엄에 가입하시겠어요 ?</h3>
			<button type="button" class="btn btn-light"
                	onclick="location.href='${ pageContext.request.contextPath }'">메인화면 가기</button>
			<button type="button" class="btn btn-danger" id="payment_btn" onclick="kakaopaypopup();">프리미엄 가입하기</button>
			
		</div>
		
		
			
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
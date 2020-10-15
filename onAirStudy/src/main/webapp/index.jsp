<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>

.carousel-inner {
    height: 50vh;
    background-color: rgb(255, 195, 163);
}

</style>
<!--  -->
			<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			  </ol>
			  
			  
			  <div class="carousel-inner">
			    <div class="carousel-item active" >
			    <img src="..." class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block" >
			          <h2>Welcome</h2>
                      <h3>onAirStudy 가 처음이신가요?</h3>
                        <button class="btn btn-outline-success my-2 my-sm-0" 
                		type="button"
                		onclick="location.href='${ pageContext.request.contextPath }/#';">이용방법 안내 </button>
			      </div>
			    </div>
			    <div class="carousel-item">
			    <img src="..." class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h2>프리미엄 가입하면</h2>
                      <h3>실시간 채팅이?</h3>
                      <button class="btn btn-outline-success my-2 my-sm-0" 
                		type="button"
                		onclick="location.href='${ pageContext.request.contextPath }/premium';">프리미엄 혜택보기</button>
			      </div>
			    </div>
			    <div class="carousel-item">
			    <img src="..." class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h2>온라인 TEST</h2>
                      <h3>멤버들이 작성한 문제풀기</h3>
                       <button class="btn btn-outline-success my-2 my-sm-0" 
                		type="button"
                		onclick="location.href='${ pageContext.request.contextPath }/premium';">프리미엄 혜택보기</button>
			      </div>
			    </div>
			  </div>
			  
			  
			  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>


 
 
 
 
		<!-- 어떤점이 좋나요? -->
		<div class="container">
		 	<h1 class="text-left" style="color:rgb(255, 195, 163)"><strong>onAir Study</strong></h1>
			<h2>어떤 점이 좋나요?</h2>
			<br>
		    
		    <div class="row">
		        <div class="col-md-4">
		        	<img class="center-block" src="${pageContext.request.contextPath }/resources/images/online.png" width="100px"> 
					<h3 class="text-center"s>온라인상의 STUDY</h3>
					<br>
					<h5>코로나로 인해 만나기 어려울 때, <strong>온라인에서 스터디원 모집 및 진행에 필요한 서비스 제공</strong></h5>	
		        
		        </div>
		        <div class="col-md-4">
		        	<img class="center-block" src="${pageContext.request.contextPath }/resources/images/study.png" width="100px"> 
					<h3 class="text-center">다양한 카테고리의 스터디 그룹</h3>
					<br>
					<h5><strong>자격증, 면접, 컴퓨터/IT등 다양한 카테고리</strong>로 분류되어 자신의 목표에 맞는 그룹 찾기 가능</h5>	
					</div>
		        <div class="col-md-4">
		        	<img class="center-block" src="${pageContext.request.contextPath }/resources/images/rank.png" width="100px"> 
					<h3 class="text-center">개인/팀별로 경쟁심 자극</h3>
					<br>
					<h5>자신 혹은 그룹의 <strong>출석 및 랭킹</strong>을 실시간으로 확인하면서 공부효율 높일수 있는 서비스</h5>	
		        </div>
		    </div>
		    </div>
		    <br>
 
	
	
		<!-- 이달의 성실멤버 -->
			<div class="container-fluid" style="background-color:#F2EDEA">
			<h3 class="text-center">이달의 성실멤버</h2>
			  <ul class="list-inline">
					  <li>
					  	   Item 1
					  </li>
					  
					  <li> Item 2 </li>
					  <li> Item 3 </li>
					  <li> Item 4 </li>
					  <li> Item 5 </li>
					  <li> Item 6 </li>
					  <li> Item 7 </li>
					  <li> Item 8 </li>
					  <li> Item 9 </li>
					  <li> Item 10 </li>
			 </ul>

			</div>
			
			
			
			
		<!-- 이달의 성실 스터디방 -->
			<div class="container-fluid" style="background-color:#E3DBD6">
			<h3 class="text-center"> 이달의 성실 스터디방</h2>
			     <ul class="list-inline">
					  <li> Item 1 </li>
					  <li> Item 2 </li>
					  <li> Item 3 </li>
					  <li> Item 4 </li>
					  <li> Item 5 </li>
				</ul>
			</div>
				
				
		
		<!-- 스터디방 리스트 -->
			<div class="container-fluid" style="background-color:rgb(209,203,200)">
			<h3 class="text-left">현재 모집중인 스터디 <button type="button" class="btn btn-light">더 보기</button></h2>
			<br>
			
			  <ul class="list-inline">
					 <li> 
					  <div style="background-color:fff; border:4px solid rgb(247,175,141); border-radius:5%; padding:20px; width:230px; height:330px;">
					  		<img class="center-block" src="${pageContext.request.contextPath }/resources/upload/?" width="150px"
					  		onclick="">
					  		<a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/images/heart.png" width="20px"></a>
					  		<br>
					  		<h5 class="text-center">방 제목<a href="#" onclick=""></a></h5>
					  		<h5 class="text-center">리더 아이디<a href="#" onclick=""></a></h4>
					  		
					  		<br>
					  		<ul class="list-inline">
							  <li><button type="button" class="btn btn-light">둘러보기</button></li>
							  <li><button type="button" class="btn btn-light">신청하기</button></li>
							  <li><button type="button" class="btn btn-danger">신고하기</button></li>
							</ul>

					  		
					  		
					  	</div>
					  </li>
					 
					 
					  <li> Item 2 </li>
					  <li> Item 3 </li>
					  <li> Item 4 </li>
					  <li> Item 5 </li>
					  <li> Item 6 </li>
					  <li> Item 7 </li>
					  <li> Item 8 </li>
				</ul>	  
			</div>
				
				




			 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

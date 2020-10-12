<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>

.banner {
    height: 50vh;
    background-color: rgb(255, 195, 163);
}
.navbar-nav>li>a {
    line-height: 40px;
}
</style>

 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                
            
              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="banner" width="1800px" alt="first slide" >
                  <div class="carousel-caption">
                      <h2>Welcome</h2>
                      <h3>onAirStudy 가 처음이신가요?</h3>
                        <button class="btn btn-outline-success my-2 my-sm-0" 
                		type="button"
                		onclick="location.href='${ pageContext.request.contextPath }/#';">이용방법 안내 </button>
	                  </div>
	                </div>
                </div>

                <div class="item">
                    <div class="banner" width="1800px" alt="second slide">
                    <div class="carousel-caption">
                      <h2>프리미엄 가입하면</h2>
                      <h3>실시간 채팅이?</h3>
                      <button class="btn btn-outline-success my-2 my-sm-0" 
                		type="button"
                		onclick="location.href='${ pageContext.request.contextPath }/premium/premium.do';">프리미엄 혜택보기</button>
                    </div>
                  </div>
                </div>

                <div class="item">
                    <div class="banner" width="1800px" alt="third slide">
                    <div class="carousel-caption">
                      <h2>온라인 TEST</h2>
                      <h3>멤버들이 작성한 문제풀기</h3>
                       <button class="btn btn-outline-success my-2 my-sm-0" 
                		type="button"
                		onclick="location.href='${ pageContext.request.contextPath }/premium/premium.do';">프리미엄 혜택보기</button>
                  </div>
                </div>
                </div>
              </div>
            
              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div> 






	<!-- 어떤점이 좋나요? -->
	
	<!-- <div class="container"> 
			 <h1 class="text-left" style="color:rgb(255, 195, 163)"><strong>onAir Study</strong></h1>
			 <h2>어떤 점이 좋나요?</h2>
			
			<div class="row"> 
				<div class="col-3"> 
					<div class="card">
	 		 			 <img src=""> 
						 <h3>다양한 CATEGORY의 스터디 그룹</h3>
						 <h4>자격증, 면접, 컴퓨터/IT등 다양한 카테고리로 분류되어 자신의 목표에 맞는 그룹 찾기 가능</h4>	
					 </div>
					</div>
				</div> 
	</div> -->
	
	
	
	

<div class="container">
 	<h1 class="text-left" style="color:rgb(255, 195, 163)"><strong>onAir Study</strong></h1>
	<h2>어떤 점이 좋나요?</h2>
    
    <div class="row">
        <div class="col-md-4">
        	<img src=""> 
			<h3>다양한 CATEGORY의 스터디 그룹</h3>
			<h4>자격증, 면접, 컴퓨터/IT등 다양한 카테고리로 분류되어 자신의 목표에 맞는 그룹 찾기 가능</h4>	
        
        </div>
        <div class="col-md-4">
        	<img src=""> 
			<h3>다양한 CATEGORY의 스터디 그룹</h3>
			<h4>자격증, 면접, 컴퓨터/IT등 다양한 카테고리로 분류되어 자신의 목표에 맞는 그룹 찾기 가능</h4>	
			</div>
        <div class="col-md-4">
        	<img src=""> 
			<h3>다양한 CATEGORY의 스터디 그룹</h3>
			<h4>자격증, 면접, 컴퓨터/IT등 다양한 카테고리로 분류되어 자신의 목표에 맞는 그룹 찾기 가능</h4>	
        </div>
    </div>
 




		








			 
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

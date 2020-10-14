<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Dashboard by Bootstrapious.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fontastic.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/grasp_mobile_progress_circle-1.0.0.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- Side Navbar -->
    <nav class="side-navbar" style="background: #E0B1D0">
      <div class="side-navbar-wrapper">
        <!-- Sidebar Header    -->
        <div class="sidenav-header d-flex align-items-center justify-content-center">
          <!-- User Info-->
          <!--  <i class="icon-mail" style="float: right; display:block"></i>-->
          <div class="sidenav-header-inner text-center" style="background: #E0B1D0">
          <div class="message-icon-line">
          	<div class="icon-mail message-icon" style="display:inline-block" onclick="alert('쪽지함으로 이동!');"></div>
          	<div class="badge message-warning">1</div>
          </div>
           
          	<img src="${pageContext.request.contextPath}/resources/images/avatar-7.jpg" alt="person" class="img-fluid rounded-circle">
            <h2 class="h5">Honggd</h2>
          </div>
          <!-- Small Brand information, appears on minimized sidebar-->
          <div class="sidenav-header-logo"><a href="${pageContext.request.contextPath }/index.jsp" class="brand-small text-center"> <strong>B</strong><strong class="text-primary">D</strong></a></div>
        </div>
        <div class="d-day-display" onclick="alert('스케줄러로 이동!');">
	        <hr>
	        <span>D - 37</span></br>
	        <span>2020.11.02</span></br>
	        <span>토익시험</span></br>
	    	<hr>
	   	</div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
         <ul id="side-main-menu" class="side-menu list-unstyled studyRoom-sidenav">                  
            <li class=""><a href="#"> <i class="icon-home"></i>우리 스터디방</a></li>
            <li class="side-submenu-applicants"><a href="#exampledropdownDropdown3" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>참여인원 </a>
              <ul id="exampledropdownDropdown3" class="collapse list-unstyled ">
                <li>
                	<img class="side-icon-crown" src="https://www.pikpng.com/pngl/m/22-224864_crown-silhouette-png-white-crown-silhouette-transparent-clipart.png" alt="Crown Silhouette Png - White Crown Silhouette Transparent Clipart@pikpng.com">
                	이지혜
                	<div class="side-realTime-statusJH"></div>
                	<div class="icon-mail team-messageJH"  onclick="alert('쪽지보내기 창 띄우기!')"></div>
                </li>
              </ul>
            </li>
            <li class="side-submenu"><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>시험 </a>
              <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                <li><a href="#">시험문제 등록</a></li>
                <li><a href="#">시험보기</a></li>
              </ul>
            </li>
            <li><a href="#"> <i class="fa fa-bar-chart"></i>초대하기                            </a></li>
            <li><a href="#"> <i class="icon-interface-windows"></i>스케줄러                             </a></li>
            <li class="side-submenu-applicants"><a href="#exampledropdownDropdown2" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>신청인원 </a>
              <ul id="exampledropdownDropdown2" class="collapse list-unstyled ">
                <li>이지혜    
                	<input type="button" value="수락" class="btnApplicantsJH btnAcceptJH"/>
                	<input type="button" value="거절" class="btnApplicantsJH btnRejectJH"/>
                	
                </li>
              </ul>
            </li>
            <li><a href="#"> <i class="icon-interface-windows"></i>방 나가기                             </a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="page">
   
     
    </div>
    <!-- JavaScript files -->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File -->
    <script src="${pageContext.request.contextPath }/resources/js/front.js"></script>
  </body>
</html>
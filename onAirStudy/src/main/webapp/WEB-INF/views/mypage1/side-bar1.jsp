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
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scollbar-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- Side Navbar -->
    <nav class="side-navbar">
      <div class="side-navbar-wrapper">
        <!-- Sidebar Header    -->
        <div class="sidenav-header d-flex align-items-center justify-content-center">
          <!-- User Info-->
          <!--  <i class="icon-mail" style="float: right; display:block"></i>-->
          <div class="sidenav-header-inner text-center">
          <div class="message-icon-line">
          	<div class="icon-mail message-icon" style="display:inline-block" onclick=""></div>
          	<div class="badge message-warning">1</div>
          </div>
           
          	<img src="${pageContext.request.contextPath}/resources/images/avatar-7.jpg" alt="person" class="img-fluid rounded-circle">
            <h2 class="h5">Honggd</h2>
          </div>
          <!-- Small Brand information, appears on minimized sidebar-->
          <div class="sidenav-header-logo"><a href="${pageContext.request.contextPath }/index.jsp" class="brand-small text-center"> <strong>B</strong><strong class="text-primary">D</strong></a></div>
        </div>
        <div class="d-day-display">
	        <hr>
	        <span>D - 37</span></br>
	        <span>2020.11.02</span></br>
	        <span>토익시험</span></br>
	    	<hr>
	   	</div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
           <ul id="side-main-menu" class="side-menu list-unstyled">                  
            <li class=""><a href="#"> <i class="icon-home"></i>초대내역                             </a></li>
            <li> <a href="#"> <i class="icon-mail"></i>프리미엄
                <div class="badge badge-warning">D - 37</div></a></li>
            <li><a href="#"> <i class="fa fa-bar-chart"></i>내 스터디방                            </a></li>
            <li><a href="#"> <i class="icon-grid"></i>스케줄러                             </a></li>
            <li><a href="#"> <i class="icon-interface-windows"></i>내 정보                             </a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="page">
   
     
    </div>
    JavaScript files
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    Main File
    <script src="${pageContext.request.contextPath }/resources/js/front.js"></script>
  </body>
</html>
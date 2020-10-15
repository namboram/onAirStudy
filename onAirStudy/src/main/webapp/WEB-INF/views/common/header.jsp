<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
​
​
<c:if test="${ not empty msg }">
<script>
	alert("${ msg }");
</script>
</c:if>
​
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
​
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" />
​
</head>
<body>
	<header>
	
	
	<!-- Navbar start -->
	<nav class="navbar navbar-default" role="navigation">
         <div class="container">

           <div class="navbar-header">
               <button  type="button" 
               			class="navbar-toggle collapsed" 
               			data-toggle="collapse" 
               			data-target="#a-navbar-collapse" 
               			aria-expanded="false">
               			
                   <span class="sr-only">Toggle navigation</span>
                 </button>
			 
			
			
			<!-- logo -->
			
              <a class="navbar-nav" href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath }/resources/images/logo.png" alt="Brand" width="180px" />
                  </a>
           </div>


          <div class="collapse navbar-collapse"  id="a-navbar-collapse">  
              <ul class="nav navbar-nav">
                  <li><a href="<%= request.getContextPath() %>/#">스터디방</a></li>
                  <li><a href="#" onclick="location.href='${ pageContext.request.contextPath }/diary/diaryList.do'">공부다이어리</a></li>
                  <li><a href="<%= request.getContextPath() %>/#">공지사항</a></li>
                  <li><a href="<%= request.getContextPath() %>/#">고객센터</a></li>
              </ul>


                  <c:if test="${ empty loginMember }">
	                <ul class="nav navbar-nav navbar-right">
						<li class="nav-link"><a href="<%= request.getContextPath() %>/member/memberLogin.do">login</a></li>
	                  	<li class="nav-link"><a href="<%= request.getContextPath() %>/member/memberenroll.do">Join</a></li> 
	               </ul>   
                  
       </c:if>
                 
	  
		</nav> 
		<hr>
	  <!-- Navbar End -->

       
      
          
        </header>
        
        
        
		
                
		
		  
	<section id="content">
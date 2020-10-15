<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<c:if test="${ not empty msg }">
<script>
	alert("${ msg }");
</script>
</c:if>

<script src="http://code.jquery.com/jquery-latest.min.js"></script> 

<!-- bootstrap css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css" />

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
						<li><a href="<%= request.getContextPath() %>/member/memberLogin.do">login</a></li>
	                  <li><a href="#" onclick="location.href='${ pageContext.request.contextPath }/member/memberEnroll.do';">Join</a></li> 
                  
                 </c:if>
                 
                 
                  <c:if test="${ not empty loginMember }">
                   <a href="${ pageContext.request.contextPath }">${ loginMember.memberName }</a>님, 안녕하세요.
			    &nbsp;
			    <button class="btn btn-outline-success my-2 my-sm-0" 
                		type="button"
                		onclick="location.href='${ pageContext.request.contextPath }/member/memberLogout.do';">로그아웃</button>
			    </c:if> 
                  
             
			    
                </ul>
           </div> 
          </div>
       </nav>
       <!-- Navbar End -->
       
      
          
        </header>
        
        
        
		
                
		
		  
	<section id="content">
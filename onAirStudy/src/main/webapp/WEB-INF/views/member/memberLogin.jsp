<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle}</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css" />

<script>
$(function(){
	<c:if test="${ not empty msg}">
	alert("${ msg }");
	</c:if>

	
	
	$("#loginModal").modal()
					.on("hide.bs.modal", function(){
						<c:if test="${ fn:contains(header.referer, '/member/memberLogin.do')}">
						location.href = "${ pageContext.request.contextPath }";
						</c:if>
						
						<c:if test="${ not fn:contains(header.referer, '/member/memberLogin.do')}">
						location.href = "${ header.referer }";
						</c:if>
						
					});
});
</script>
</head>
	
	<body> 
 
 
	 <div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
			aria-labelledby="loginModalLabel" aria-hidden="true">
	
		<div class="card align-middle" style="width:25rem; border-radius:20px; margin-top:10%;">
				<div class="card-title" style="margin-top:30px;">	
					<a class="modal-title" href="${pageContext.request.contextPath}">
			        	<img src="${pageContext.request.contextPath }/resources/images/logo.png" width="200px" style="margin-left:23%;" />
					</a>
				</div>
					
				<div class="card-body">
						<!-- 로그인 폼 -->
				      	<form class="form-signin" method="POST" action="${pageContext.request.contextPath}/member/memberLogin.do">
				        
					        <label for="inputEmail" class="sr-only">Your ID</label>
					        <input type="text" id="uid" name="memberId" class="form-control" placeholder="Your ID" required autofocus><BR>
					        <label for="inputPassword" class="sr-only">Password</label>
					        <input type="password" id="upw" name="password" class="form-control" placeholder="Password" required><br>
					        <div class="checkbox">
					          <!-- <label>
					            <input type="checkbox" value="remember-me"> 기억하기
					          </label> -->
					        </div>
					        <div class="text-center">
						        <button type="submit" id="btn" class="btn my-2 my-sm-0">로그인</button>
								<button type="button" id="btn" class="btn my-2 my-sm-0" data-dismiss="modal"onclick="location.href='${ pageContext.request.contextPath }'">취소</button>
							</div>
				      </form>
			      
				</div>
			</div>
		</div>
   
  </body>
	
	
	
</body>
</html>

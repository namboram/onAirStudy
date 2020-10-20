<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script> 
   
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
   integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
   crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
   integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
   crossorigin="anonymous"></script>
<style>
	#containerMsgK{
		background-color : #F9F1ED;
	}
	#contentMsgK{
		background-color : white;
	}
</style>
<meta charset="UTF-8">
<div id="containerMsgK">
<h1>쪽지함</h1>
<div id="contentMsgK">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">보낸사람</th>
      <th scope="col">받는사람</th>
      <th scope="col">내용</th>
      <th scope="col">날짜</th>
      <th scope="col">읽음여부</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${messageList}" var="message" varStatus="status">
		
    <tr>
      <th scope="row">${status.count}</th>
      <td>${message.senderId}</td>
      <td>${message.receiverId}</td>
      <td><a href="#">${message.msgContent}</a></td>
      <td><fmt:formatDate value="${message.sendDate }" pattern="yy/MM/dd HH:mm:ss" /></td>
      <c:if test="${message.readYN eq 'Y'}">
      <td class="text-grey">
      	읽음
      </td>      		
      </c:if>
      <c:if test="${message.readYN eq 'N'}">
      <td>
      	안읽음
      </td>
      </c:if>
    </tr>
	</c:forEach>
    
  </tbody>
</table>
	
</div>
</div>
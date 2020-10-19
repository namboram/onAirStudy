<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.onairstudy.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내 스터디 방- My Study Group</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mystudygruop.css">


</head>

<body>
    <div class="invitation" style="margin-bottom: 0;">

       
            <div class="col-sm" style="background-color:#FBF7FD; padding: 20px;">
                <h2 class="text-gray" style="float: left; padding-right: auto;"> My Study Group</h2> 
                <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                data-target="#myModal_ok" style="border-radius: 35px;"> <a href="${pageContext.request.contextPath }/mypage1/newstudy.do">스터디 방 만들기</a></button>
                <hr>
                <div class="container">
              
                    <div class="col-sm"
                        style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px;">
                        <h3 style="text-decoration: underline;">내 스터디 그룹 </h3> 

                        <table class="table">
                            <thead class="thead-rounded" >
                                <tr style="padding-left: 30px;">
                                    <th>카테고리</th>
                                    <th>그룹 이름</th>
                                    <th>그룹 소개</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ studyList }" var="studyroom">
                                	<c:if test="${studyroom.memberId eq seesionId }">
                                    <tr>
                                        <td>${studyroom.sCategory}</td>
                                        <td>${studyroom.srTitle}</td>
                                        <td>${studyroom.srComment}</td>

                                        <td>
                                            <button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                                data-target="#myModal_ok">
                                                입장하기</button>
                                        </td>
                                    </tr>
                                    </c:if>
                                </c:forEach>
                                
                            </tbody>
                        </table>                    
                 </div>
                 <br>
                            <div class="col-sm"
                        style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px;">
                        <h3 style="text-decoration: underline;">대기중인 그룹 </h3>

                        <table class="table">
                            <thead class="thead-rounded">
                                <tr>
                                    <th>카테고리</th>
                                    <th>그룹 이름</th>
                                    <th>그룹 소개</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ waitingList }" var="studyroomwaiting">
                                    <tr>
                                        <td>${studyroomwaiting.aCategory}</td>
                                        <td>${studyroomwaiting.aTitle}</td>
                                        <td>${studyroomwaiting.aComment}</td>
                                        <td>  <button type="button" class="btn btn-outline-primary">
                                                ${studyroomwaiting.aStatus == 'Y' ? '대기중' : '만료'} </button></td>
                                        
                                    </tr>
                                </c:forEach>
                              
                            </tbody>
                        </table>
                    </div>
                    <br>
                       <div class="col-sm"
                        style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px;">
                        <h3 style="text-decoration: underline;">내가 찜한 그룹</h3>

                        <table class="table">
                            <thead class="thead-rounded">
                                <tr>
                                    <th>카테고리</th>
                                    <th>그룹 이름</th>
                                    <th>그룹 소개</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ wishList }" var="studyroomwish">
                                    <tr>
                                        <td>${studyroomwish.wCategory}</td>
                                        <td>${studyroomwish.wTitle}</td>
                                        <td>${studyroomwish.wComment}</td>
                                        

                                        <td>
                                            <button type="button" class="btn btn-outline-primary">
                                                ${studyroomwish.wStatus == 'Y' ? '가입가능' : '만료'} </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                   
                            </tbody>
                        </table>
                    </div>
            </div>

        </div>
    </div>
 
</body>

</html>
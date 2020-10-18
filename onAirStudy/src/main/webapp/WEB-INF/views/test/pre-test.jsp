<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>모의 시험- Pre-test</title>

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

 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/invitation.css">
    <style>
        .tq_G {
            columns: 2;
        }
    </style>

</head>
<body>
    <div class="pre_test" style="margin-bottom: 0;">
        <div class="row">
            
            <div class="col-sm" style="background-color: white;">
                <div>
                    <div>
                        <h2>Pre-test</h2>
                    </div>
                    <div align="center">
                        <div class="col-lg-4" style="background-color: #F6E5FE; border-radius: 15px; ">
                            <h4 style="text-align: center;">오늘의 Test</h4>
                        </div>
                    </div>
                    <div class="tq_G">
                        <for:each items="${list}" var="">

                            <div class="col-lg" style=" background-color: #FFF0F0; border-radius: 15px; padding: 15px;">
                                <textarea id="question_box_g" rows="5" class="col-lg" readonly> </textarea>
                                <br>
                                <br>
                                <input type="button" class="btn btn-outline-dark btn-sm" id="choice1" value="1"
                                    style="margin-right: 10px; border-radius: 50%;"> <input type="text"
                                    class="col-lg-10" style="border-radius: 15px;" readonly>
                                <br>
                                <input type="button" class="btn btn-outline-dark btn-sm" id="choice1" value="2"
                                    style="margin-right: 10px; border-radius: 50%;"> <input type="text"
                                    class="col-md-10" style="border-radius: 15px; margin-top: 15px;" readonly>
                                <br>
                                <input type="button" class="btn btn-outline-dark btn-sm" id="choice1" value="3"
                                    style="margin-right: 10px; border-radius: 50%;"> <input type="text"
                                    class="col-lg-10" style="border-radius: 15px; margin-top: 15px;" readonly>
                                <br>
                                <input type="button" class="btn btn-outline-dark btn-sm" id="choice1" value="4"
                                    style="margin-right: 10px; border-radius: 50%;"> <input type="text"
                                    class="col-lg-10" style="border-radius: 15px; margin-top: 15px;" readonly>
                            </div>
                            <br>
                     

                        </for:each>

                    </div>
                    
                    <div align="center">
                        <button type="submit" class="btn btn-outline-primary" style="margin-right: 30px;"
                            data-toggle="modal" data-target="#myModal_sub_G">제출하기 </button>

                    </div>
                    <br>
                </div>


            </div>
            <!-- The Modal -->
            <div class="modal fade" id="myModal_sub_G">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header" style="color: #E2A182;">
                            <h4 class="modal-title">오늘의 Test 제출</h4>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            제출 하시겠습니까?
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-outline">제출</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

</body>

</html>
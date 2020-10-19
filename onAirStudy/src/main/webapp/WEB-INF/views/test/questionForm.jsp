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
    <title>시험문제 등록 - Exam Question</title>

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
</head>

<body>

    <div class="test_question" style="margin-bottom: 0;">
        <div class="row">
     
            <div class="col-sm" style="background-color: white;">
                <div>
                    <div>
                        <h2>Exam Question</h2>
                    </div>
                    <div style="background-color: #F6E5FE;">
                        <p>문제는 객관식으로 등록해 주세요.</p>
                    </div>
                    <div class="form-group-row">
                        <fieldset class="col-lg" style="border: unset; background-color: #FFF0F0; border-radius: 15px;">
                            <legend>Question</legend>
                       
                            <textarea id="question_box_G" rows="12" class="col-lg-12">문제를 입력해 주세요</textarea>
                            
                        </fieldset>
                        <br>
                        <div class="col-lg" style=" background-color: #FFF0F0; border-radius: 15px;">
                            <form action="/action_page.php">
                                <br>
                                <div class="custom-file mb-3">
                                    <input type="file" class="custom-file-input" id="customFile" name="filename">
                                    <label class="custom-file-label" for="customFile">문제에 관련된 사진을 첨부할 수 있습니다</label>
                                </div>
                            </form>
                        </div>
                        <br>
                        <div class="col-lg" style=" background-color: #FFF0F0; border-radius: 15px;">
                            <br>
                            <div class="form-check" style="align-items: center;">
                                <input type="button" class="btn btn-outline-dark" id="choice1" value="1"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark" id="choice1" value="2"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px; margin-top: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark" id="choice1" value="3"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px; margin-top: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark" id="choice1" value="4"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px; margin-top: 15px;">
                            </div>
                            <br>
                        </div>
                        <br><br>
                        <div align = "right"> 
                            <div class="col-md-4" style="background-color: #FFF0F0; border-radius: 15px; padding: 10px; text-align: left;">
                                <h4>정답: 답 불러오기 만들기</h4>
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div align="center">
                        <button type="submit" class="btn btn-outline-primary" style="margin-right: 30px;" data-toggle="modal" data-target="#myModal_ok_G">등록 </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
                    <br>
                </div>
              

            </div>
            <!-- The Modal -->
            <div class="modal fade" id="myModal_ok_G">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header" style="color: #E2A182;">
                            <h4 class="modal-title">문제 등록</h4>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            문제를 등록 하시겠습니까?
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-outline">확인</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>

    <script>
        $("custom-file-inpu").on("change", function () {
            var fileName = $(this).val().split("\\").pop;
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
    </script>
</body>
</html>
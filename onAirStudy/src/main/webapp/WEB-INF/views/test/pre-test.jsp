<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
    .tq_G {
        columns: 2;
    }
</style>
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
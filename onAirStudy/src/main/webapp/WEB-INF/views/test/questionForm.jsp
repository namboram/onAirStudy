<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function studyroomValidate(){
	var $content = $("[name=testQeustion]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

$(function(){
	$("[name=upFile]").on("change",function(){
		var file = $(this).prop('files')[0];
		var $label = $(this).next(".custom-file-label");

		if(file == undefined)
			$label.html("파일을 선택하세요");
		else
			$label.html(file.name);
		});
});

/* $("custom-file-input").on("change", function () {
    var fileName = $(this).val().split("\\").pop;
    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
}); */

</script>


    <div class="test_question" style="margin-bottom: 0;">
    	<form name="questionFrm" 
		  action="${pageContext.request.contextPath}/mypage2/testquestion.do" 
		  method="post"
		  enctype="multipart/form-data" 
		  onsubmit="return studyroomValidate();">
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
                       	<input type="text" class="form-control" name="memberId" value="${ loginMember.memberId }" hidden>
 						<c:set value="${test1}" var="cate"/>
 						<input type="number" class="form-control" name="memberId" value="${ cate.srNo }" hidden/>
                        <textarea id="testQestion" name ="testQeustion" rows="12" class="col-lg-12">문제를 입력해 주세요</textarea>
                            
                        </fieldset>
                        <br>
                        <div class="col-lg" style=" background-color: #FFF0F0; border-radius: 15px;">
                            
                                <br>
                                <div class="custom-file mb-3">
                                    <input type="file" class="custom-file-input" id="upFile" name="upFile">
                                    <label class="custom-file-label" for="upFile">문제에 관련된 사진을 첨부할 수 있습니다</label>
                                </div>
                            
                        </div>
                        <br>
                        <div class="col-lg" style=" background-color: #FFF0F0; border-radius: 15px;">
                            <br>
                            <div class="form-check" style="align-items: center;">
                                <input type="button" class="btn btn-outline-dark" id="choice1" value="1"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark" id="choice2" value="2"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px; margin-top: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark" id="choice3" value="3"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px; margin-top: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark" id="choice4" value="4"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" class="col-lg-10"
                                    style="border-radius: 15px; margin-top: 15px;">
                            </div>
                            <br>
                        </div>
                        <br><br>
                        <div align = "right"> 
                            <div class="col-md-4" style="background-color: #FFF0F0; border-radius: 15px; padding: 10px; text-align: left;">
                                <h4>정답:</h4><h4 id="testAnswer" name="testAnswer"></h4>
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
                            <button type="submit" class="btn btn-outline" value="저장">확인</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>

                    </div>
                </div>
            </div>


        </div>
        </form>
    </div>
 
    <script>
    $("#choice1").click(function(){
		return $("#choice1").val();
        });
    $("#choice2").click(function(){
		return $("#choice2").val();
        });
    $("#choice3").click(function(){
		return $("#choice3").val();
        });
    $("#choice4").click(function(){
		return $("#choice4").val();
        });
    
    $("#choice1, #choice2, #choice3, #choice4").click(function(event){
		$("#testAnswer").html(event.result);
        });
    </script>

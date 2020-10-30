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

</script>


    <div class="test_question" style="margin:3%; ">
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
                    
                    <div class="form-group-row col-lg-12 px-5">
                        <fieldset class="col-lg" style="border: unset; background-color: #FFF0F0; border-radius: 15px; padding:2%;  overflow:auto;">
                            <legend>Question</legend>
                       	<input type="text" class="form-control" name="memberId" value="${ loginMember.memberId }" hidden>
 						<input type="number" class="form-control" name="srNo" value="${ roomInfo.srNo }" hidden/>
                        <textarea id="testQestion" name ="testQeustion" placeholder="문제를 입력해 주세요" rows="12" class="col-lg-12"></textarea>
                            
                        </fieldset>
                        <br>
                        <div class="col-lg" style=" background-color: #FFF0F0; border-radius: 15px;">
                            
                                <br>
                                <div class="custom-file mb-3">
                                    <input type="file" class="custom-file-input" id="upFile" name="upFile"">
                                    <label class="custom-file-label" for="upFile">문제에 관련된 사진을 첨부할 수 있습니다</label>
                                </div>
                            
                        </div>
                        <br>
                        <div class="col-lg" style=" background-color: #FFF0F0; border-radius: 15px; padding-left:6%;">
                            <br>
                            <div class="form-check"">
                                <input type="button" class="btn btn-outline-dark choice1" id="choice1" value="1"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" name="testChoice_1" class="col-lg-10 testChoice1"
                                    style="border-radius: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark choice2" id="choice2" value="2"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" name="testChoice_2" class="col-lg-10 testChoice2"
                                    style="border-radius: 15px; margin-top: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark choice3" id="choice3" value="3"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" name="testChoice_3" class="col-lg-10 testChoice3" 
                                    style="border-radius: 15px; margin-top: 15px;">
                                <br>
                                <input type="button" class="btn btn-outline-dark choice4" id="choice4" value="4"
                                    style="margin-right: 20px; border-radius: 50%;"> <input type="text" name="testChoice_4" class="col-lg-10 testChoice4"
                                    style="border-radius: 15px; margin-top: 15px;">
                            </div>
                            <br>
                        </div>
                        <br><br>
                        <div align = "right"> 
                            <div class="col-md-4" style="background-color: #FFF0F0; border-radius: 15px; padding: 10px; text-align: left;">
                             <label for="testAnswer">정답:</label>
                             <input type="text" id="testAnswer" class="testAnswer" name="testAnswer" />
                            </div>
                        </div>
                    </div>
                    <br><br>
                    <div align="center">
                        <button type="submit" value="저장 " class="btn btn-outline-primary btn-lg" style="margin-right: 30px;">등록 </button>
                        <button type="reset" class="btn btn-danger btn-lg">취소</button>
                    </div>
                    <br>
                </div> 
                </div>             
           
            </div>
</form>
            </div>
            
 
    <script>
    $(".choice1").click(function(){
		return $(".choice1").val();
        });
    $(".choice2").click(function(){
		return $(".choice2").val();
        });
    $(".choice3").click(function(){
		return $(".choice3").val();
        });
    $(".choice4").click(function(){
		return $(".choice4").val();
        }); 
    
    $(".choice1, .choice2, .choice3, .choice4").click(function(event){
		$(".testAnswer").val(event.result);
		
        });
    </script>

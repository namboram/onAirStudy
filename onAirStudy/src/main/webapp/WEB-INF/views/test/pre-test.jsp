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

		<div class="col-sm" style="background-color: white; padding:3%">
			<div>
				<div>
					
					<h2>Pre-test</h2>
					<hr />
				</div>
				<div align="center">
					<div class="col-lg-4"
						style="background-color: #F6E5FE; border-radius: 15px;">
						<h4 style="text-align: center;">오늘의 Test</h4>				
					</div>
					<hr />
				</div>
				<input type="hidden" name="srNo" value="${roomInfo.srNo }" />

				<div class="tq_G">
					<c:forEach items="${testList}" var="t">
							<div class="col-lg questionX"
								style="background-color: #FFF0F0; border-radius: 15px; padding: 15px;">
								<div class="questionBox" style="background-color: white; overflow:auto; border-radius:15px; height:250px; padding:3%">		
								 ${t.testQuestion} <br /><br />
								<c:if test="${t.renamedFilename != null }">
								<img class="testPic" style="height:200px;"
								src="${pageContext.request.contextPath }/resources/testPic/${ t.renamedFilename }"> 
								</c:if>
							
								</div>
								<br> <br> 
								<input type="button" class="btn btn-outline-dark btn-sm choice1" id="choice1" value="1"
									style="margin-right: 10px; border-radius: 50%;">
								<input
									type="text" class="col-lg-10" style="border-radius: 15px;"
									value="${t.testChoice_1}" readonly> <br>
									
								<input type="button" class="btn btn-outline-dark btn-sm choice2" id="choice2"
									value="2" style="margin-right: 10px; border-radius: 50%;">
								<input type="text" class="col-md-10"
									style="border-radius: 15px; margin-top: 15px;"
									value="${t.testChoice_2}" readonly> <br> 
									
								<input
									type="button" class="btn btn-outline-dark btn-sm choice3" id="choice3"
									value="3" style="margin-right: 10px; border-radius: 50%;">
								<input type="text" class="col-lg-10"
									style="border-radius: 15px; margin-top: 15px;"
									value="${t.testChoice_3}" readonly> <br> 
									
								<input
									type="button" class="btn btn-outline-dark btn-sm choice4" id="choice4"
									value="4" style="margin-right: 10px; border-radius: 50%;">
								<input type="text" class="col-lg-10"
									style="border-radius: 15px; margin-top: 15px;"
									value="${t.testChoice_4}" readonly>
									
								<input type="text" id="testAnswer" value="${t.testAnswer}" />
							
							</div>
							<br>		

					</c:forEach>
				</div>

				<div align="center">
					<button type="submit" class="btn btn-outline-primary"
						style="margin-right: 30px;" onclick="submit('${roomInfo.srNo}')">제출하기</button>
				</div>
				<br>
			</div>
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
				$(".userAnswer").val(event.result);			 			
					 			
		        });
	
	
		</script>
		
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
					<div class="modal-body">제출 하시겠습니까?</div>

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
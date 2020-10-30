<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$(document).ready(function(){
   // $('.slider').bxSlider();
});
</script>

<div class="pre_test" style="margin-bottom: 0;">


		<div class="col-lg" style="background-color: white; padding:3%">
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

<%-- <div hidden>
<c:forEach items="${testList}" var="t">
<div class="question">${t.testQuestion}</div>
<div class="pic"><c:if test="${t.renamedFilename != null }">
								<img class="testPic" style="height:200px;"
								src="${pageContext.request.contextPath }/resources/testPic/${ t.renamedFilename }"> 
								</c:if> </div>
<div class="choice1">${ t.testChoice_1 }</div>
<div class="choice2">${ t.testChoice_2 }</div>
<div class="choice3">${ t.testChoice_3 }</div>
<div class="choice4">${ t.testChoice_4 }</div>
<div class="answer">${ t.testAnswer }</div>
</c:forEach></div>	 --%>	
				
					<div id="demo" class="carousel" data-ride="carousel">
					
					<div class="carousel-inner">
					<div class="carousel-item active">
					<div class="col-lg "
								style="background-color: #FFF0F0; border-radius: 15px; padding: 1.5%;">
								<br /><br /><br />
								<div align="center">
								<h1>시험을 시작 하시겠습니까?</h1>
								<br />
								<h3>문제를 옆으로 넘겨주세요</h3>
								<br /><br />
								</div>
						</div>
					</div>
					
					<c:forEach var="t" items="${testList}" varStatus="status">
					<div class="carousel-item">
										
							<div class="col-lg questionX"
								style="background-color: #FFF0F0; border-radius: 15px; padding-left: 8%; padding-top: 3%; padding-bottom: 3%;">
								
								<div class="questionBox col-lg-11" style="background-color: white; overflow:auto; border-radius:15px; height:250px; padding:3%">		
								<div class="row">
								<h3>${t.no}. </h3>
							
								 <div style="padding-left:5%;">${t.testQuestion}</div>
								
								<br />								
								<c:if test="${t.renamedFilename != null }">
								<img class="testPic" style="height:200px;  padding-left:5%;"
								src="${pageContext.request.contextPath }/resources/testPic/${ t.renamedFilename }"> 
								</c:if>
								</div>				
								</div>
								<br> <br> 
								
								
								
								<label for="choice1"><h4>①</h4></label>
								<input type="text" class="col-lg-10" 
									style="border-radius: 15px;" value="${ t.testChoice_1 }" readonly> <br>
									
								<label for="choice2"><h4>②</h4></label>
								<input type="text" class="col-md-10" 
									style="border-radius: 15px; margin-top: 15px;"
									value="${ t.testChoice_2 }" readonly> <br> 
									
								<label for="choice3"><h4>③</h4></label>
								<input type="text" class="col-lg-10" 
									style="border-radius: 15px; margin-top: 15px;"
									value="${ t.testChoice_3 }" readonly> <br> 
									
								<label for="choice4"><h4>④</h4></label>
								<input type="text" class="col-lg-10" 
									style="border-radius: 15px; margin-top: 15px;"
									value="${ t.testChoice_4 }" readonly>															
							</div>
							<br>
							
							</div>
							</c:forEach>
							
							</div>	
							</div>
							
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo"
							data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>
 
					</div>
					</div>
				</div>
				
				<div class="card " style="margin-left:3%; margin-right:3%; border-radius: 15px;">
				<div class="card-header" style="background-color: #FFF0F0; "><h4 align="center">답안지</h4></div>
				<div class="card-body">				
				<div class="answerChoice row" style="margin-left:10%;">
				<c:forEach var="t" items="${testList}" varStatus="status">
				  	<div class="form-check-inline answer">
				  	<h4>${status.count }</h4>  					
       				<input type="radio" class="form-check-input"  name="optradio${status.index}" value="1" ><h4>①</h4>
       				<input type="radio" class="form-check-input"  name="optradio${status.index}" value="2" ><h4>②</h4>
       				<input type="radio" class="form-check-input"  name="optradio${status.index}" value="3" ><h4>③</h4>
       				<input type="radio" class="form-check-input"  name="optradio${status.index}" value="4" ><h4>④</h4>			
     				</div>
			</c:forEach>
     			</div>	
				</div>	
				
				
				<div id="result" class="result col-md-4" style="background-color: #FFF0F0; border-radius: 15px; padding: 10px; text-align: left; display:none;">
				<label for="testAnswer">결과</label>
                <input type="text" id="testAnswer" class="testAnswer" name="testAnswer" />
				</div> 		
				</div>
				<div align="center">
					<button type="button" id="btnShow" class="btn btn-outline-primary" style="margin-bottom:1%;" onclick="submitTest();">제출하기</button>
				</div>
			
				
				
	<script>
	//답 체점하기
	function submitTest(){

	var list = new Array();
	<c:forEach var="itemList" items="${testList}" varStatus="listIdx"  >
		list.push("${itemList.testAnswer}");
	</c:forEach>
		//console.log(list[0]);
		var point = 0;
		var radioList = new Array();
		for(var i=0;i<10;i++){
			radioList.push($('input[name="optradio'+i+'"]:checked').val());
			//console.log($('input[name="optradio'+i+'"]:checked').val());
			if($('input[name="optradio'+i+'"]:checked').val() == list[i]){
				point += 1;
			}else{
				$('input[name="optradio'+i+'"]').parent().css("background-color","tomato");
			}
		};
		$("#testAnswer").val(point+"/10");
		$("#result").show();
	};
	

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
					<div class="modal-body"></div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline">제출</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>

				</div>
			</div>
		</div>



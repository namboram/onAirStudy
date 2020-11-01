<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type ="text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

<style>
    .tq_G {
        columns: 2;
    } 
</style>  
      
            
            <div class="col-sm" style="background-color: white;">
                <div>
                    <div>
                        <h2>Pre-test</h2>
                    </div>
                    <div align="center">
                    
                        <div class="col-lg-4" style="background-color: #F6E5FE; border-radius: 15px; ">
                            <h4 style="text-align: center;">오늘의 Test</h4>
                        
                         	</div>
					<hr />
				<input type="hidden" name="srNo" value="${roomInfo.srNo }" />	
						
		 		<div style="height:520px; overflow:auto; border: solid #F6E5FE 0.5px; padding:1%;">
					<div class="tq_G">
					<div id="pdf_wrap">
					<c:forEach var="t" items="${testList}" varStatus="status">				
										
							<div class="col-lg questionX"
								style="background-color: #FFF0F0; border-radius: 15px; padding-left: 2%; padding-top: 3%; padding-bottom: 2%;">
								
								<div class="questionBox col-lg-11" style="background-color: white; overflow:auto; border-radius:15px; height:250px; padding:3%">		
								<div class="row">
								<h3>${t.no}. </h3>
							
								 <div style="padding-left:5%;">${t.testQuestion}</div>								 
								
								<br />								
								<c:if test="${t.renamedFilename != null }">
								<img class="testPic" style="height:170px;  padding-left:5%;"
								src="${pageContext.request.contextPath }/resources/testPic/${ t.renamedFilename }"> 
								</c:if>
								</div>				
								</div>
								<br>														
													
														
								
								<label for="choice1"><h4>①</h4></label>
								<input type="text" class="col-lg-10" 
									style="border-radius: 15px;" value="${ t.testChoice_1 }" readonly> <br>
									
								<label for="choice2"><h4>②</h4></label>
								<input type="text" class="col-md-10" 
									style="border-radius: 15px; margin-top: 10px;"
									value="${ t.testChoice_2 }" readonly> <br> 
									
								<label for="choice3"><h4>③</h4></label>
								<input type="text" class="col-lg-10" 
									style="border-radius: 15px; margin-top: 10px;"
									value="${ t.testChoice_3 }" readonly> <br> 
									
								<label for="choice4"><h4>④</h4></label>
								<input type="text" class="col-lg-10" 
									style="border-radius: 15px; margin-top: 10px;"
									value="${ t.testChoice_4 }" readonly>															
							</div>
							<br>
							
							
							</c:forEach>
								</div>
							</div>	
							</div>
						
						
				
				</div>
				</div>
				
				<br />
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
				
				
				<div align="center">
				<div id="result" class="result col-md-4" style="background-color: #FFF0F0; border-radius: 15px; padding: 10px; display:none;">
				<label for="testAnswer">결과</label>
                <input type="text" id="testAnswer" class="testAnswer" name="testAnswer" />
				</div> 
				<br />
					<button type="button" id="btnShow" class="btn btn-outline-primary" style="margin-bottom:1%;" onclick="submitTest();">제출하기</button>
					<button type="button" id="create_pdf" class="btn btn-outline-primary" style="display:none;">PDF로 다운받기</button>
				</div>
				<br />
				</div>
						
				</div>
				
				<br />	
				
			
	<script>
	$('#create_pdf').click(function() {
		  //pdf_wrap을 canvas객체로 변환
		html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
			
			  var doc = new jsPDF('p', 'cm'); //jspdf객체 생성
			  
			  var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환

			   var imgWidth = 20; // 이미지 가로 길이 A4 기준
			   var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	           var imgHeight = 28;	           
               

			  	doc.addImage(imgData, 'PNG', 0.5, -3, imgWidth, imgHeight); //이미지를 기반으로 pdf생성
			  	
			  	
			    doc.save('pre_test.pdf'); //pdf저장
		  });

		});
	</script>			
				
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
		
		$("#create_pdf").show();
		$("#btnShow").hide();
	    $("#answers").show() 
	};
	
	</script>				


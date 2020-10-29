<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <style>
 .answerChoice {
	columns: 2;
} 
</style> -->

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
<div id="demo" class="carousel slide" data-ride="carousel">
					
					<div class="carousel-inner">
					<c:forEach items="${testList}" var="t">
					
							<div class="col-lg questionX"
								style="background-color: #FFF0F0; border-radius: 15px; padding: 1.5%;">
								<div class="questionBox" style="background-color: white; overflow:auto; border-radius:15px; height:250px; padding:3%">		
								 ${t.testQuestion}
								  
								<br /><br />
								
								<c:if test="${t.renamedFilename != null }">
								<img class="testPic" style="height:200px;"
								src="${pageContext.request.contextPath }/resources/testPic/${ t.renamedFilename }"> 
								</c:if>
													
								</div>
								<br> <br> 
								
								
								
								<label for="choice1"><h4>①</h4></label>
								<input type="text" class="col-lg-10" id="choice1" name="choice1"
									style="border-radius: 15px;" value="${ t.testChoice_1 }" readonly> <br>
									
								<label for="choice2"><h4>②</h4></label>
								<input type="text" class="col-md-10" id="choice2" name="choice2"
									style="border-radius: 15px; margin-top: 15px;"
									value="${ t.testChoice_2 }" readonly> <br> 
									
								<label for="choice3"><h4>③</h4></label>
								<input type="text" class="col-lg-10" id="choice3" name="choice3"
									style="border-radius: 15px; margin-top: 15px;"
									value="${ t.testChoice_3 }" readonly> <br> 
									
								<label for="choice4"><h4>④</h4></label>
								<input type="text" class="col-lg-10" id="choice4" name="choice4"
									style="border-radius: 15px; margin-top: 15px;"
									value="${ t.testChoice_4 }" readonly>															
							</div>
							<br>
							
							</c:forEach>
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo"
							data-slide="next"> <span class="carousel-control-next-icon"></span>
						</a>


					</div>
				</div>
				
				<div class="card">
				<div class="card-header bg-warning"><h4 align="center">답안지</h4></div>
				<div class="card-body">
				<div class="answerChoice row" style="margin-left:10%;">
				<div class="col-lg-4 row" spnum="1">
				<h4>1.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="2">
				<h4>2.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="3">
				<h4>3.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="4">
				<h4>4.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="5">
				<h4>5.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="6">
				<h4>6.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="7">
				<h4>7.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="8">
				<h4>8.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="9">
				<h4>9.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				<div class="col-lg-4 row" spnum="10">
				<h4>10.</h4>
				<button class="btn" value="1"><h4>①</h4></button>
				<button class="btn" value="2"><h4>②</h4></button>
				<button class="btn" value="3"><h4>③</h4></button>
				<button class="btn" value="4"><h4>④</h4></button>				
				</div>
				
				</div>				
				</div>
				
				<div align="center">
					<button type="submit" class="btn btn-outline-primary" style="margin-bottom:1%;" onclick="submitTest('${roomInfo.srNo}')">제출하기</button>
				</div>
			
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
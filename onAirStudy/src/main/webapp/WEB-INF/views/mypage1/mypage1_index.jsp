<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <fmt:requestEncoding value="utf-8" /> --%>
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="row">
	<div class="col-lg-2">
		<jsp:include page="/WEB-INF/views/mypage1/mypageSideBar.jsp"></jsp:include>
	</div>
	<!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>



	<div class="col-lg-10" style="background-color: #FBF7FD;">

		<h1>My page</h1>
		<hr>
		
		
		<div class="row">
		
	
			<h3>이번달 스터디방별 출석 그래프</h3>
				<div class="col-md-5">
					<canvas id="myChart1"></canvas>
				</div>	
							
			<%-- 	<table>
						<tr>
							<th>출석횟수</th>
						
						</tr>
			<c:forEach items="${ attendList }" var="attend">
						<tr>
							<td>${ attend.attendCnt }</td>
						
						</tr>
			</c:forEach>
					</table> --%>
			
			
			
		<div>
			<h3>
				오늘의 To Do List
				<button type="button" class="btn btn-light"
					onclick="location.href='${ pageContext.request.contextPath }/scheduler/main.do'">캘린더
					보기</button>
			</h3>
			
			<div>
			
							<h4>TO DO LIST</h4>
					<c:forEach items="${ todoList }" var="td">
						<h5> ${ td.scheduleYN } : ${ td.content } </h5>	
					</c:forEach>
			</div>
		</div>




		<div class="row">
			
		</div>

		</div>

		<hr>


		<h3>
			일일 공부시간
			<button type="button" class="btn btn-primary" data-toggle="modal" 
				data-target="#exampleModal" data-whatever="@getbootstrap">시간
				등록하기</button>
		</h3>
		<div class="col-md-7">
			<div>
					<table>
						<tr>
							<th>날짜</th>
							<th>시간</th>
						</tr>
				<c:forEach items="${studytimeList}" var="st">
						<tr>
							<td><fmt:formatDate pattern="yyyy.MM.dd" value="${ st.studyDate }"/></td>
							<td>${ st.studyTime }</td>
						</tr>
				</c:forEach>
					</table>
			</div>
			<canvas id="lineChart"></canvas>
		</div>
	</div>
</div>



<!-- 시간 등록하기 modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<form class="form-studyTime" method="POST" action="${pageContext.request.contextPath}/mypage1_studyTime.do">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일일 공부시간 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">날짜</label> 
							<input type="date" name="studyDate" class="form-control" id="studyDate">
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">공부한 시간</label> <input
								type="number" name="studyTime" class="form-control" id="studyTime">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				
				</div>
			</div>
		</div>
	</form>
</div>



<script>


/* 막대 차트 */

			var ctx = document.getElementById("myChart1").getContext('2d');
			//차트 값 생성

			var labels = new Array();
			var data = new Array();

			<c:forEach items="${ attendList }" var="attend" >
				var json = new Object();
				labels.push( "출석률");
				data.push("${attend.attendCnt}");
			</c:forEach>


				var myChart1 = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "스터디방1", "스터디방2", "스터디방3" ],
					datasets : [ {
						 	label: labels,
				            data: data,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});

	

	
							

			
			



/* 일일 공부시간 그래프 */
			
			var ctxL = document.getElementById("lineChart").getContext('2d');

			var labels = new Array();
			var data = new Array();

			<c:forEach items="${ studytimeList }" var="st" >
				var json = new Object();
				labels.push("${st.studyDate}");
				data.push("${st.studyTime}");
			</c:forEach>

			
			var myLineChart = new Chart(ctxL, {
				type: 'line',
				data: {
/* 				labels: ["January", "February", "March", "April", "May", "June", "July"], */
				labels: labels,
				datasets: [{
				label: labels,
				data: data,
				backgroundColor: [
				'rgba(105, 0, 132, .2)',
				],
				borderColor: [
				'rgba(200, 99, 132, .7)',
				],
				borderWidth: 2
				},
				
				]
				},
				options: {
				responsive: true
				}
			});



			


</script>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

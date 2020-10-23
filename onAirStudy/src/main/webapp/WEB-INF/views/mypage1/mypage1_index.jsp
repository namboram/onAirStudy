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
			<h3>그룹 내 나의 출석률</h3>
			ㅡㅡㅡㅡㅡㅡㅡㅡ띄우기ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			<h3>
				오늘의 To Do List
				<button type="button" class="btn btn-light"
					onclick="location.href='${ pageContext.request.contextPath }/scheduler/main.do'">캘린더
					보기</button>
			</h3>
		</div>

		<div class="row">
			<div class="col-md-5">
				<canvas id="myChart1"></canvas>
			</div>
			ㅡㅡㅡㅡㅡㅡㅡㅡ

			<div>
				<table>
					<tr>
						<th>일정여부</th>
						<th>TO DO LIST 내용</th>
					</tr>
					<tr>
						<%-- <td>${ td.scheduleYN }</td>
					<td>${ td.content }</td> --%>
					</tr>
				</table>
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
				<c:forEach items="${studytimeList}" var="st">
					<table>
						<tr>
							<th>날짜</th>
							<th>시간</th>
						</tr>
						<tr>
							<td>${ st.studyDate }</td>
							<td>${ st.studyTime }</td>
						</tr>
					</table>
				</c:forEach>
			</div>
			<canvas id="lineChart"></canvas>
		</div>
	</div>
</div>



<!-- 시간 등록하기 modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
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
						<label for="recipient-name" class="col-form-label">날짜</label> <input
							type="date" class="form-control" id="studyDate">
					</div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">공부한 시간</label> <input
							type="number" class="form-control" id="studyTime">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="submit" class="btn btn-primary">등록</button>
			</div>
		</div>
	</div>
</div>



<script>

/* modal 등록버튼 */
$('#submit').click(function(){
	 $('#studyDate').text($('#studyDate').val());
     $('#studyTime').text($('#studyTime').val());
    
});

/* 막대 차트 */
			var ctx = document.getElementById("myChart1").getContext('2d');

			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "6월", "7월", "8월", "9월", "10월", "11월" ],
					datasets : [ {
						label : '출석률',
						data : [ 12, 19, 3, 5, 2, 3 ],
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
			var myLineChart = new Chart(ctxL, {
				type: 'line',
				data: {
				labels: ["January", "February", "March", "April", "May", "June", "July"],
				datasets: [{
				label: "나의 일일 공부시간",
				data: [65, 59, 80, 81, 56, 55, 40],
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

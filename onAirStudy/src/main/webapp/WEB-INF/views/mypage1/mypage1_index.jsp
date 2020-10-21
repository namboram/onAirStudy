<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> --%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="row">	
<jsp:include page="/WEB-INF/views/mypage1/mypageSideBar.jsp"></jsp:include>
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<div class="col-lg-10" style="background-color:#FBF7FD; padding: 20px;">
	<h1>My page</h1>
	<hr>
	<div>
		<h3>그룹 내 나의 출석률</h3>
		<div class="col-md-5">
			<canvas id="myChart" style="max-width: 550px; padding:0; margin:0;margin-top:-3em;"></canvas>
		</div>
		<script>
			var ctx = document.getElementById("myChart").getContext('2d');

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
		</script>
	</div>
	<h3>
		오늘의 To Do List
		<button type="button" class="btn btn-light">캘린더 보기</button>
	</h3>
	<h3>
		일일 공부시간
		<button type="button" class="btn btn-light">시간 등록하기</button>
	</h3>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

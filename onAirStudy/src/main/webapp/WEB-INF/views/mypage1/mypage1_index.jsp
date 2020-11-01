<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <fmt:requestEncoding value="utf-8" /> --%>
<%-- 한글 깨짐 방지 --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<style>

  table.type10 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 30px;
    margin-left:20%;
}
table.type10 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: rgb(221, 204, 229);
    margin: 20px 10px;
}
table.type10 tbody th {
    width: 100px;
    padding: 10px;
}
table.type10 .even {
    background: #fdf3f5;
}

</style>


<div class="row">
	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/mypage1/mypageSideBar.jsp"></jsp:include>
	</div>
	<!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	

	<div class="col-lg-10 p-0" style="background-color: #FBF7FD;">
	<div style="padding:3%">
		<h1>My page</h1>
		<hr>
		
		
<!-- 출석 그래프 -->		

			<h3 style="margin-left:5%; margin-top:2%;"><strong>이번달 스터디방별 출석 그래프</strong></h3>
			<div class="row">
						<div class="col-md-5" style= "margin-left:3%; margin-top:5%;">
							<canvas id="myChart1"></canvas>
						</div>	
			
		
			
			
<!-- To Do List-->
            <div class="col-lg-3 col-md-6" style="margin-left:10%; margin-top:-2%;" >
              
              <div class="card to-do" style="border-radius:8%;">
                <h2 class="display h4 m-2 text-center"><strong>오늘의 To do List</strong>
                	<button type="button" class="btn btn-light m-2"
					onclick="location.href='${ pageContext.request.contextPath }/mypage1/goTodo.do'">스케줄러 보기</button></h2>
					<hr>
	                <c:if test="${ empty todoList }">
	                	<p class="text-center">캘린더에서 to do list를 등록해보세요.</p>
					</c:if>					
					
	                <ul class="check-lists list-unstyled" >
		                
		              <c:if test="${ not empty todoList }"> 
		                 <c:forEach items="${ todoList }" var="td" varStatus="status" end="10">
			                  <li class="d-flex align-items-center " style="margin-left:30%;"> 	                 	
				                    <label for="list-1 text-center" style="font-size:17px;">- ${ td.content }</label>
			                  </li>
		                </c:forEach>
		               </c:if>
	                </ul>
              </div>
            </div>
	</div>
	
		<hr>
		
		
		
		
<!-- 공부시간 그래프 -->
		<h3 style="margin-left:5%;">
			<strong>일일 공부시간</strong>
			<button type="button" class="btn btn-light m-2" data-toggle="modal" 
				data-target="#exampleModal" data-whatever="@getbootstrap">시간
				등록하기</button>
		</h3>
		
		<c:if test="${ empty studytimeList }">
			<h4 class="text-center">공부한 날짜와 시간을 등록해보세요.</h4>
			<br>
		</c:if>
		
		<div class="row">
		<div>
			<br>
				
				
				<table class="type10">
				    <thead>
				    <tr>
				        <th>날짜</th>
				        <th>시간</th>
				    </tr>
				    </thead>
				    <tbody>
				    <c:forEach items="${ studytimeList }" var="st" end="6">
				    <tr>
				        <th scope="row">${ st.s_date }</th>
				        <th class="even">${ st.studyTime }</th>
				    </tr>
				    </c:forEach>
				    </tbody>
				</table>
		</div>
			
			<div class="col-md-7">
				<canvas id="lineChart" style="margin-left:5%;"></canvas>
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

</div>


</div>


<script>


/* 막대 차트 */

			var ctx = document.getElementById("myChart1").getContext('2d');
			//차트 값 생성
			var data = new Array();
			<c:forEach items="${ attendList }" var="attend" >
				var json = new Object();
				
				data.push("${attend.attendCnt}");
			</c:forEach>
			
			
				var myChart1 = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [
						<c:forEach items="${ srList }" var="s" >
						'${s["SR_TITLE"]}',	 
						</c:forEach>
						
				],
					datasets : [ {
						 	label: '스터디방별 출석률',
						 	
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
				labels.push("${ st.s_date }"); 
				data.push("${ st.studyTime }");
			</c:forEach>

			
			var myLineChart = new Chart(ctxL, {
				type: 'line',
				data: {
					labels: labels,
				datasets: [{
				label: '날짜별 공부시간',
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

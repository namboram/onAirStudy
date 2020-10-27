<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>


<style>
	.adDivB{
		margin-bottom:100px;
	}
    .bigContainer{
       position: relative;
	   background-color:#e8f4ff;

    }
	.bigContainer div{
		text-align:center;
	}
	#dateB{
		width :30%;
		height: 8%;
		background-color:skyblue;
		margin-left:6%;
	}
	#numberContainerB{
		width:50%;
		height:30%;
		float:left;
		margin-left:15%;
	}
	#rightB div{
		display:inline-block;
		width:100%;
		text-align:left;
		margin-bottom:2%;
		padding-left:20%;
	
	}
	#leftB p{
		display:inline;
		margin-left:30%;
	}
	#rightB p{
		display:inline;
	}
	#rightB, #leftB{
		display:inline-block;
		width:100%;
        height: 100%;
		border:1px solid gray;
		padding:2%;
	}
	#rightB{
		padding-top:3%;
		margin-left:2%;
	}
	#graphB{
		width:70%;
        height:40%;
        margin-left:5%;
		background-color:skyblue;
	}
	#graphB, #numberContainerB, #dateB{
		margin-top:2%;
		margin-bottom:2%;
	}
	#numberContainerB img{
		width:20%;
	}
	.marginB{
		margin-left:30%;
	}
	.colorB{
		color:orange;
	}
</style>

<!-- #e8f4ff -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<div class="row">
	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp" />
	</div>
	<div class="col-lg-10 p-0 .adDivB row">
		<div class="container-fluid row bigContainer">

			<div class="col-xs-12 col-sm-6 col-md-8" id="dateB">
				<h3>Today ${ map["today"] }</h3>
			</div>
			<div class="container-fluid row" id="numberContainerB">
				<div class="col-xs-6 col-md-6 row" id="leftB">
					<div class="col-md-12">
						<img
							src="${ pageContext.request.contextPath }/resources/images/B1.png" />
						<p class="h5">${ map["member_all"] }</p>
					</div>
					<div class="col-md-12">
						<img
							src="${ pageContext.request.contextPath }/resources/images/B2.png" />
						<p class="h5">${ map["msg_all"] }</p>
					</div>
					<div class="col-md-12">
						<img
							src="${ pageContext.request.contextPath }/resources/images/B3.png" />
						<p class="h5">${ map["report_all"] }</p>
					</div>
				</div>

				<div class="col-xs-6 col-md-6 row" id="rightB">
					<div class="col-md-12">
						방갯수
						<p class="marginB">${ map["sr_all"] }</p>
						<p class="colorB">(+${ map["sr_today"] })</p>
					</div>
					<div class="col-md-12">
						게시글
						<p class="marginB">${ map["diary_all"] }</p>
						<p class="colorB">(+${ map["diary_today"] })</p>
					</div>
					<div class="col-md-12">
						댓글
						<p class="marginB">&nbsp;&nbsp;&nbsp;&nbsp;${ map["reply_all"] }</p>
						<p class="colorB">(+${ map["reply_today"] })</p>
					</div>
					<div class="col-md-12">
						첨부파일
						<p class="marginB" style="margin-left: 22%;">${ map["attach_all"] }</p>
						<p class="colorB">(+${ map["attach_today"] })</p>
					</div>
				</div>
			</div>

			<div class="container-fluid row" id="graphB">
				<h3>일자별 가입회원 및 결제회원 통계</h3>
			<div id="columnchart_material" style="width: 800px; height: 500px;"></div> 
			
			</div>

	</div>
</div>
<!-- 구글차트 -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ '일자', '가입회원', '유료회원' ], 
			<c:forEach items="${ memberAll }" var="m">
				[ '${ m.en_date }', ${ m.all_cnt }, ${ m.p_cnt } ],
			</c:forEach>
			]);

		var option = {
				vAxis: {maxValue:10,minValue:0}, 
				};

		var chart = new google.charts.Bar(document
				.getElementById('columnchart_material'));

		chart.draw(data);
	}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />




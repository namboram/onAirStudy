<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<!-- Fontastic Custom icon font-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/fontastic.css">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style.default.css"
	id="theme-stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/jquery.cookie.js"> </script>
<script src="${ pageContext.request.contextPath }/resources/js/Chart.min.js"></script>

<!-- #e8f4ff -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
.adDivB{
		display:inline-block;
		background-color:#e8f4ff;
		padding:100px;
		text-align:center;
	}
</style>

<div class="row">
	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp" />
	</div>
	<div class="col-lg-10 p-0 adDivB" style="text-align:center;">
	
	 <section class="dashboard-counts section-padding">
        <div class="container-fluid">
			<h3>Today ${ map["today"] }</h3>        
        </div>
     </section>
        
	  <!-- Counts Section -->
      <section class="dashboard-counts section-padding">
        <div class="container-fluid">
          <div class="row">
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-user"></i></div>
                <div class="name"><strong class="text-uppercase">회원수</strong><span>Since 2020.10.01</span>
                  <div class="count-number">${ map["member_all"] }</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-padnote"></i></div>
                <div class="name"><strong class="text-uppercase">개설된 방</strong><span>${ map["sr_all"] }</span>
                  <div class="count-number">+${ map["sr_today"] != null ? map["sr_today"] : '0' }</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-check"></i></div>
                <div class="name"><strong class="text-uppercase">신고내역</strong><span>${ map["report_all"] }</span>
                  <div class="count-number">+${ map["report_today"] != null ? map["report_today"] : '0'  }</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-bill"></i></div>
                <div class="name"><strong class="text-uppercase">게시글</strong><span>${ map["diary_all"] }</span>
                  <div class="count-number">+${ map["diary_today"] != null ? map["diary_today"] : '0'  }</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-list"></i></div>
                <div class="name"><strong class="text-uppercase">댓글</strong><span>${ map["reply_all"] }</span>
                  <div class="count-number">+${ map["reply_today"] != null ?map["reply_today"] : '0'  }</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-4 col-6">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-list-1"></i></div>
                <div class="name"><strong class="text-uppercase">첨부파일</strong><span>${ map["attach_all"] }</span>
                  <div class="count-number">+${ map["attach_today"] != null ? map["attach_today"] : '0'  }</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Header Section-->
      
      	<div class="row" style="padding:5%;">
            <div class="col-lg-10 col-md-12 flex-lg-last flex-md-first align-self-baseline" style="margin-left:10%;">
              <div class="card sales-report" id="realGraph">
                <h2 class="display h4" style="margin:2%;">일자별 가입회원 및 유료회원 통계</h2>
                <p>2020.10.20 ~ 2020.10.24까지의 통계</p>
                <div class="line-chart">
                  <canvas id="barChartExample"></canvas>
                </div>
              </div>
            </div>
        </div>
	
	
	
	
	
	
	</div>
<!-- 구글차트 -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

		var brandPrimary = 'rgba(51, 179, 90, 1)';
		var BARCHARTEXMPLE = $('#barChartExample');

		var barChartExample = new Chart(BARCHARTEXMPLE, {
	        type: 'bar',
	        data: {
	            labels: [
	            	<c:forEach items="${ memberAll }" var="m">
						'${ m.en_date }',
					</c:forEach>
	            	],
	            datasets: [
	                {
	                    label: "가입회원",
	                    backgroundColor: [
	                        'rgba(51, 179, 90, 0.6)',
	                        'rgba(51, 179, 90, 0.6)',
	                        'rgba(51, 179, 90, 0.6)',
	                        'rgba(51, 179, 90, 0.6)',
	                        'rgba(51, 179, 90, 0.6)'
	                    ],
	                    borderColor: [
	                        'rgba(51, 179, 90, 1)',
	                        'rgba(51, 179, 90, 1)',
	                        'rgba(51, 179, 90, 1)',
	                        'rgba(51, 179, 90, 1)',
	                        'rgba(51, 179, 90, 1)'
	                    ],
	                    borderWidth: 1,
	                    data: [
	                    	<c:forEach items="${ memberAll }" var="m">
								${ m.all_cnt },
							</c:forEach>
			
	                    	],
	                },
	                {
	                    label: "유료회원",
	                    backgroundColor: [
	                        'rgba(203, 203, 203, 0.6)',
	                        'rgba(203, 203, 203, 0.6)',
	                        'rgba(203, 203, 203, 0.6)',
	                        'rgba(203, 203, 203, 0.6)',
	                        'rgba(203, 203, 203, 0.6)'
	                    ],
	                    borderColor: [
	                        'rgba(203, 203, 203, 1)',
	                        'rgba(203, 203, 203, 1)',
	                        'rgba(203, 203, 203, 1)',
	                        'rgba(203, 203, 203, 1)',
	                        'rgba(203, 203, 203, 1)'
	                    ],
	                    borderWidth: 1,
	                    data: [
	                    	<c:forEach items="${ memberAll }" var="m">
							${ m.p_cnt },
							</c:forEach>

	                    	],
	                    	options: {
	                			responsive: false,
	                			scales: {
	                				yAxes: [{
	                					ticks: {
	                						beginAtZero: true,
	                						min: 0
	                					}
	                				}]
	                			}
	                		}
	                }
	            ]
	        }
	    });

		
	});
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />




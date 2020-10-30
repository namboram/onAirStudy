<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$(document).ready(function(){
    $('.slider').bxSlider();
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

				
					<div id="demo" class="carousel" data-ride="carousel">
					
					
					
					<div class="col-lg "
								style="background-color: #FFF0F0; border-radius: 15px; padding: 1.5%;">
								<br /><br /><br />
								<div align="center">
								<h1>시험 문제가 준비 되어 있지 않습니다.</h1>
								<br />
								<h3>문제를 등록해주세요</h3>
								<br /><br />
								</div>
						</div>
					</div>
					</div>
					</div>
					</div>
					

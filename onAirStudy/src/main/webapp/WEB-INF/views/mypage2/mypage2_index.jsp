<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>
<style>
.col-sm-4, .col-sm-8{
	text-align: center;
}
</style>
		<section class="forms">
			<div class="container-fluid">
				<!-- Page Header-->
				<header>
					<h1 class="h3 display">우리 스터디방</h1>
				</header>
				<div class="row">
					<div class="col-lg-11">
						<div class="card">
							<div class="card-header d-flex align-items-center">
								<label class="col-sm-12 form-control-label" style="text-align:center">${roomInfo.srTitle }</label>
							</div>
							<div class="card-body">
								<p style="color: #888;">${roomInfo.srComment }</p>
								<form class="form-horizontal">
									<div class="form-group row">
										<label class="col-sm-4 form-control-label">우리방 목표</label>
										<div class="col-sm-8">
											<p>${roomInfo.srGoal }</p>
										</div>
										<input type="hidden" name="hiddenAttend" value="${attendList }" />
									</div>
									<hr />
									<div class="form-group row">
										<label class="col-sm-4 form-control-label">출석체크</label>
										<div class="col-sm-8">
											<p>매주 월,수,금</p>
											<p>월 pm 5:00</p>
											<p>수 pm 5:00</p>
											<p>금 pm 5:00</p>
										</div>
									</div>
									<hr />
									<c:if test="${roomInfo.forceExitYN == 'Y'}">
										<div class="form-group row">
											<label class="col-sm-4 form-control-label">우리방 규칙</label>
											<div class="col-sm-8">
												<p>팀장 경고 누적 ${ roomInfo.forceExitOpt }회시 자동 탈퇴 처리</p>
											</div>
										</div>
										<hr />
									</c:if>	
									<div class="form-group row">
											<label class="col-sm-4 form-control-label">출석현황</label>
											<div class="col-sm-8">
												<p>전체 출석 일수  : ${roomInfo.attendanceCnt}days</p>
												<c:forEach var="attend" items="${attendList }">
													<p>${attend.memberId } : ${attend.attendCnt }</p>
												</c:forEach>
											</div>
										</div>
									<hr />								
									<div class="form-group row">
										<div class="col-sm-5 offset-sm-7">
											<button type="submit" class="btn btn-primary">방 정보 수정</button>
											<button type="submit" class="btn btn-primary">스터디 탈퇴</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

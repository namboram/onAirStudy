<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/invitation.css">



<div id="invitation" style="margin-bottom: 0px;">

	<div class="col-lg" style="background-color: #FBF7FD; padding: 5%; height:100%;">
		<h2 class="text-gray">Invitation List</h2>
		<hr>
		<div class="container">
			<div class="col-sm"
				style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; margin-left:7%; padding: 20px; height:86.5%; width:85%;">
				<h3>나를 초대한 스터디 그룹</h3>
				<table class="table">
					<thead class="thead-rounded">
						<tr>
							<th></th>
							<th>그룹 이름</th>
							<th>그룹 소개</th>
							<th>초대자</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%-- 	<input type="text" value="${member.memberId}" name="memberId" hidden/> --%>
						<c:forEach items="${ inList }" var="invitation">
							<c:if test="${invitation.invitedId eq loginMember.memberId }">
							<input type="text" name="srNo" id="srNo" value="${invitation.srNo}" hidden/>
							<input type="text" name="mId" id="mId" value="${loginMember.memberId}" hidden/>
							
								<tr>
								<c:if test="${invitation.invitationYN =='N'}">
									<td ></td>														
									<td >${invitation.sTitle}</td>
									<td >${invitation.sGoal}</td>
									<td >${invitation.hostingId}</td>

									<td >
										<button type="submit" class="btn btn-outline-primary"
											onclick="updateInvi('${ invitation.srNo }')">수락</button>
										<button type="button" class="btn btn-primary"
											onclick="deleteInvi('${ invitation.srNo }')">거절</button>
									</td>
										</c:if>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>


			</div>

		</div>
	</div>
</div>



<!-- The Modal -->
<div class="modal fade" id="myModal_ok" role="dialog"
	aria-labelledby="deleteMemoModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header" style="color: #E2A182;">
				<h4 class="modal-title">초대 수락</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<form
				action="${ pageContext.request.contextPath }/mypage1/updateInvitation.do"
				id="uadateInvitation" method="POST">
				<input type="text" name="no" hidden/>
				<!-- Modal body -->
				<div class="modal-body">초대를 수락 하시겠습니까?</div>
				<input type="text" name="memberId" value="${loginMember.memberId}" hidden />

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-outline">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</form>

		</div>
	</div>
</div>

<script>
	function updateInvi(no) {
		$("#myModal_ok").modal().find("[name=no]").val(no);
	}
</script>


<!-- The Modal -->
<div class="modal fade" id="myModal_no" role="dialog"
	aria-labelledby="deleteMemoModalTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">초대 거절</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<form
				action="${ pageContext.request.contextPath }/mypage1/deleteInvitation.do"
				id="deleteInvitation" method="POST">
				<input type="hidden" name="no" />
				<div class="modal-body">초대를 거절 하시겠습니까?</div>
				<!-- Modal footer -->

				<div class="modal-footer">
					<button type="submit" class="btn btn-outline">확인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
				</div>
			</form>


		</div>
	</div>
</div>

<script>
	function deleteInvi(no) {
		$("#myModal_no").modal().find("[name=no]").val(no);
	}
</script>



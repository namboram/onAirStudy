<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberDetail.css" />
<div class="col-lg p-0">
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
</div>
<div class="row">
	<div class="col-lg-2 p-0">
		<jsp:include page="/WEB-INF/views/mypage1/mypageSideBar.jsp"></jsp:include>
	</div>
	
	<div class="col-lg-10 p-0" id="member-update-container" style="height:100%;">
	<div style="padding:5%;">
	<h4>내정보</h4>
	<hr />

		
		<div id=updatefrm-left>
			<h5>내 정보 수정</h5>
			<hr />

		<div id="updatefrm-left" style="margin-bottom:10%;">

			<form id="memberUpdateFrm1" 
				  action="${pageContext.request.contextPath}/mypage1/memberUpdate.do" 
				  onsubmit="return MupdateValidate();"
				  method="post">
					<!-- <label id="form-control-labelS">
						<span id="content-labelS">ID</span>				
					</label> -->
				<div class="flex flex-col mb-4">
					<label for="id">ID</label>
					<input type="text" class="form-control" placeholder="아이디" name="memberId" id="memberId" value="${ loginMember.memberId }"  readonly/>
				</div>
				
				<input type="text" class="form-control" placeholder="비밀번호" name="password" id="password_" value="${ loginMember.password }" required />
				<input type="password" class="form-control" placeholder="비밀번호체크" name="passwordCheck" id="passwordCheck_" value="${ loginMember.password }" required/>
				<input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" value="${ loginMember.memberName }" readonly />
				<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="${ loginMember.phone }" required />
				<input type="text" class="form-control" placeholder="자기소개" name="comment" id="comment" value="${ loginMember.comment }" />
				
				<input type="text" class="bottom-form-control" placeholder="성실포인트" name="diligentPoint" id="diligentPoint" value="${ loginMember.diligentPoint }" readonly />
				<input type="text" class="bottom-form-control" placeholder="블랙리스트" name="blacklist" id="blacklist" value="${ loginMember.blacklist }" readonly />
				<br />
				<%-- <input type="hidden" name="memberId" value="${ loginMember.memberId }" /> --%>
				<input type="submit" class="btnS" value="수정" >&nbsp;
				<input type="reset" class="btnS" value="취소">
				
				
				<input type="button" class="btnS" onclick="deleteMember();" value="회원탈퇴">
			
			</form>
			<form action="${ pageContext.request.contextPath }/member/deleteMember.do" 
				  id="memberDeleteFrm" 
				  method="POST">
				<input type="hidden" value="${ loginMember.memberId }" name="memberId" />
			</form>
			<form id="memberUpdateFrm2"
				  action="${pageContext.request.contextPath}/mypage1/uploadProfile.do"
			      onsubmit="return uploadProfileValidate();" 
			      method="POST"
			      enctype="multipart/form-data">
				<div class="mProfile-container">
					<input type="file" class="file-input" name="upFile" id="upFile1" value="프로필사진 첨부"  >
					<label class="file-label" for="upFile1" id="profile-title">파일을 선택하세요</label> 
					<input type="file" id="input-file" class="upload-hidden" />
					<input type="submit" class="btnS" value="업로드" >
				</div>
			</form>
		</div>
<<<<<<< HEAD
=======
	</div>
	</div>
</div>
<script>
function uploadProfileValidate(){
>>>>>>> branch 'master' of https://github.com/ekfhd/onAirStudy.git

	
	<div id="updatefrm-rt">
		<h5>결제 내역</h5>
		<table class="table" class="table table-striped table-hover">
	    <tr class="header">
	      <th>번호</th>
	      <th>일시</th>
	      <th>금액</th>
	    </tr>
	    <c:forEach items="${ list }" var="payment">
	    <tr>
	      <td>${ payment.no }</td>
	      <td><fmt:formatDate value="${ payment.paymentDate }" pattern="yy/MM/dd"/></td>
	      <td>${ payment.paymentAmount }</td>
		</tr>
		</c:forEach>
		</table>
	</div>
	
 </div>
</div>


<script>
function deleteMember(){
	if(confirm("정말 삭제하시겠습니까?") == false)
		return;
	var $frm = $("#memberDeleteFrm");
	/* $frm.find("[name=memberId]").val(memberId); */
	$frm.submit();
}

function uploadProfileValidate(){
	/* if($("#upFile1").val() == null){
		alert("프로필사진을 넣어주세요");
		return false;
	}
	if($("#input-file").val() == null){
		alert("프로필사진을 넣어주세요");
		return false;
	}
	if($("#profile-title").val() == null){
		alert("프로필사진을 넣어주세요");
		return false;
	} */
	return true;
}

function MupdateValidate(){
	//비밀번호 똑같은지
    if($("#password_").val() != ($("#passwordCheck_").val())){ 
	    alert("비밀번호가 틀렸네용.");
	    $("#password_").val("");
	    $("#passwordCheck_").val("");
	    $("#password_").focus();
    	return false;
    }
  	//비밀번호
    if(!/^[a-zA-Z0-9]{4,12}$/.test($("#password_").val())) {
    alert("비밀번호는 4~12자리 영문,숫자만  가능해요");
    $("#password_").val("");
    $("#password_").focus();
    return false;
    }
  	//휴대폰번호
	if(!/^[0-9]{11}$/.test($("#phone").val())) {
	alert("휴대폰번호 11자리수를 입력해주세요");
	$("#phone").val("");
	$("#phone").focus();
	return false;
	}

	//자기소개
	if(/^[ㄱ-ㅎ가-힣]{0,20}$/.test($("#comment").val())) {
	alert("자기소개는 20글자 이내로 작성해주세요");
	$("#comment").val("");
	$("#comment").focus();
	return false;
	} 
    
    return true;
}

 $(function(){
	//파일 선택/취소 파일라벨명을 업로드된 파일로 변경한다.
	$("[name=upFile]").on("change", function(){
		//방금 선택한 파일
		var file = $(this).prop('files')[0];
		var $label = $(this).next(".file-label");
	
		if(file == undefined)
			$label.html("파일을 선택하세요");
		else
			$label.html(file.name);
	});
});

 
</script>

<div class="col-lg p-0">
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>


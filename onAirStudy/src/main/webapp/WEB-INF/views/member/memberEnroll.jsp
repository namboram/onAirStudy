<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/member.css" />

<div id="enroll-container" class="mx-auto text-center">
	<form id="memberEnrollFrm" 
		  action="memberEnroll.do" 
		  method="post">
		<table class="mx-auto">
			<tr>
				<th>아이디<span>*</span></th>
				<td>
					<div id="memberId-container">
						<input type="text" 
							   class="form-control" 
							   placeholder="4글자이상"
							   name="memberId" 
							   id="memberId_"
							   required>
						<!--  <span class="guide ok">이 아이디는 사용가능합니다.</span>
						<span class="guide error">이 아이디는 사용할 수 없습니다.</span> 
						0:사용불가, 1:사용가능
						<input type="hidden" id="idValid" value="0" /> -->
						
					</div>
				</td>
			</tr>
			<tr>
				<th>패스워드<span>*</span></th>
				<td>
					<input type="password" class="form-control" name="password" id="password_" required>
				</td>
			</tr>
			<tr>
				<th>패스워드확인<span>*</span></th>
				<td>	
					<input type="password" class="form-control" id="password2" required>
				</td>
			</tr>  
			<tr>
				<th>이름<span>*</span></th>
				<td>	
					<input type="text" class="form-control" name="memberName" id="memberName" required>
				</td>
			</tr>
			
			<tr>
				<th>휴대폰 본인 인증<span>*</span></th>
				<td>	
					<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required>
				</td>
			</tr>
			
			<tr>
				<th>자기소개</th>
				<td>	
					<input type="text" class="form-control" placeholder="15글자 이내로 적어주세요" name="comment" id="comment" maxlength="11" size="15" >
				</td>
			</tr>
			<tr>
				<th>관심카테고리<span>*</span></th>
				<td>
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="category" id="category1" value="1" checked><label  class="form-check-label" for="category1">자격증</label>&nbsp;
						<input type="radio" class="form-check-input" name="category" id="category2" value="2"><label  class="form-check-label" for="category2">면접</label>
						<input type="radio" class="form-check-input" name="category" id="category3" value="3"><label  class="form-check-label" for="category3">입시</label>&nbsp;
						<input type="radio" class="form-check-input" name="category" id="category4" value="4"><label  class="form-check-label" for="category4">취미/예술</label>
						<input type="radio" class="form-check-input" name="category" id="category5" value="5"><label  class="form-check-label" for="category5">컴퓨터/IT</label>&nbsp;
						<input type="radio" class="form-check-input" name="category" id="category6" value="6"><label  class="form-check-label" for="category6">창업</label>
						<input type="radio" class="form-check-input" name="category" id="category7" value="7"><label  class="form-check-label" for="category7">어학</label>&nbsp;
						<input type="radio" class="form-check-input" name="category" id="category8" value="8"><label  class="form-check-label" for="category8">기타</label>
					</div>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="가입완료" >
		<input type="reset" value="취소">
	</form>
</div>
<script>
$("#memberId_").keyup(function(){
	var $this = $(this);

	//처음 작성 또는 재작성하는 경우
	if($this.val().length < 4){
		$(".guide").hide();
		$("#idValid").val(0);
		return;
	}

	console.log($this.val());

	$.ajax({
		url : "${ pageContext.request.contextPath }/member/checkIdDuplicate.do",
		data : {
			memberId : $this.val()
		},
		method : "GET",
		dataType : "json",
		success : function(data){
			console.log(data);
			var $ok = $(".guide.ok");
			var $error = $(".guide.error");
			var $idValid = $("#idValid");

			if(data.isAvailable){
				//아이디사용가능한 경우
				$ok.show();
				$error.hide();
				$idValid.val(1);
			}
			else{
				//아디디 사용불가능한 경우
				$ok.hide();
				$error.show();
				$idValid.val(0);
			}
			
		},
		error : function(xhr, status, err){
			console.log("처리실패!");
			console.log(xhr);
			console.log(status);
			console.log(err);
		}
	});
	
	
}); 

	
$("#password2").blur(function(){
	var $p1 = $("#password_"), $p2 = $("#password2");
	if(p1.val() != p2.val()){
		alert("패스워드가 일치하지 않습니다.");
		$p1.focus();
	}
});
	
$("#memberEnrollFrm").submit(function(){

	//html5 추가된 속성 pattern을 활용해 정규식 검사도 가능하지만,
	//구체적인 피드백제공하지는 못한다.
	var $memberId = $("#memberId_");
	if(/^\w{4,}$/.test($memberId.val()) == false) {
		alert("아이디는 최소 4자리이상이어야 합니다.");
		$memberId.focus();
		return false;
	}

	//사용자 아이디 중복여부
	var $idValid = $("#idValid");
	if($idValid.val() == 0){
		alert("사용가능한 아이디를 입력하세요.");
		$memberId.select();
		return false;
	}
	
	
	return true;
});
</script> -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

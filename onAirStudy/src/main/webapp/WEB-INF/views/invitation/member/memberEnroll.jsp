<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/member.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Secular+One&display=swap" rel="stylesheet">

<div id="enroll-out-container">
	<div id="enroll-out-container">
        <div id="enroll-top-container">
            <img src="${pageContext.request.contextPath }/resources/images/memberenrollimg.png" width="40" height="40"/>  
            <h1>ONAIR STUDY</h1>
            <p>Let's start studying at OnAirStudy</p>
        </div>
        <div id="enroll-bottom-container" class="mx-auto text-center">
            <form id="memberEnrollFrm" action="memberEnroll.do" method="post">
                
                <div class="mx-auto" id="member-enroll-table">
                    <h2>Sign up</h2>
                    <br>
                            <div class="formMember" >

                                    <input type="text" 
                                           name="memberId" 
                                           autocomplete="off"
                                           class="form-control" 
                                           id="memberId_"
                                           required>
                                    <label for="memberId" class="label-member">
                                        <span class="content-member">Id</span>
                                    </label>
                                    <span class="guide ok">이 아이디는 사용가능합니다.</span>
                                    <span class="guide error">이 아이디는 사용할 수 없습니다.</span> 
                                   <!--  0:사용불가, 1:사용가능 -->
                                    <input type="hidden" id="idValid" value="0" />
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="password" 
                                class="form-control" 
                                name="password" 
                                id="password_" required>
                                <label for="password" class="label-member">
                                    <span class="content-member">password</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="password" 
                                class="form-control" 
                                name="passwordCheck" 
                                id="passwordCheck_" required>
                                <label for="passwordCheck" class="label-member">
                                    <span class="content-member">password check</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="text" 
                                class="form-control" 
                                name="memberName" 
                                id="memberName" required>
                                <label for="memberName" class="label-member">
                                    <span class="content-member">name</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="tel" 
                                class="form-control" 
                                name="phone" 
                                id="phone" required>
                                <label for="phone" class="label-member">
                                    <span class="content-member">phone</span>
                                </label>
                            </div>
                            <input type="button" value="휴대폰인증.." onclick="popupCertification()" />
                            <br>
                            <div class="formMember">
                                <input type="text" 
                                class="form-control" 
                                name="comment" 
                                id="comment" required>
                                <label for="comment" class="label-member">
                                    <span class="content-member">comment</span>
                                </label>
                            </div>
                            <br>

                            <div class="custom-checkbox">
                                <span>관심카테고리(1개만 선택가능)</span>
                                <hr class="memberHr">
                                <fieldset class="fieldset-category">
                                    <input type="checkbox" class="form-check-input" name="category" id="category1" value="1" checked><label  class="form-check-label" for="category1"><em></em>자격증</label>&nbsp;
                                    <input type="checkbox" class="form-check-input" name="category" id="category2" value="2"><label  class="form-check-label" for="category2"><em></em>면접</label>
                                    <input type="checkbox" class="form-check-input" name="category" id="category3" value="3"><label  class="form-check-label" for="category3"><em></em>입시</label>&nbsp;
                                   <input type="checkbox" class="form-check-input" name="category" id="category4" value="4"><label  class="form-check-label" for="category4"><em></em>취미/예술</label>
                                   <br>
                                  <input type="checkbox" class="form-check-input" name="category" id="category6" value="6"><label  class="form-check-label" for="category6"><em></em>창업</label>
                                 <input type="checkbox" class="form-check-input" name="category" id="category5" value="5"><label  class="form-check-label" for="category5"><em></em>컴퓨터/IT</label>&nbsp;
                                  <input type="checkbox" class="form-check-input" name="category" id="category7" value="7"><label  class="form-check-label" for="category7"><em></em>어학</label>&nbsp;
                                  <input type="checkbox" class="form-check-input" name="category" id="category8" value="8"><label  class="form-check-label" for="category8"><em></em>기타</label>
                                </fieldset>
                           </div>
		</div>
		<br />
		<input type="submit" value="가입완료" id="enroll-submit">
		<br />
		<input type="reset" value="취소" id="enroll-reset">
	</form>
</div>
</div>
</div>
<script>

/* 휴대폰번호 인증 팝업 */
function popupCertification(){

	//1.팝업
	var url = "<%= request.getContextPath() %>/member/#";
	var title = "123phone-certification";
	var spec = "width=400,height=200,left=300,top=50,scrollbar=no";
	open(url, title, spec);

	//2.폼관련
	var $frm = $("[name=phone-certification]")
	$frm.attr("action",
			  '<%= request.getContextPath() %>/member/sendSms.do');
	$frm.attr("method", "POST");
	$frm.attr("target", title);//폼과 팝업창 연결
	$frm.submit();
}

/* 체크박스 체크 한개만 가능하도록  */
$(document).ready(function(){
	$('input[type="checkbox"][name="category"]').click(function(){

		if($(this).prop('checked')){
			$('input[type="checkbox"][name="category"]').prop('checked',false);
			$(this).prop('checked',true);
		}
	});
});

/* 회원가입-유효성검사 */
/* 아이디중복검사 ajax  */
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

/* 비밀번호체크  */	
$("#password2").blur(function(){
	var $p1 = $("#password_"), $p2 = $("#passwordCheck_");
	if(p1.val() != p2.val()){
		alert("패스워드가 일치하지 않습니다.");
		$p1.focus();
	}
});
/* 아이디중복검사  */	
$("#memberEnrollFrm").submit(function(){

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
</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

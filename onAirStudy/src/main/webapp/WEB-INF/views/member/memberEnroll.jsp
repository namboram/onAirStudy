<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberEnroll.css" />


<div id="enroll-out-container">
	<div id="enroll-out-container">
        <div id="enroll-top-container">
            <img src="${pageContext.request.contextPath }/resources/images/memberenrollimg.png" width="40" height="40"/>  
            <h1>ONAIR STUDY</h1>
            <p>Let's start studying at OnAirStudy</p>
        </div>
        <div id="enroll-bottom-container" class="mx-auto text-center">
            <form id="memberEnrollFrm" action="memberEnroll.do" method="post"  >
                
                <div class="mx-auto" id="member-enroll-table">
                    <h2>Sign up</h2>
                    <br>
                            <div class="formMember" >
                                    <input type="text" 
                                           name="memberId" 
                                           autocomplete="off"
                                           class="form-control" 
                                           id="memberId_" required>									
                                   	<button class="idChk" type="button" id="idChk" onclick="idCheck();" value="N">중복확인</button>
                                   <label for="memberId" class="label-member">
                                        <span class="content-member">Id*</span>
                                    </label> 
                                   <!--  N:사용불가, Y:사용가능 -->
                                    <input type="hidden" id="IdChk" value="N" />
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="password" 
                                class="form-control" 
                                name="password" 
                                id="password_" required>
                                <label for="password" class="label-member">
                                    <span class="content-member">password*</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="password" 
                                class="form-control" 
                                name="passwordCheck" 
                                id="passwordCheck_" required>
                                <label for="passwordCheck" class="label-member">
                                    <span class="content-member">password check*</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="text" 
                                class="form-control" 
                                name="memberName" 
                                id="memberName" required>
                                <label for="memberName" class="label-member">
                                    <span class="content-member">name*</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="tel" 
                                class="form-control" 
                                name="phone" 
                                id="phone" required>
                                <label for="phone" class="label-member">
                                    <span class="content-member">phone*</span>
                                </label>
                            </div>
                            <!--
                             <input type="button" value="휴대폰인증.." onclick="popupCertification()" /> 
                             -->
                            <br>
                            <div class="formMember">
                                <input type="text" 
                                class="form-control" 
                                name="comment" 
                                id="comment" >
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
		<input type="reset" value="취소" id="enroll-reset">
		<br />
		<br />
	</form>
</div>
</div>
</div>
<script>
function idCheck(){
	$.ajax({
		url :"${ pageContext.request.contextPath }/member/idChk.do",
		type : "post",
		dataType : "json",
		data : {"memberId" : $("#memberId_").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다");
			}else if(data == 0){
				$("#IdChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");	
			}
		}
	})
}
<%-- 
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
} --%>

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
$("#memberEnrollFrm").submit(function(){
	
       var getCheck = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지
       var getName= RegExp(/^[가-힣]{2,5}$/); //이름
       var getPhoneCheck =/^[0-9]{11}$/ //폰번호
       var getcommentCheck=/^[ㄱ-ㅎ가-힣A-Za-z~!@#$%^&*()_+|<>?:{}]{0,20}$/ //자기소개
       

     //아이디 공백 확인
       if($("#memberId_").val() == ""){
         alert("아이디 입력바람");
         $("#memberId_").focus();
         return false;
       }
  
       //이름의 유효성 검사
       if(!getCheck.test($("#memberId_").val())){
         alert("아이디를 4~12자리 영문,숫자만 가능해요");
         $("#memberId_").val("");
         $("#memberId_").focus();
         return false;
       }
  
       //비밀번호
       if(!getCheck.test($("#password_").val())) {
       alert("비밀번호는 4~12자리 영문,숫자만  가능해요");
       $("#password_").val("");
       $("#password_").focus();
       return false;
       }

       //비밀번호 공백 확인
       if($("#password_").val() == ""){
         alert("비밀번호 입력바람");
         $("#password_").focus();
         return false;
       }
     //비밀번호체크 공백 확인
       if($("#passwordCheck_").val() == ""){
         alert("비밀번호 입력바람");
         $("#passwordCheck_").focus();
         return false;
       }
  
       //아이디랑 비밀번호랑 같은지
       if ($("#memberId_").val()==($("#password_").val())) {
       alert("비밀번호가 ID와 똑같으면 놉!");
       $("#password_").val("");
       $("#password_").focus();
       return false;
     }
  
       //비밀번호 똑같은지
       if($("#password_").val() != ($("#passwordCheck_").val())){ 
       alert("비밀번호가 틀렸네용.");
       $("#password_").val("");
       $("#passwordCheck_").val("");
       $("#password_").focus();
       return false;
      }
       
  
       //이름 유효성
       if (!getName.test($("#memberName").val())) {
         alert("이름 똑띠 쓰세용");
         $("#memberName").val("");
         $("#memberName").focus();
         return false;
       }

		//휴대폰번호
		if(!getPhoneCheck.test($("#phone").val())) {
		alert("휴대폰번호 11자리수를 입력해주세요");
		$("#phone").val("");
		$("#phone").focus();
		return false;
		}
		
		//자기소개
		if(!getcommentCheck.test($("#comment").val())) {
		alert("자기소개는 20글자이내로 한글작성바랍니다");
		$("#comment").val("");
		$("#comment").focus();
		return false;
		}

		//중복체크여부
	 	/* var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
		}else if(idChkVal == "Y"){
			$("#memberEnrollFrm").submit();
		} 
		 */
     return true;

});

</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

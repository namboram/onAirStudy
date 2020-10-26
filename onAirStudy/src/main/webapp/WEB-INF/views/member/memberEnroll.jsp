<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberEnroll.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Secular+One&display=swap" rel="stylesheet">

<div id="enroll-out-container">
	<div id="enroll-out-container">
        <div id="enroll-top-container">
            <img src="${pageContext.request.contextPath }/resources/images/memberenrollimg.png" width="40" height="40"/>  
            <h1>ONAIR STUDY</h1>
            <p>Let's start studying at OnAirStudy</p>
        </div>
        <div id="enroll-bottom-container" class="mx-auto text-center">
            <form id="memberEnrollFrm" action="memberEnroll.do" method="post" onsubmit="return validate();">
                
                <div class="mx-auto" id="member-enroll-table">
                    <h2>Sign up</h2>
                    <br>
                            <div class="formMember" >

                                    <input type="text" 
                                           name="memberId" 
                                           autocomplete="off"
                                           class="form-control" 
                                           id="memberId_"
>
                                    <label for="memberId" class="label-member">
                                        <span class="content-member">Id*</span>
                                    </label>

                                   <!--  0:사용불가, 1:사용가능 -->
                                    <input type="hidden" id="idValid" value="0" />
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="password" 
                                class="form-control" 
                                name="password" 
                                id="password_">
                                <label for="password" class="label-member">
                                    <span class="content-member">password*</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="password" 
                                class="form-control" 
                                name="passwordCheck" 
                                id="passwordCheck_">
                                <label for="passwordCheck" class="label-member">
                                    <span class="content-member">password check*</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="text" 
                                class="form-control" 
                                name="memberName" 
                                id="memberName">
                                <label for="memberName" class="label-member">
                                    <span class="content-member">name*</span>
                                </label>
                            </div>
                            <br>
                            <div class="formMember">
                                <input type="tel" 
                                class="form-control" 
                                name="phone" 
                                id="phone">
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
function validate() {
       var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디가 적합한지 검사할 정규식

       // 이메일이 적합한지 검사할 정규식

       var id = document.getElementById("memberId_");
       var pw = document.getElementById("password_");

       if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return false;
       }

       if(join.pw.value != join.passwordCheck_.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           join.checkpw.value = "";
           join.checkpw.focus();
           return false;
       }


       if(join.memberName.value=="") {
           alert("이름을 입력해 주세요");
           join.name.focus();
           return false;
       }

       
       alert("회원가입이 완료되었습니다.");
   }

   function check(re, what, message) {
       if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       //return false;
   }
});

</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

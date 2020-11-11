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
	
	<div class="col-lg-10 p-0" id="member-update-container" style="height:80%;">
		<div style="padding:5%;">
			<h4>내정보</h4>
			<hr />
			
				
		<div class='myinformation-container'>
		    <div class='left-containerS'>
		      <h1>결제내역</h1>
		      <div class='payment-history-container'>
		       		<table class="table" class="table table-striped table-hover">
					    <tr class="header">
					      <th>번호</th>
					      <th>일시</th>
					      <th>금액</th>
					    </tr>
					    <c:forEach items="${ list }" var="payment" varStatus="status">
					    <tr>
					      <th><c:out value="${status.count}"/></th>
					      <td><fmt:formatDate value="${ payment.paymentDate }" pattern="yy/MM/dd"/></td>
					      <td>${ payment.paymentAmount }</td>
						</tr>
						</c:forEach>
					</table>
		      </div>
	    </div>
	    
	    <div class='right-containerS'>
	      <header>
	      	<form id="memberUpdateFrm1" 
					  action="${pageContext.request.contextPath}/mypage1/memberUpdate.do" 
					  onsubmit="return MupdateValidate();"
					  method="post">
	        <h5>정보수정</h5>
	        <div class='set'>
	          <div class='m-id'>
	            <label for=''>ID</label>
	            <input id='m-id' name="memberId" placeholder="" type='text' value="${ loginMember.memberId }" readonly>
	          </div>
	           <div>
		          <button id='btnS' onclick="">수정</button>
		          <button id='btnS'>취소</button>
	           </div>
	        </div>
	
	        <div class='set'>
	          <div class='m-pwd'>
	            <label for=''>Password</label>
	            <input id='m-pwd' name="password" placeholder="" type='password'>
	          </div>
	          <div class='m-pwdcheck'>
	            <label for=''>Password Check</label>
	            <input id='m-pwdcheck' name="passwordCheck" placeholder='' type='password'>
	          </div>
	        </div>
	        <div class='set'>
	          <div class='m-name'>
	                <label for=''>Name</label>
	                <input id='m-name' name="memberName" placeholder="" type='text' value="${ loginMember.memberName }" readonly>
	          </div>
	          <div class='m-phone'>
	            <label for=''>Phone Number</label>
	            <input id='m-phone' name="phone" placeholder="" type='text' value="${ loginMember.phone }">
	          </div>
	        </div>
	        <div class='set'>
	        	<div class='m-dpoint'>
		            <label for=''>DiligentPoint</label>
		            <input id='m-dpoint' name="diligentPoint" placeholder="Pet's breed" type='text' value="${ loginMember.diligentPoint }" readonly>
	          	</div>
	          	<div class='m-blacklist'>
	            <label for=''>Blacklist</label>
	            <input id='m-blacklist' name="blackList" placeholder="" type='text' value="${ loginMember.blacklist }" readonly>
	          </div>
	        </div>
	       	<div class='m-comment'>
	            <label for=''>Comment</label>
	            <input id='m-comment' name="comment" placeholder="" style="width:100%; maxlength:20;" type='text' value="${ loginMember.comment }">
	        </div>
	        </form>
	        
	      </header>
	      <div class="button-container">
	         <!--사진업로드-->
	          <div class='m-photo'>
	            <form id="memberUpdateFrm2"
					  action="${pageContext.request.contextPath}/mypage1/uploadProfile.do"
				      onsubmit="return uploadProfileValidate();" 
				      method="POST"
				      enctype="multipart/form-data">
					<div class="mProfile-container">
						<input type="file" class="file-input" name="upFile" id="upFile1" value="프로필사진 첨부"  >
						<label class="file-label" for="upFile1" id="profile-title">클릭해서 프사 선택</label> 
						<input type="file" id="input-file" class="upload-hidden" />
						
						<input type="submit" class="btnS" id="btnS" onclick="uploadS();" value="업로드" >
					</div>
				</form>
	        <div class='set'>
	          <button id='btnout'  onclick="deleteMember();">회원탈퇴</button>
	        </div>
	      <form action="${ pageContext.request.contextPath }/member/deleteMember.do" 
					  id="memberDeleteFrm" 
					  method="POST">
					<input type="hidden" value="${ loginMember.memberId }" name="memberId" />
		  </form>
	          </div>
	      </div>
	    </div>
	  </div>
		
		
	</div>
  </div>
</div>
<script>
//회원탈퇴
function deleteMember(){
	if(confirm("정말 삭제하시겠습니까?") == false)
		return;
	var $frm = $("#memberDeleteFrm");
	$frm.submit();
}
//업로드 버튼 클릭시 검사
function uploadS(){
	var file = $(this).prop('file');
	
	if( file == undefined ){
		/* alert("프로필사진을 지정해주세요"); */
		return false;
	}
	return true;
}
//프로필사진 업로드
function uploadProfileValidate(){
	return true;
} 


//수정폼 유효성검사
function MupdateValidate(){
	//비밀번호 똑같은지
    if($("#m-pwd").val() != ($("#m-pwdcheck").val())){ 
	    alert("비밀번호가 틀렸네용.");
	    $("#password_").val("");
	    $("#m-pwdcheck").val("");
	    $("#m-pwd").focus();
    	return false;
    }
  	//비밀번호
    if(!/^[a-zA-Z0-9]{4,12}$/.test($("#m-pwd").val())) {
    alert("비밀번호는 4~12자리 영문,숫자만  가능해요");
    $("#m-pwd").val("");
    $("#m-pwd").focus();
    return false;
    }
  	//휴대폰번호
	if(!/^[0-9]{0,11}$/.test($("#m-phone").val())) {
	alert("휴대폰번호 11자리수를 입력해주세요");
	$("#m-phone").val("");
	$("#m-phone").focus();
	return false;
	}

	//자기소개
	if(/^[ㄱ-ㅎ가-힣A-Za-z~!@#$%^&*()_+|<>?:{}]{0,20}+$/.test($("#m-comment").val())) {
	alert("자기소개는 20글자 이내로 작성해주세요");
	$("#m-comment").val("");
	$("#m-comment").focus();
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


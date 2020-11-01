<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>프리미엄 카카오페이 결제창 </title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
</head>
<body>

<script>
$(function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp40686526');
			
		IMP.request_pay({
		    pg : 'kakaopay' , // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '(주)OAS',
		    amount : 13000
		  
		}, function(rsp) {
		    if ( rsp.success ) {
	
		        var msg = '결제가 완료되었습니다.';
		        msg += '결제 금액 : ' + rsp.paid_amount;
				
			     window.close();
		      	 window.opener.location="${  pageContext.request.contextPath }/pay/payHistory?memberId=${loginMember.memberId}";  
			
				//세션에 로그인한 아이디값이 value로 들어간다
		       /*  $('input#memberId').val(session.getAttribute("memberId"));
				console.log("$('input#memberId').val()");*/
				
	
			} else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		      	//실패시 이동할 페이지
	            location.href="${ pageContext.request.contextPath }/premium.do";
	            alert(msg); 
		    }
		    
		    
		});

	            
	
}); 



</script>
 	
</body>
</html>
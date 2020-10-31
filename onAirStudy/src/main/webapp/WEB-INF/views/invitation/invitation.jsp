<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />


<link rel="stylesheet"	href="${ pageContext.request.contextPath }/resources/css/leejihye.css"	id="theme-stylesheet">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/custom.css">
<!-- <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/vendor/font-awesome/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/icons-reference/styles.css">
<style>
#invivationSearch{
	text-align: center;
}

#invivationSearch hr{
	margin: 0 auto;
}

</style>
<div id="invivationSearch">
	<header>
		<h1 class="h3 display">초대하기</h1>
	</header>
	<div class="col-lg-11 p-0" style="margin: 0 auto; margin-top: 2.5em">
		<div class="card">
			<div class="card-header align-items-center">
				<div class="row">
					<div class="col-sm-10">
						<input type="text" class="form-control" id="searchId" placeholder="아이디를 입력하세요">
					</div>
					<div class="col-sm-2 ">
						<button type="button" class="btn btn-primary" onclick="searchMember()">Search</button>
					</div>
				</div>
			</div>
			<div class="card-body">
				<table class="table" style="margin-bottom: 0px" id="invitationTable">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>초대</th>
					</tr>
				</table>
				<hr />
			</div>
		</div>
	</div>
</div>

<script>
function searchMember(){

	$.ajax({
		url : "${pageContext.request.contextPath}/invitation/searchMember.do",
		type : "POST",
		data : {
			searchId : $("#searchId").val(),
			roomNum : ${roomInfo.srNo}
		},
		dataType : "json",
		success : function(data) {
			 	console.log(data);
			 	displayTableData(data);
		},
		error : function(xhr, status, err) {
			console.log("처리실패!");
			console.log(xhr);
			console.log(status);
			console.log(err);
		}

	});

}


function displayTableData(data){

	initTable();
	

	var $container = $("#invitationTable");

	var html = "";
	if(data.length > 0){
		for(var i in data){
			
			var m = data[i];

			 html += "<tr>"
			  + "<td>" + i +"</td>"
			  + "<td>" + m.memberId +"</td>"
			  + "<td>" + m.memberName +"</td>"
			  + "<td><button type='button' class='btn btn-primary btnInvite' value=" + m.memberId +" id='btn" + i +"' onclick='inviteMember(this.value, this.id)'>Invite</td>"
			  + "</tr>";   
		  
		}
	}else{
		html += "<tr><td colspan='4'>검색된 회원이 없습니다</td></tr>";
	}

	$container.append(html);
}

function inviteMember(memberId, id){

	console.log(id);

	 $.ajax({
		url : "${pageContext.request.contextPath}/invitation/invite.do",
		type : "POST",
		data : {
			invitedId : memberId,
			hostingId : "${loginMember.memberId}",
			srNo : "${roomInfo.srNo}"
		},
		dataType : "json",
		success : function(result) {
		 	if(result > 0){
			 	alert("초대신청를 보냈습니다");
			 	$("#" +id).addClass('btn-secondary');
				$("#" +id).removeClass('btn-primary');
		 	}
		 	
			 	
		},
		error : function(xhr, status, err) {
			console.log("처리실패!");
			console.log(xhr);
			console.log(status);
			console.log(err);
		}

	}); 
		

}


function initTable(){

	var html = "<tr>"
			+ "<th>번호</th>"
			+ "<th>아이디</th>" 
			+ "<th>이름</th>"
			+ "<th>초대</th>"
			+ "</tr>";
	
	
	$("#invitationTable").html(html);

	
}
</script>

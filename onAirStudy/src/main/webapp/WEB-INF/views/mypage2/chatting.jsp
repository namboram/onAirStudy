<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <!-- moment()함수 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- modal()함수 --> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

<!-- modal / bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- socket -->
<script
	src="${pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
/* .chatcontent {
	overflow: auto;
	height: 100%;
	position: relative;
}   */
.chat-containerK {
	overflow: hidden;
}

.chatcontent {
	height: 500px;
	overflow-y: scroll;
}

.chat-fix {
	position: fixed;
	bottom: 0;
	width: 100%;
}
.fix_btn{
	/*  display : inline-bolck;*/
	float : left;
}
#alertK{
	display : none;
}
#msgi{	
	resize: none;
}
</style>

<div id="chat-containerK">

	<div class="chatWrap">
	<!-- The Report Modal -->

		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">신고하기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<input type="hidden" id="contentIdK" value=""/>
						<div class="form-group">
						<label for="reportCategK">신고 카테고리</label>
						<select class="form-control" id="reportCategK" name="reportCategK">
							<option value="1">음담패설</option>
							<option value="2">부적절한 홍보</option>
							<option value="3">비방 또는 욕설</option>
						</select>
						</div>
						<hr />
						<h5>신고 대상 : <strong id="reportIdK"></strong></h5>
						
						<h5>신고 내용</h5>
						<div id="reportContents">
							
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick="doReport();">신고하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div class="main_tit">
			<h1>방 이름 [ ${roomNo}번 ] 아이디[${loginMember.memberId}]</h1>
		</div>
		<div class="content chatcontent" data-room-no="${roomNo}"
			data-member="${loginMember}">
			<ul id="list-guestbook">
				<c:forEach items="${firstList}" var="chat">
					<!-- 내 채팅일 경우 -->
					<c:if test="${loginMember.memberId eq chat.memberId}">
					<li data-no="${chat.no}">
					<strong>${chat.no}</strong> <strong>${chat.memberId}</strong>
					<div class="row">
					<c:if test="${chat.vaildYN eq 'Y'}">
					<pre class="bg-light text-muted p-2 m-2">신고된 채팅입니다.</pre> 
					</c:if>
					<c:if test="${chat.vaildYN ne 'Y'}">
					<pre class="bg-light p-2 m-2">${chat.chatContent }</pre> 
					</c:if>
					<strong><fmt:formatDate value="${chat.sendDate }" pattern="yy/MM/dd HH:mm:ss" /></strong></div></li>
					</c:if>
					<!-- 다른사람의 채팅일 경우 -->
					<c:if test="${loginMember.memberId ne chat.memberId}">
					<li data-no="${chat.no}">
					<strong>${chat.no}</strong> <strong>${chat.memberId}</strong>
					<div class="row">
					<c:if test="${chat.vaildYN eq 'Y'}">
					<pre class="bg-secondary text-muted p-2 m-2">신고된 채팅입니다.</pre> 
					</c:if>
					<c:if test="${chat.vaildYN ne 'Y'}">
					<pre class="bg-secondary p-2 m-2">${chat.chatContent }</pre> 
					</c:if>
					<strong><fmt:formatDate value="${chat.sendDate }" pattern="yy/MM/dd HH:mm:ss" />
					<a href='#' class='reportModalK'>신고</a></strong></div></li>
					</c:if>
				</c:forEach>
			</ul>
			<div class="box"></div>
		</div>
		<div class="chat-fixK">
			<div id="alertK" onclick="moveDown();" class="alert alert-success" role="alert">
				<strong>Well done!</strong> You successfully read
			</div>
			<div class="fix_btn row">
				<textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea>
				<!-- <input type="text" id="msgi" name="msg" placeholder="메세지를 입력하세요" /> -->
				<button type="button" class="send col-sm-4 btn btn-secondary">보내기</button>
			</div>
		</div>

	</div>
</div>
<script>
//생성된 메시지로 가기//맨 아래로 가기
function moveDown(){
	$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
	$('#alertK').css('display','none');
	
}
//신고하기 버튼
function doReport(){
	if(confirm("신고 하시겠습니까?")) {
		$.ajax({
			url : "${pageContext.request.contextPath}/report/insertReport.do",
			type : "POST",
			data :
				{
					contentCategory : "C",
					contentId : $("#contentIdK").val(),
					reporter : "${loginMember.memberId}",
					reportedMember : $("#reportIdK").text(),
					category : $("#reportCategK").val() 
							
				} ,
			dataType : "json",
			success : function(result) {
				if(result > 0)
					alert("신고가 완료되었습니다.");
			},
			error : function(xhr, status, err) {
				console.log("처리실패!");
				console.log(xhr);
				console.log(status);
				console.log(err);
			}
		});
		
	}
}
$(document).ready(function() {
	//시작할때 스크롤 내리기
	$(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
	//신고 클릭시 모달창 열기
	$(document).on("click",".reportModalK",function(){
		$("#myModal").modal('show');
		var content = $(this).closest("strong").prev();
		$("#reportContents").html(content.text());
		var id = content.closest("div").prev();
		$("#reportIdK").html(id.text());
		var contentId = $(this).closest("li");
		$("#contentIdK").val(contentId.attr("data-no"));
		
		
	}); 
	var isEnd = false;
	var isScrolled = false;
	var fetchList = function() {
		if (isEnd == true) {
			return;
		}

		// 채팅 리스트를 가져올 때 시작 번호
		// renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
		// ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
		var endNo = $("#list-guestbook li").first().data("no") || 0;
		console.log("endNo" + endNo);
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/chatList.do?endNo="
					+ endNo + "&roomNo=${roomNo}",
			type : "GET",
			dataType : "json",
			success : function(result) {
				console.log(result[0]);

				// 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
				// 가장 처음 데이터 번호가 1일경우 스크롤 종료
				var length = result.size;
				if (result[0].no == 1) {
					//console.log("resultno"+ result[0].no);
					isEnd = true;
				}
				$.each(result, function(index, vo) {
					var html = renderList(vo,0);
					$("#list-guestbook").prepend(html);

				})
				var position = $('[data-no=' + (endNo - 1)+ ']').offset();//위치값
				console.log(position);
				//$('#chat-containerK').stop().animate({scrollTop : position.top},600,'easeInQuint');
				//window.scrollTo({top:position.top, behavior:'auto'});
				//$(".chatcontent").animate({scrollTop:position},0);
				document.querySelector('.chatcontent').scrollTo({top : position.top,behavior : 'auto'});
				isScrolled = false;
			},
			error : function(xhr, status, err) {
				console.log("처리실패!");
				console.log(xhr);
				console.log(status);
				console.log(err);
			}
		});
	}

	var renderList = function(vo,endNo) {
		//alert("아뭐냐구");
		// 리스트 html을 정의
		var date = moment(vo.sendDate).format('YY/MM/DD HH:mm:ss');
		var html = "";
		if(endNo==0) endNo = vo.no;
		
		//내가 보낸 채팅일 경우
		if(vo.memberId=="${loginMember.memberId}"){
			//신고된 채팅일 경우
			var content ="";
			if(vo.vaildYN == 'Y'){
				content = "<pre class='bg-light text-muted p-2 m-2'>신고된 채팅입니다.</pre>";
			}
			if(vo.vaildYN != 'Y'){
				content = "<pre class='bg-light p-2 m-2'>"+vo.chatContent+"</pre>";
			}
		
		html = "<li class='pull-right' data-no='"+ endNo +"'>"
				+ "<strong>" + endNo + "</strong>"
				+ "<strong>" + vo.memberId + "</strong>"
				+"<div class='row'>"
				+ content
				+ "<strong>" + date + "</strong>"
				+"</div>"
				+ "</li>";

		}
		//남이 보낸 채팅일 경우
		else{
			//신고된 채팅일 경우
			var content ="";
			var report ="";
			if(vo.vaildYN == 'Y'){
				content = "<pre class='bg-secondary text-muted p-2 m-2'>신고된 채팅입니다.</pre>";
			}
			if(vo.vaildYN != 'Y'){
				content = "<pre class='bg-secondary p-2 m-2'>"+vo.chatContent+"</pre>";
				report = "신고";
			}
			html = "<li data-no='"+ vo.no +"'>"
			+ "<strong>" + vo.no + "</strong>"
			+ "<strong>" + vo.memberId + "</strong>"
			+"<div class='row'>"
			+ content
			+ "<strong>" + date + "<a href='#' class='reportModalK'>"+report+"</a></strong>"
			+"</div>"
			+ "</li>";
		
		}
		return html;
			
		

	}
	//무한 스크롤
	$(".chatcontent").scroll(function() {
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();

		//console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );

		// scrollbar의 thumb가 위의1px까지 도달 하면 리스트를 가져옴//말 잘 안들었어
		if (scrollTop < 1 && isScrolled == false) {
			isScrolled = true;
			fetchList();

		}
	})

	////////////////////socket
	//새로운 메시지 알림
	function newAlerts(content,endNo) {
		$('#alertK').css('display','block');
		$('#alertK').html("<strong>"+content.memberId+"</strong>님이 메시지를 보냈습니다.");
	}
	
	$(function() {
		var chatBox = $('.box');
		var messageInput = $('textarea[name="msg"]');
		var roomNo = "${roomNo}";
		var member = $('.content').data('member');
		var sock = new SockJS(
				"${pageContext.request.contextPath}/endpoint");
		var client = Stomp.over(sock);

		function sendmsg() {
			var message = messageInput.val();
			//alert("메시지"+message);
			if (message == "") {
				return false;
			}
			client.send('/app/hello/' + roomNo, {}, JSON
					.stringify({
						chatContent : message,
						memberId : "${loginMember.memberId}"

					}));

			messageInput.val('');
		}

		client.connect({},function() {
			// 여기는 입장시
			//	           일반메세지 들어오는곳         
			client.subscribe('/subscribe/chat/'+ roomNo,function(chat) {
				var endNo = $("#list-guestbook li").last().data("no") + 1;
				//받은 데이터
				var content = JSON.parse(chat.body);
				var html = renderList(content,endNo);
				$("#list-guestbook").append(html);
				newAlerts(content,endNo);
								
							});

						});
		//	         대화시
		$('.send').click(function() {
			//alert("눌리나?");
			sendmsg();
		});

		//채팅창 떠날시에
		function disconnect() {
			if (client != null) {
				client.disconnect();
			}
		}
		window.onbeforeunload = function(e) {
			disconnect();
		}

		function closeConnection() {
			sock.close();
		}

		function viewList() {

			alert('viewList');
			var url = "/chat/chatList?page=" + page
					+ "&perPageNum=" + perPageNum;
			location.replace(url);
		}

	});

});
	//여기 위에까지가 방 입장하자마자
</script>

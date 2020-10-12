<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>

<script src="/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<style>
.chatcontent {
	overflow: scroll;
	height: 500px;
	position: relative;
}
</style>
<div id="chat-containerK">
		<div class="chatWrap">
			<div class="main_tit">
				<h1>방 이름 [ ${room.roomName} ]</h1>
			</div>
			<div class="content chatcontent" data-room-no="${room.roomNo}"
				data-member="${member}">
				<div class="user">
					<ul>

					</ul>
				</div>
				<div class="box"></div>


				<div class="fix_btn">
					<input type="text" id="msgi" name="msg" placeholder="메세지를 입력하세요" />
					<button type="button" class="send">보내기</button>
					<button type="button" class="roomOut" value="${user.username}">방
						나가기</button>
					<input type="hidden" value="${cri.page}" id="page" name="page" /> <input
						type="hidden" value="${cri.perPageNum }" id="perPageNum"
						name="perPageNum" />
					<button type="button" class="btnPass"
						onclick="return isOwner(${room.roomNo}, '${user.username}')">방
						수정하기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){


		var page = $('#page').val();
		var perPageNum = $('#perPageNum').val();

		$(function () {
	        var chatBox = $('.box');
	        var messageInput = $('input[name="msg"]');
	        var roomNo = $('.content').data('room-no');
	        var member = $('.content').data('member');
	        var sock = new SockJS("/endpoint");
	        var client = Stomp.over(sock);
	        
	        function sendmsg(){
	        	var message = messageInput.val();
	            if(message == ""){
	            	return false;
	            }
	            client.send('/app/'+ roomNo, {}, JSON.stringify({
	            	message: message, writer: member
	            	}
	            ));
	            
	            messageInput.val('');
	        }
	        
	        client.connect({}, function (){
	        	// 여기는 입장시
	        	//client.send('/app/join/'+ roomNo , {}, JSON.stringify({ writer: member})); 
//	           일반메세지 들어오는곳         
	            client.subscribe('/subscribe/chat/' + roomNo, function (chat) {
	                var content = JSON.parse(chat.body);
	                
	                if(content.memberId == member.memberId){
	                	//내 채팅 메시지일때
	                	chatBox.append("<li>" + content.writer + " :  <br/>" + content.message + "</li>").append('<span>' + "[보낸 시간]" + content.chatdate + "</span>" + "<br>");
	                	  
	                }else{
		                //다른사람의 메시지일때
	                	chatBox.append("<li>" + content.messageType + " :  <br/>" + content.message + "</li>").append('<span>' + "[보낸 시간]" + content.chatdate + "</span>" + "<br>");
		            	
	                }
	                
	                $(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);

	            });
	            
	        });
//	         대화시
	        $('.send').click(function () {
	            sendmsg();
	        });
	        
//	        나가기
	        /* $('.roomOut').click(function(){
	         
	            if(member != null){
	               $.ajax({
	                  type : "get",
	                  url : "/memberOut",
	                  data :  {
	                      userId : $('.roomOut').val(),
	                      roomNo : roomNo
	                   },// para 1/ -1
	            
	                  success:function(data){
	                	  alert(data);
	                     if(data == -1){
	                    	 viewList();
	                     }else{
	                    	 viewList();
	                     }
	                     
	                  }// success
	               });// ajax
	               
	            }
	     });// click */
	      
		
		//채팅창 떠날시에
		function disconnect(){
			if(client != null){
				client.disconnect();
			}
		}
		window.onbeforeunload = function(e){
			disconnect();
		}
		
		function closeConnection () {
		    sock.close();
		}

		function viewList(){
		
			alert('viewList');
			var url = "/chat/chatList?page=" + page + "&perPageNum=" + perPageNum;
			location.replace(url);
		}
	
		
		/* $(document).keydown(function(e) {
			key = (e) ? e.keyCode : event.keyCode;
		     
		    if (key == 116 || (key == 17 && key == 82) || ((key == 17 && key == 116))) {
		        if (e) {
		            e.preventDefault();
		           var conf = confirm('해당 페이지를 벗어나시겠습니까?');
		           if(conf){
		        	   viewList();
		           }else{
		        	   return false;
		           }
		           
		        }else {
		            event.keyCode = 0;
		            event.returnValue = false;
		        }
		    }else if(key == 13){
		    	sendmsg();
		    }
		   
		}); */

		//history.pushState(null, document.title, location.href); 
		/* window.addEventListener('popstate', function(event) { 
			
			history.pushState(null, null, null); 
			viewList();
		}); */


		/* window.onbeforeunload = function() {
		
			var dat;
		
			$.ajax({
					url : "/memberOut",
					cache : "false", //캐시사용금지
					method : "get",
					data : { 
						userId: $('.roomOut').val(),
						roomNo: $('.content').data('room-no')
					},
					dataType: "html",
					async : false, //동기화설정(비동기화사용안함)
					
					success:function(args){ 
						dat = args;
						location.replace("/chat/chatList?page=" + page + "&perPageNum=" + perPageNum);	
					},   
			
					error:function(e){  
						alert(e.responseText);  
					}
		
			 });	
			
 			 if(dat != 1){// 방 삭제가 안됐을 때만 send
				 client.send('/app/out/' + roomNo , {}, JSON.stringify({ writer: member}));
			 }
			 
			} */ 
		
		});



	});
	//여기 위에까지가 방 입장하자마자 
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<script src="${pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
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
				<h1>방 이름 [ ${roomNo}번 ]</h1>
			</div>
			<div class="content chatcontent" data-room-no="${roomNo}"
				data-member="${loginMember}">
				<div class="user">
					<ul>

					</ul>
				</div>
				 <ul id="list-guestbook"></ul>
				<div class="box"></div>


				<div class="fix_btn">
					<input type="text" id="msgi" name="msg" placeholder="메세지를 입력하세요" />
					<button type="button" class="send">보내기</button>
					<%-- <button type="button" class="roomOut" value="${user.username}">방
						나가기</button> --%>
					<input type="hidden" value="${cri.page}" id="page" name="page" /> <input
						type="hidden" value="${cri.perPageNum }" id="perPageNum"
						name="perPageNum" />
					<%-- <button type="button" class="btnPass"
						onclick="return isOwner(${room}, '${user.username}')">방
						수정하기</button> --%>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
		var isEnd = false;
		 var fetchList = function(){
		        if(isEnd == true){
		            return;
		        }
		        
		        // 채팅 리스트를 가져올 때 시작 번호
		        // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
		        // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
		        var endNo = $("#list-guestbook li").last().data("no") || 0;
		        console.log("endNo"+endNo);
		        $.ajax({
		            url:"${pageContext.request.contextPath}/chat/chatList.do?endNo="+endNo+"&roomNo=${roomNo}" ,
		            type: "GET",
		            dataType: "json",
		            success: function(result){
			            console.log(result[0]);
		                // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
		                // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
		                var length = result.size;
		                 if( result[9].no == endNo){
		                    isEnd = true;
		                } 
		                $.each(result, function(index, vo){
		                    renderList(false, vo);
		                })
		            },
		            error : function(xhr, status, err){
						console.log("처리실패!");
						console.log(xhr);
						console.log(status);
						console.log(err);
					}
		        });
		    }
		    
		    var renderList = function(mode, vo){
			    //alert("아뭐냐구");
		        // 리스트 html을 정의
		        var html = "<li data-no='"+ vo.no +"'>" +
	            "<strong>"+ vo.no +"</strong>" +
		            "<strong>"+ vo.memberId +"</strong>" +
		            "<p>"+ vo.chatContent +"</p>" +
		            "<strong>"+vo.sendDate+"</strong>" +
		            "</li>"
		        
		        if( mode ){
		            $("#list-guestbook").prepend(html);
		        }
		        else{
		            $("#list-guestbook").append(html);
		        }
		    }
		//무한 스크롤
		$(window).scroll(function(){
            var $window = $(this);
            var scrollTop = $window.scrollTop();
            var windowHeight = $window.height();
            var documentHeight = $(document).height();
            
            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
            
            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
            if( scrollTop + windowHeight + 30 > documentHeight ){
                fetchList();
            }
        })
        fetchList();

		var page = $('#page').val();
		var perPageNum = $('#perPageNum').val();

		$(function () {
	        var chatBox = $('.box');
	        var messageInput = $('input[name="msg"]');
	        var roomNo = "${roomNo}";
	        var member = $('.content').data('member');
	        var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
	        var client = Stomp.over(sock);
	        
	        function sendmsg(){
	        	var message = messageInput.val();
	        	alert("메시지"+message);
	            if(message == ""){
	            	return false;
	            }
	            client.send('/app/hello/'+roomNo, {}, JSON.stringify({
	            	chatContent: message,
	            	memberId: "honggd"
	            	
	            	}
	            ));
	            
	            messageInput.val('');
	        }
	        
	        client.connect({}, function (){
	        	// 여기는 입장시
	        	//alert("로그인 정보"+"${loginMember}");
	        	//client.send('/app/join/'+ roomNo , {}, JSON.stringify({ writer: member})); 
//	           일반메세지 들어오는곳         
	            client.subscribe('/subscribe/chat/'+roomNo, function (chat) {
	            	 //alert("왜 안들어와..");
	          
	                var content = JSON.parse(chat.body);
	                if(content.memberId == member.memberId){
	                	//내 채팅 메시지일때
	                	chatBox.append("<li>" + content.memberId + " :  <br/>" + content.chatContent + "</li>").append('<span>' + "[보낸 시간]" + content.sendDate + "</span>" + "<br>");
	                	  
	                }else{
		                //다른사람의 메시지일때
	                	chatBox.append("<li>" + content.memberId + " :  <br/>" + content.chatContent + "</li>").append('<span>' + "[보낸 시간]" + content.sendDate + "</span>" + "<br>");
	                	
	                }
	                
	                $(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);

	            });
	            
	        });
//	         대화시
	        $('.send').click(function () {
		        //alert("눌리나?");
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
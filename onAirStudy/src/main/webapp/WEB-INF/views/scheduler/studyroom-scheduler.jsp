<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<!-- 커스텀 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/scheduler.css" />

<!--컬러픽커-->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery.minicolors.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/jquery.minicolors.css">

<!--데이트픽커-->
<link
	href="${pageContext.request.contextPath }/resources/css/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker css -->
<script
	src="${pageContext.request.contextPath }/resources/js/datepicker.js"></script>
<!-- Air datepicker js -->
<script
	src="${pageContext.request.contextPath }/resources/js/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->

<!-- 삭제나 업뎃했을때 -->
<c:if test="${ not empty sche }">
	<script>
	$(document).ready(function(){

		$('#viewSchedule').modal("show");

		if("${ M }" < 9){
			viewSchedule("${ Y }-0${ M+1 }-${ D }");
			return;
		}
		viewSchedule("${ Y }-${ M+1 }-${ D }");
		
		});
</script>
</c:if>

<c:if test="${ not empty todo }">
	<script>
	$(document).ready(function(){

		$('#viewTodoList').modal("show");

		if("${ M }" < 9){
			viewTodoList("${ Y }-0${ M+1 }-${ D }");
			return;
		}
		viewTodoList("${ Y }-${ M+1 }-${ D }");
		
		});
</script>
</c:if>
<div class='cal-divB col-lg-10 p-0'>
	<div class="infoB"></div>
	<br />
	<table class="tableB table">

	</table>
</div>

<!-- 메뉴바  -->
<div class="dropdown-menu dropB">
	<p id="pXB">X</p>
	<button class="dropdown-item btn btn-primary" data-toggle="modal"
		onclick="insertForm(this.value);" data-target="#iuschedule">일정
		등록</button>
	<button class="dropdown-item btn btn-primary" data-toggle="modal"
		onclick="viewSchedule(this.value);" data-target="#viewSchedule">일정
		보기</button>
	<button class="dropdown-item btn btn-primary" data-toggle="modal"
		onclick="viewTodoList(this.value);" data-target="#viewTodoList">To
		do List</button>
</div>

<div id="containerBB">

	<!-- 일정등록 모달 -->
	<div class="modal" id="iuschedule" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="titleB">일정 등록</h5>
					<button type="button" class="close" data-dismiss="modal" id="openB"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- 등록하는 부분 -->
				<div class="modal-body">
					<form id="iuscheduleFrm" method="post">

						<h3 style="margin-right: 180px;">날짜 입력</h3>
						<br /> <input type="text" class="datepick delB" name="startDate">
						~ <input type="text" class="datepick delB" name="endDate">
						<br /> <br />

						<h3 style="margin-right: 180px;">내용 입력</h3>
						<br /> <input type="text" class="marginB delB" name="content"
							style="width: 300px;" placeholder="내용 입력"> <br /> <br />

						<label for="hidden-input">형광펜 색상 선택 : </label> <input
							type="hidden" id="hidden-input" class="demo" name="colorCode">
						<br /> <br /> <label for="timeOption">시간설정 : <select
							class="makeSelB" name="timeOption" id="time1">
								<option value="후다닥">다닥</option>
						</select> <select class="makeSelB" name="timeOption" id="time2">
								<option value="후다닥">다닥</option>
						</select>
						</label> <input type="hidden" name="timeOpt" val="" /> <br /> <br /> <input
							type="checkbox" name="DYN" value=""> <label for="DYN">디데이
							일정으로 등록하기</label> <input type="hidden" name="scheduleYN" value="Y" /> <br />
						<br />

					</form>
				</div>
				<div class="modal-footer" id="footerB">
					<button type="button" id="subB" class="btn btn-primary">등록하기</button>
				</div>
			</div>
		</div>
	</div>




	<!-- 일정보기모달 -->
	<div class="modal" id="viewSchedule" tabindex="0">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="theDateB">일정 보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body" id="viewBody">
					<table class="table" id="viewTable">

					</table>
				</div>
				<div class="modal-footer" style="height: 60px;"></div>
			</div>
		</div>
	</div>




	<!-- To do list 모달창 -->
	<div class="modal" id="viewTodoList" tabindex="0">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="todoDateB">2020년 10월 18일</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h5>To do List</h5>
					<form id="storeTodoFrm" method="POST">
						<table class="table" id="todoTable">


						</table>
						<table class="table" id="addTableTodo">


						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="deleteTodoBtn();"
						class="btn btn-danger">모두삭제</button>
					<button type="button" id="storeTodo" class="btn btn-primary">저장하기</button>
				</div>
			</div>
		</div>
	</div>

</div>


<script>

    function deleteTodoBtn(){
		var thisDate = $("#todoDateB").html();
		var Frm = $("#storeTodoFrm");
		Frm.append($('<input/>', {type:'hidden', name:'startDate', value: thisDate }));
		Frm.attr("action", "${ pageContext.request.contextPath }/scheduler/delTodo.do");

		if(confirm("모두 삭제하시겠습니까?"))
			Frm.submit();

     }

    //todo폼 인서트
    $(document).ready(function(){
		$("#storeTodo").click(function(){
			var checkB = $("#todoTable input:checkbox");

			var Frm = $("#storeTodoFrm");
			var startD = $("#todoDateB").text();

			if(checkB.length == 0 ){
				alert("리스트를 입력해주세요.");
				return;
			}
			
			//날짜입력
			Frm.append($('<input/>', {type:'hidden', name:'startDate', value: startD }));

			checkB.each(function(i, item){ 
				//내용과 enabled 여부
				Frm.append($('<input/>', {type:'hidden', name:'content', value: item.value }));
				Frm.append($('<input/>', {type:'hidden', name:'checked', value: item.checked }));

			});

			Frm.attr("action", "${ pageContext.request.contextPath }/scheduler/todo.do");

			if(confirm("저장하시겠습니까?"))
				Frm.submit();

		});

    });
        
    

    

    //To do List 출력
    //delete로 해당날짜를 다 삭제한 후, insert하는 방식으로!
	var index = 0;
    function viewTodoList(e){
        $tbl = $("#todoTable");
        $addT = $("#addTableTodo");
        htmlB = "";
        $tbl.empty();
        $addT.empty();

		$("#todoDateB").text(e);

        
		if(schedules.length > 0){
        	for(var i = 0 ; i<schedules.length ; i++){

				if(schedules[i].startDate == e && schedules[i].scheduleYN=="N" && schedules[i].dYN=="N"){
					htmlB += "<tr id='bb"+index+"'><td><input type='checkbox' class='chechBB' id='b"+index+"' value='"+schedules[i].content+"' style='display:none;'";
					if(schedules[i].enabledYN == "Y")
						htmlB += " checked";
					htmlB += ">";
					htmlB += "<label for='b"+index+"' onclick='checkcheckB(b"+index+", this)' ";
					if(schedules[i].enabledYN == "Y")
						htmlB += "style='text-decoration:line-through;'";
					htmlB += ">"+schedules[i].content+"</label></td>";
					htmlB += "<td class='tdB'><button type='button' class='btn btn-light' onclick='deleteTodo(bb"+index+")'>x</button></td></tr>";
					index++;		
				}
            }

		}
	    	$tbl.append(htmlB);

	    	$(".checkBB:checked label").find("label").css("text-decoration", "line-through");
	    	

        	htmlB = "<tr><td><input type='text' class='addTodoVal'/></td>"
        	htmlB += "<td class='tdB'><button type='button' class='btn btn-light' onclick='addTodo();'>+</button></td></tr>";

			$("#addTableTodo").append(htmlB);
        
	}

	//Todo삭제하기
	function deleteTodo(id){
			id.remove();
	}

	//Todo추가하기
	function addTodo(){
		var valueB = $(".addTodoVal").val();
		
		var htmlB = "";

		if(valueB != null && valueB != ""){

		htmlB += "<tr id='bb"+index+"'><td><input type='checkbox' class='chechBB' id='b"+index+"' value='"+valueB+"' style='display:none;'>";
		htmlB += "<label for='b"+index+"' onclick='checkcheckB(b"+index+", this)'>"+valueB+"</label></td>";
		htmlB += "<td class='tdB'><button type='button' class='btn btn-light delBtnB' onclick='deleteTodo(bb"+index+")'>x</button></td></tr>";

		index++;

		$("#todoTable").append(htmlB);
		}else{
			alert("내용을 입력해주세요.");
		}
				
		

	}

	function checkcheckB(check, lab){
		console.log(check);
		console.log(lab);

		if(check.checked == false){
			lab.style.textDecoration = "line-through";
		}else{
			lab.style.textDecoration = "none";
		}
		
	}


    //일정등록할때 인풋값 미리 넣어주기
	function insertForm(e){
		document.getElementById("titleB").innerHTML = "일정 등록";
		$("#subB").html("등록하기").attr("onclick", "subB(true)");
	    $("#iuschedule [name=startDate]").val(e);
	    $("#iuschedule [name=endDate]").val(e);
	    $(".minicolors-swatch-color").css("background-color", "#ff9191");
	    needBool = false;
	}

	//일정보기할때 일정 미리 넣어주기
	function viewSchedule(theDate){

		var htmlB = "";
		var count = 0;
		//헤더에 날짜 넣어주기
		$("#theDateB").empty().append(theDate.substr(5, 2)+"월 "+theDate.substr(8)+"일");
		
		if(schedules != null){
			for(var i in schedules){
				if(schedules[i].startDate == theDate){
					if(!(schedules[i].dYN == "N" &&schedules[i].scheduleYN=="N")){
					htmlB += "<tr><td>"+schedules[i].content+"<br/> ( "+(schedules[i].timeOpt!="" ? schedules[i].timeOpt : "-")+" ) </td>";
					htmlB += "<td class='tdB'><button type='button' class='btn btn-light' onclick='updateB("+schedules[i].no+");'>수정</button></td>"
							+"<td class='tdB'><button type='button' class='btn btn-light' onclick='deleteB("+schedules[i].no+");'>삭제</button></td>";
					htmlB += "</tr>";
					count++;
						}
					}		
				}
			}

		if(count==0)
			htmlB += "<tr colspan='3'><td>일정이 없습니다.</td></tr>";
		
        $("#viewTable").empty().append(htmlB);

        needBool = false;

		}



		var needDate="";
		var needBool = false;

		//select에서 해당시간 셀렉티드 하기
		function updateB(no){

			$("#viewSchedule").modal("hide");
			document.getElementById("titleB").innerHTML = "일정 수정";
			$("#subB").html("수정하기").attr("onclick", "subB(false)");
			needBool = true;

			var time1 = "";
			var time2 = "";
			if(schedules != null){
				for(var i in schedules){
					if(schedules[i].no == no){
						$("[name=no]").val(no);
						needDate = schedules[i].startDate;
						$("[name=startDate]").val(needDate);
						$("[name=endDate]").val(schedules[i].endDate);
						$("[name=content]").val(schedules[i].content);
						$(".minicolors-swatch-color").css("background-color", schedules[i].colorCode);

						if(schedules[i].timeOpt==""){
							time1 = "00:00";
							time2 = "00:00";
						}else{
							time1 = schedules[i].timeOpt.substr(0,5);
							time2 = schedules[i].timeOpt.substr(8);
						}
						$("#time1").val(time1);
						$("#time2").val(time2);

						
						$("#iuschedule").modal("show");
						
						return;						
					}		
				}
			}

		}
	
	
		//일정 삭제 delete
		 	function deleteB(no, day){
				location.replace("${ pageContext.request.contextPath }/scheduler/delete.do?no="+no);

			 	
		 /* 	$.ajax({
				type:"GET",
				url: "${ pageContext.request.contextPath }/scheduler/delete.do?no="+no,
				error:function(){
					alert("일정 삭제 실패");
					},
				dataType:"text",
				success : function(data){
					alert("일정 삭제 성공");
					console.log(data);

					viewSchedule();
	
				}

			}); */
				

		}


		//일정 등록 & 수정
    	function subB(bool){

			var action="";

			if(bool)
				action="insert.do";
			else	
				action="update.do";
				
    		$('#iuscheduleFrm').attr("action","${pageContext.request.contextPath }/scheduler/"+action);

     		if(checkSub())
				$('#iuscheduleFrm').submit();

        	}


    //요소 value들 체크해주기
    function checkSub(){
        
       	/* timeOpt 값 설정 */
		var timeOpt = $("#time1").val()+" ~ "+$("#time2").val();
		$("[name=timeOpt]").val(timeOpt);

		/* dYn 값 설정 */
		if($("[name=DYN]:checked").length>0)
			$("[name=DYN]").val("Y");
		else
			$("[name=DYN]").val("N");

		//혹시 모르는 색상코드 설정
		if($("[name=colorCode]").val()=="")
			$("[name=colorCode]").val("#ff9191");


		console.log("디데이"+$("[name=DYN]").val());

		/* 디데이일 설정시 날짜맞춰주기 */
		if($("[name=DYN]").val()=="Y"){
			$("[name=scheduleYN]").val("N");
			if($("[name=startDate]").val() != $("[name=endDate]").val()){
				alert("디데이 날짜를 맞춰주세요.");
				return false;
			}
		}

		/*내용확인*/
		if($("[name=content]").val()==""){
			alert("내용을 입력해주세요.");
			return false;
		}

		return true;
    	
       }
    

	/* 모달창 시간생성 */
    $(document).ready(function(){
    	$('.makeSelB').empty();
    	 
    	var option = "";

    	for(var i = 0; i< 25 ; i++){      
        	          
			if(i<10){
	      	  option = $("<option>"+"0"+i+":00</option>");
			}else{
	      	  option = $("<option>"+i+":00</option>");
			}


		$('.makeSelB').append(option);
    	 }



        });

    
	//컬러픽커
	$(document).ready( function() {
	
	$('.demo').each( function() {
	  $(this).minicolors({
	    control: $(this).attr('data-control') || 'hue',
	    defaultValue: $(this).attr('data-defaultValue') || '',
	    format: $(this).attr('data-format') || 'hex',
	    keywords: $(this).attr('data-keywords') || '',
	    inline: $(this).attr('data-inline') === 'true',
	    letterCase: $(this).attr('data-letterCase') || 'lowercase',
	    opacity: $(this).attr('data-opacity'),
	    position: $(this).attr('data-position') || 'bottom left',
	    swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
	    change: function(value, opacity) {
	      if( !value ) return;
	        console.log(value);
	        $("#hidden-input").val(value);
	      
	    },
	    theme: 'default'
	  });
	
	});

});

            //모달창 데이트피커
           $(document).ready( function() {
                $(".datepick").datepicker({
                    language: 'ko',
                    dateFormat:"yyyy-mm-dd",
                    onSelect: function onSelect(e, date) {

                    console.log(date);
                    console.log(e);
                    console.log($(this));
                    
                }

                });
           });

       	//스케줄 가져올준비
           function schedule(no, srNo, startDate, endDate, content, colorCode, scheduleYN, timeOpt, dYN, enabledYN){
               this.no = no;
               this.srNo = srNo;
               this.startDate = startDate.substr(0,10);
               this.endDate = endDate.substr(0,10);
               this.content = content;
               this.colorCode = colorCode;
               this.scheduleYN = scheduleYN;
               this.timeOpt = timeOpt=="00:00 ~ 00:00" ? "" : timeOpt;
               this.dYN = dYN;
               this.enabledYN = enabledYN;
           }
           
           //디비에서 스케줄 가져오기  
           var schedules = Array (
           <c:forEach items='${ list }' var='sch'>
           new schedule("${ sch.no }", "${ sch.srNo }", "${ sch.startDate }", "${ sch.endDate }", "${ sch.content }", "${ sch.colorCode }", "${ sch.scheduleYN }", "${ sch.timeOpt }", "${ sch.DYN }", "${ sch.enabledYN }"),
           </c:forEach>
           );

           //출력해보기
   		$(document).ready(function(){
			console.log(schedules);
				
       		})

           
           //기본 달력출력
           $(document).ready(function(){
				if("${ Y }"== "" && "${ M }"==""){
	               drawCalendar();
	               return;
				}
               
               drawCalendar("${ Y }", "${ M }");

           });

        
           $(document).ready(function(){
               //메뉴닫아주기
               $(".dropB").find("p").click(function(){
                   $(".dropB").css("display", "none");
               });
          
           });

           //메뉴닫기
           $(document).ready(function(){
               $(".close").click(function(){
                  var inputs = document.getElementsByClassName("delB");
                   for(var i = 0 ; i<inputs.length ; i++){
                       inputs[i].value = "";
                   }

               //수정모달 닫으면서 view모달 켜주기
               if(needBool){
	               	viewSchedule(needDate);
					$("#viewSchedule").modal("show");
                 }
           
                    $(".dropB").css("display", "none");
               })
          
           });

            var today = new Date();
            

            //캘린더만들기
            function drawCalendar(Y, M){
                
                //테이블찾기
                var $tblB = $(".tableB");
                
                //그려줄 테이블
                var htmlB = "";
                
                //이달 첫째날
                var firstDate = new Date();
                firstDate.setDate(1);
               
                //월 컨트롤러 ->추후에 < > 버튼으로 달력이동 가능하게해야함
                if(M != null){
                    firstDate.setMonth(M);
                }
                if(Y != null){
                    firstDate.setFullYear(Y);
                }
               
                //월 첫째요일
                var firstDay = firstDate.getDay();

                //td 아이디값으로 줄 날짜정보
                var yB = firstDate.getFullYear();
                var MB = firstDate.getMonth()+1;
                var dB = firstDate.getDate();
                
                //월별 마지막날짜
                var lastMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
                var lastDate = 0;
                //윤년일 때 2월 29일
                if(firstDate.getUTCFullYear()%4==0){
                    lastMonth[1] = 29;
                }
              
                //마지막날짜 찾기
                for(var i = 0 ; i < lastMonth.length;i++){
                    if(firstDate.getMonth() == i){
                        lastDate = lastMonth[i];
                        console.log(lastDate);
                    }

                }

                //연/월 정보
                var info = document.getElementsByClassName("infoB")[0];
                info.innerHTML ="<button type='button'  class='btn btn-light' onclick='drawCalendar();'>오늘날짜보기</button>"
                                + "<h1 class='yearBB'>"+firstDate.getFullYear()+"</h1><br/>"
                                + "<h2 class='monthBB'><button id='prevB' onclick='prevCalendar("+firstDate.getMonth()+");'><img src='${pageContext.request.contextPath }/resources/images/L.png'></button>"
                                + "<p id='monthB'>"+(firstDate.getMonth()+1)+"월</p>"
                                + "<button id='nextB' onclick='nextCalendar("+firstDate.getMonth()+");'><img src='${pageContext.request.contextPath }/resources/images/R.png'></button></h2><br/>";
                
                //요일정보
                htmlB+= "<tr><th scope='col' class='sun'>sun</th><th scope='col'>mon</th><th scope='col'>tue</th><th scope='col'>wed</th><th scope='col'>thu</th><th scope='col'>fri</th><th scope='col' class='sat'>sat</th></tr>";

                
                //달력짜기
            for(var i = 0 ; i < 6 ; i++){
                htmlB+="<tr>";           
                    for(var j = 0 ; j <7 ; j++){
                        //첫째날 요일 맞춰주기
                        if(i==0 && j < firstDay){
                            htmlB+="<td class='Bday-non'></td>";
                            continue;
                        }
                        //막날 요일 채워주기
                        if(dB>lastDate){
                            htmlB+="<td class='Bday-non'></td>";
                            continue;
                        }

                        htmlB+="<td class='Bday ";
                        
                        //일,토 색상처리
                        if(j==0){
                            htmlB += "sun";
                        }else if(j==6){
                            htmlB += "sat";
                        }
                        
                        htmlB+="' id='"+yB+"-"+(MB < 10 ? "0"+MB : MB )+"-"+ (dB < 10 ? "0"+dB : dB ) +"'><div class='highSpan'> "+(dB++)+"</div></td>";
                    }
                    htmlB+="</tr>";

                }

            	//달력완성
                $tblB.empty().append(htmlB);

                //오늘날짜에 id 추가하기
                var today = new Date();
                if(firstDate.getFullYear() == today.getFullYear() && firstDate.getMonth()==today.getMonth()){
                    today = moment(new Date()).format("YYYY-MM-DD");
                    var toid = document.getElementById(today).firstChild;
                    toid.setAttribute("id", "thisday");
                }

                //리스너 달아주기
                var eventB = document.getElementsByClassName("Bday");
                    for(var i = 0 ; i < eventB.length ; i++){
                    eventB[i].addEventListener("click", function(){
                       mouseEvents(this, event);

                    }, false);
                }

                    //스케줄넣어주기
                    if(schedules.length>0){
                        scheduling();

                    }

                }

                function scheduling(){

                	
					if(schedules.length > 0){
						var cnt = 0;
						var thisTd;
						var cnt = 0;
						var arrays = [];

						//for
						for(var i = 0 ; i < schedules.length ; i++){

							//디데이부터 빼주기
							if(schedules[i].dYN == "Y"){
								$("[name=DYN]").attr("disabled", true).next().empty().append("디데이가 이미 등록되어 있습니다.").css("color", "grey");
	                          }

	                          var sts = $("#"+schedules[i].startDate);
	                          var firstDate = schedules[i].startDate.substr(8);
	                          
	                          var htmlBB = "";

	                          //일정 출력해주기
		                      if(sts!=null){

		                      		if(!(schedules[i].dYN=="N" && schedules[i].scheduleYN =="N")){	                          


		                        	htmlBB += "<div style='background-color:"+schedules[i].colorCode+";'>";
	
		                        	if(firstDate == "01" || i==0 || (i>=1 && schedules[i-1].no != schedules[i].no)){
	
		                        		htmlBB += schedules[i].content;
			                          }



		                        	htmlBB += "</div>";
		                      		}
		                      		
		                      	//To do List 날짜 배열화
								if(schedules[i].dYN=="N" && schedules[i].scheduleYN =="N")
		                      		arrays.push(schedules[i].startDate);

								sts.append(htmlBB);

							}
			             }

			             if(arrays == null)
				             return;
			             
			             	//todo 중복날짜 필터링
							var startArrays = arrays.filter(function(item, i, a){
								return i==a.indexOf(item);
							});

							//todo 일정출력
							for(var i = 0 ; i<startArrays.length ; i++){
								$("#"+startArrays[i]).append("<div class= 'to-doB' style='background-color:skyblue; color: white;'> To do List </div>");

							}

			             

					}
                }

                
								//날짜포함 4개이상은 없애주기
							/* 	thisTd = $("#"+schedules[i].startDate);
								var thisDivs = $("#"+schedules[i].startDate).children("div");
								var len = thisDivs.length;
								console.log(thisDivs);
								console.log(len);
								var cnt = len-3;
								
								if(len > 4){
									thisDivs.nextAll("div:nth-child(3)").remove();
								} */
	
							//thisTd.append("<div style='background-color:white;'> +"+cnt+" </div>")

            
            //다음달력
            function nextCalendar(M){
                var Y = Number(document.getElementsByClassName("yearBB")[0].innerHTML);
                M += 1;
                if(M == 12){
                    Y+=1;
                }
                drawCalendar(Y, M);
            }
            //이전달력
            function prevCalendar(M){
                var Y = Number(document.getElementsByClassName("yearBB")[0].innerHTML);
                M -= 1;
                if(M == -1){
                    Y-=1;
                }
                drawCalendar(Y, M);
                
            }

            //오늘날짜보기
                $(".viewTodayB").click(function(){
                    var today = new Date();
                    drawCalendar(today.getFullYear(), today.getMonth());
                    
                });    
                
                //메뉴 나타나게하기
                function mouseEvents(e, event){
                     console.log(e.id);
                     //마우스좌표
                    var x = event.pageX;
                    var y = event.pageY;

					//메뉴보여주기
                    $(".dropB").css("display", "none").css("left", x).css("top", y+20).css("display", "block");

					//서브메뉴에 날짜값 넣어주기
					$(".dropB").children().attr("value", e.id);
                    
				
                }

		
        </script>



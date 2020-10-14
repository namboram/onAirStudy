<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/><%-- 한글 깨짐 방지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄러</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/scheduler.css" />
    
<!--컬러픽커-->
<script src="${pageContext.request.contextPath }/resources/js/jquery.minicolors.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.minicolors.css">

<!--데이트픽커-->
<link href="${pageContext.request.contextPath }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
<!-- Air datepicker css -->
<script src="${pageContext.request.contextPath }/resources/js/datepicker.js"></script> <!-- Air datepicker js -->
<script src="${pageContext.request.contextPath }/resources/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
    
    
<c:if test="${ not empty msg }">
<script>
	alert("${ msg }");
</script>
</c:if>



    
    
</head>
<body>


  <div class='cal-divB'>
        <div class="infoB">
        </div>
        <br/>
        <table class="tableB table">
        
        </table>
        </div>

		<!-- 메뉴바  -->
        <div class="dropdown-menu dropB "><p>X</p>
            <button class="dropdown-item btn btn-primary" data-toggle="modal" data-target="#insertSchedule">일정 등록</button>
            <button class="dropdown-item">일정 보기</button>
            <button class="dropdown-item">To do List</button>
          </div>


          <!-- 일정등록 모달 -->
          <div class="modal" id="insertSchedule" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">일정 등록</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>

                <!-- 등록하는 부분 -->
                <div class="modal-body">
                    <form id="insertSchedulFrm" action="${pageContext.request.contextPath }/scheduler/insert.do" method="post">
                        
                        <input type="hidden" name="memberId" value="honggd" />
                        
						<h3 style="margin-right:180px;">날짜 입력</h3>
						<br />
                        <input type="text" class="datepick delB" name="startDate">  ~  
                        <input type="text" class="datepick delB" name="endDate">
                        <br/>
                        <br/>
						
						<h3 style="margin-right:180px;">내용 입력</h3>
						<br />
                        <input type="text" class="marginB delB" name="content" style="width: 300px;" placeholder="내용 입력">
                        <br/>
                        <br/>
                        
                        <label for="hidden-input">형광펜 색상 선택 : </label>
                        <input type="hidden" id="hidden-input" class="demo" name="colorCode" value="#db913d">
                        <br/>
                        <br/>

                        <label for="timeOption">시간추가 : 
                        
                        <select class="makeSelB" name="timeOption" id="time1">
                        	<option value="후다닥">다닥</option>
                        </select>
                        	
                        <select class="makeSelB" name="timeOption" id="time2">
                        	<option value="후다닥">다닥</option>
                        </select>
                        </label>
                        <input type="hidden" name="timeOpt" val="" />

                        <br/>
                        <br/>

                        <input type="checkbox" name="DYN" value="">
                        <label for="DYN">디데이 일정으로 등록하기</label>
                        <input type="hidden" name="scheduleYN" value="Y" />

                        <br/>
                        <br/>

                    </form>
                </div>


                <div class="modal-footer">
                    <button type="button" id="insertsubB" class="btn btn-primary">등록하기</button>
                </div>
              </div>
            </div>
          </div>


    
    <script>

    $(document).ready(function(){
    	$('#insertsubB').click(function(){
        	/* timeOpt 값 설정 */
			var timeOpt = $("#time1").val()+","+$("#time2").val();
			$("[name=timeOpt]").val(timeOpt);

			/* dYn 값 설정 */
			if($("[name=DYN]:checked").length>0)
				$("[name=DYN]").val("Y");
			else
				$("[name=DYN]").val("N");
				


			console.log("디데이"+$("[name=DYN]").val());

			/* 디데이일 설정시 날짜맞춰주기 */
			if($("[name=DYN]").val()=="Y"){
				$("[name=scheduleYN]").val("N");
				if($("[name=startDate]").val() != $("[name=endDate]").val()){
					alert("디데이 날짜를 맞춰주세요.");
					return;
				}
			}

			/*내용확인*/
			if($("[name=content]").val()==""){
				alert("내용을 입력해주세요.");
				return;
			}
        	
    		$('#insertSchedulFrm').submit();


        	});


      });

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
           function schedule(no, startDate, endDate, content, colorCode, timeOpt, dYN){
               this.no = no;
               this.startDate = startDate.substr(0,10);
               this.endDate = endDate.substr(0,10);
               this.content = content;
               this.colorCode = colorCode;
               this.timeOpt = timeOpt=="00:00,00:00" ? "" : timeOpt;
               this.dYN = dYN;
           }
           
           //디비에서 스케줄 가져오기  
           var schedules = Array (
           <c:forEach items='${ list }' var='sch' varStatus="i">
           new schedule("${ sch.no }", "${ sch.startDate }", "${ sch.endDate }", "${ sch.content }", "${ sch.colorCode }", "${ sch.timeOpt }", "${ sch.dYN }"),
           </c:forEach>
           );

           //출력해보기
   		$(document).ready(function(){
				console.log(schedules);
       		})

           
           //기본 달력출력
           $(document).ready(function(){
               drawCalendar();

           });

        
           $(document).ready(function(){

               //메뉴닫아주기
               $(".dropB").find("p").click(function(){
                   $(".dropB").css("display", "none");
               });
          
           });

           
           $(document).ready(function(){
               $(".close").click(function(){
                  var inputs = document.getElementsByClassName("delB");
                   for(var i = 0 ; i<inputs.length ; i++){
                       inputs[i].value = "";
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
                info.innerHTML ="<button class='btn btn-info' onclick='drawCalendar();'>오늘날짜보기</button>"
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
                        
                        htmlB+="' id='"+yB+"-"+(MB < 10 ? "0"+MB : MB )+"-"+ (dB < 10 ? "0"+dB : dB ) +"'><span> "+(dB++)+"</span></td>";
                    }
                    htmlB+="</tr>";

                }

            	//달력완성
                $tblB.append(htmlB);

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
                   
                    //투두, 디데이가 아닐때
                    schedules.forEach(function(e){
                        if(e.dYN == "Y"){
							$("[name=DYN]").attr("disabled", true).next().empty().append("디데이가 이미 등록되어 있습니다.");
                          }
                        console.log(e.startDate);
                        console.log(e.endDate);
                        document.getElementById(e.startDate).innerHTML+="<br/><span style='background-color:"+e.colorCode+";'>"+e.content+"</span>";
                       
                    })
                }

            
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
                    var x = event.clientX;
                    var y = event.clientY;

                    $(".dropB").css("display", "none").css("left", x).css("top", y+20).css("display", "block");
                    $("[name=startDate]").val(e.id);
                    $("[name=endDate]").val(e.id);

                }

		
        </script>
        


</body>
</html>
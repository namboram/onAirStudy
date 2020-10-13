<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    
      <script>


            
            function schedule(no, startDate, endDate, content, colorCode, timeOpt){
                this.no = no;
                this.startDate = startDate;
                this.endDate = endDate;
                this.content = content;
                this.colorCode = colorCode;
                this.timeOpt = timeOpt;
            }
            
            //예시데이터
            var schedules = Array (
                new schedule(1, 20201001, 20201002, "예시데이터", "", "")
                
            );
            
            //기본 달력출력
            $(document).ready(function(){
                drawCalendar();
           
            });

            var today = new Date();

            //캘린더만들기
            function drawCalendar(Y, M){
                
                //테이블찾기
                var tblB = document.getElementsByClassName("tableB")[0];
                tblB.innerHTML= "";
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
                info.innerHTML ="<button onclick='drawCalendar();'>오늘날짜보기</button>"
                                + "<h1 class='yearBB'>"+firstDate.getFullYear()+"</h1><br/>"
                                + "<h2 class='monthBB'><button id='prevB' onclick='prevCalendar("+firstDate.getMonth()+");'>전달</button>"
                                + "<p style='display:inline;' id='monthB'>"+(firstDate.getMonth()+1)+"월</p>"
                                + "<button id='nextB' onclick='nextCalendar("+firstDate.getMonth()+");'>담달</button></h2><br/>";
                
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
                        
                        htmlB+="' id='"+yB+MB+ (dB < 10 ? "0"+dB : dB ) +"'><span> "+(dB++)+"</span></td>";
                    }
                    htmlB+="</tr>";

                }
                
                tblB.innerHTML += htmlB;    

                //오늘날짜에 id 추가하기
                var today = new Date();
                if(firstDate.getFullYear() == today.getFullYear() && firstDate.getMonth()==today.getMonth()){
                    today = moment(new Date()).format("YYYYMMDD");
                    var toid = document.getElementById(today).firstChild;
                    toid.setAttribute("id", "thisday");
                }

                //리스너 달아주기
                var eventB = document.getElementsByClassName("Bday");
                    for(var i = 0 ; i < eventB.length ; i++){
                    eventB[i].addEventListener("click", function(){
                       mouseEvents(this);

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
                    console.log(e.startDate);
                    console.log(e.endDate);
                    document.getElementById(e.startDate).innerHTML+="<br/><span>"+e.content+"</span>";
                    //구려!!!
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
                function mouseEvents(e){
                    // console.log(e);
                    $("#dropB").attr("display", "none");
                }
                
        </script>
        
         <style>
                #thisday{
                    background-color: skyblue;
                    padding-right: 90%;
                    border-radius: 10px;
                }
                .Bday span{
                    margin: 0;
                    padding-left: 10px;
                    border-radius: 10px;
                }
                .Bday{
                    border-radius: 10px;
                    cursor: pointer;
                }
                .Bday:hover{
                    background-color: rgb(216, 214, 214);
                }
                #prevB{
                    margin-right: 30px;
                    border-style: none;
                    background-color: burlywood;
                }
                #nextB{
                    margin-left: 30px;
                    border-style: none;
                }
                .monthBB{
                    font-size: 30px;;
                    font-weight: bold;
                    text-align: center;

                }
                .yearBB{
                    font-size: 40px;
                    font-weight: bold;
                    text-align: center;
                }
                .cal-divB{
                    width:800px;
                    margin-top: 100px;
                    margin-left: 100px;
                }
                .sun{
                    color:red;
                }
                .sat{
                    color:blue;
                }
                .tableB tr td{
                    padding: 0;
                    width:100px;
                    height:100px;
                    margin: 5px;
                }
            </style>
    
</head>
<body>


  <div class='cal-divB'>
        <div class="infoB">
        </div>
        <br/>
        <table class="tableB table">
        
        </table>
        </div>

        <div class="dropdown-menu" id="dropB">
            <a class="dropdown-item" href="#">일정 등록</a>
            <a class="dropdown-item" href="#">To do List</a>
            <a class="dropdown-item" href="#">더보기</a>
          </div>
    




</body>
</html>
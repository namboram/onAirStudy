<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<style>
.roomInfo h1{
	text-align: center;
}
</style>
		<div class="roomInfo">
          <header> 
            <h1 class="h3 display">우리 스터디방                     </h1>
          </header>
         	<div class="col-lg-11 p-0"  style="margin: 0 auto; margin-top: 2.5em">
              <div class="card">
                <div class="card-header d-flex align-items-center">
					<label class="col-sm-12 form-control-label" style="text-align:center">${roomInfo.srTitle }</label>
				</div>
                <div class="card-body">
                  <form class="form-horizontal" action="${pageContext.request.contextPath }/studyroom/update.do" method="POST" id="updateFrm">
                    <input type="hidden" name="srOpenedYN" value="${roomInfo.srOpenedYN}" />
                    <input type="hidden" name="category" value="${roomInfo.category}" />
                    <input type="hidden" name="srNo" value="${roomInfo.srNo}" />
                    <input type="hidden" name="attendDay" value=""/>
                    <input type="hidden" name="attendTime" value=""/>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">스터디 방제</label>
                      <div class="col-sm-10">
                       <div class="form-group">
                          <input type="text" class="form-control" name="srTitle" value="${roomInfo.srTitle }">
                        </div>
                      </div>
                    </div>
					<hr />
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">스터디 한줄 소개</label>
                      <div class="col-sm-10">
                        <div class="form-group">
                          <input type="text" class="form-control" name="srComment"  value="${roomInfo.srComment }">
                        </div>
                      </div>
                    </div>
                    <hr />
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">우리방 목표</label>
                      <div class="col-sm-10">
                       <div class="form-group">
                          <input type="text" class="form-control" name="srGoal" value="${roomInfo.srGoal }">
                        </div>
                      </div>
                    </div>
					<hr />
					<div class="form-group row">
						<label class="col-sm-2 form-control-label">출석체크</label>
						<div class="col-sm-10 attendDiv">
							<div class="form-group">
								<label class="col-sm-3 form-control-label">요일</label>
								<label class="col-sm-2 form-control-label">시간</label>
								<button type="button" class="btn" id="btnAdd" onclick="addInput()">+</button>
							</div>
							<c:if test="${ not empty roomInfo.attendDay }">
								<c:set var="arrDay" value="${fn:split(roomInfo.attendDay, ',') }"/>
								<c:set var="arrTime" value="${fn:split(roomInfo.attendTime, ',') }"/>
								<c:forEach var="i" begin="0" end="${fn:length(arrDay)-1}">
									<div class="input-group" style="margin-top: 10px;" name="안녕">
										<select name="day" id="days${ i }" class="col-sm-2" class="dayAttend">
											<option value="월" <c:if test="${ arrDay[i] eq '월' }">selected</c:if>>월요일</option>
											<option value="화" <c:if test="${ arrDay[i] eq '화' }">selected</c:if>>화요일</option>
											<option value="수" <c:if test="${ arrDay[i] eq '수' }">selected</c:if>>수요일</option>
											<option value="목" <c:if test="${ arrDay[i] eq '목' }">selected</c:if>>목요일</option>
											<option value="금" <c:if test="${ arrDay[i] eq '금' }">selected</c:if>>금요일</option>
											<option value="토" <c:if test="${ arrDay[i] eq '토' }">selected</c:if>>토요일</option>
											<option value="일" <c:if test="${ arrDay[i] eq '일' }">selected</c:if>>일요일</option>
										</select>
										<input type="time" name="time" id="time${ i }" class="offset-sm-1" value="${ arrTime[i] }"/>
										<button type="button" id="btnDel${ i }" class="btn offset-sm-1" onclick="deleteInput(this.id)">-</button>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${ empty roomInfo.attendDay }">
								<div class="input-group" style="margin-top: 10px;" name="안녕">
										<select name="day" id="days" class="col-sm-2" class="dayAttend">
											<option value="월" <c:if test="${ arrDay[i] eq '월' }">selected</c:if>>월요일</option>
											<option value="화" <c:if test="${ arrDay[i] eq '화' }">selected</c:if>>화요일</option>
											<option value="수" <c:if test="${ arrDay[i] eq '수' }">selected</c:if>>수요일</option>
											<option value="목" <c:if test="${ arrDay[i] eq '목' }">selected</c:if>>목요일</option>
											<option value="금" <c:if test="${ arrDay[i] eq '금' }">selected</c:if>>금요일</option>
											<option value="토" <c:if test="${ arrDay[i] eq '토' }">selected</c:if>>토요일</option>
											<option value="일" <c:if test="${ arrDay[i] eq '일' }">selected</c:if>>일요일</option>
										</select>
										<input type="time" name="time" id="time" class="offset-sm-1" value="15:00"/>
									</div>
							</c:if>
						</div>
					</div>
					<hr />
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">우리방 규칙</label>
                      <div class="col-sm-10">
                        <div class="form-group">
                          <span>팀장 경고 누적   </span>
                          <input type="number" id="" min="1" max="10" name="forceExitOpt" value="${ roomInfo.forceExitOpt }"/>
                          <span>  회시 자동탈퇴처리  </span>  
                          <input id="inlineCheckbox1" type="checkbox" name="forceExitYN" value="Y" <c:if test="${ roomInfo.forceExitYN eq 'Y' }">checked</c:if> > 
                        </div>
                      </div>
                    </div>
                    <div class="form-group row">
						<div class="col-sm-5 offset-sm-7">
							<c:if test="${roomInfo.srOpenedYN eq 'Y'}">
								<button type="button" class="btn btn-primary" onclick="roomOpened('N')">방 닫기</button>	
							</c:if>
							<c:if test="${roomInfo.srOpenedYN eq 'N'}">
								<button type="button" class="btn btn-primary" onclick="roomOpened('Y')">방 열기</button>	
							</c:if>
							<button type="button" class="btn btn-primary" onclick="beforeSubmit()">수정완료</button>
						</div>
					</div>
                  </form>
                </div>
              </div>
            </div>
        </div>
   <script>
	var i = "${ fn:length(arrDay)}";

	function addInput(){
		var html = "<div class='input-group' style='margin-top:10px;'><select name='day' id='days"+ i +"' class='col-sm-2'>"
				+ "<option value='월'>월요일</option>"
				+ "<option value='화'>화요일</option>" 
				+ "<option value='수'>수요일</option>" 
				+ "<option value='목'>목요일</option>" 
				+ "<option value='금'>금요일</option>" 
				+ "<option value='토'>토요일</option>" 
				+ "<option value='일'>일요일</option>" 
				+ "</select>" 
				+ "<input type='time' name='time' id='time" + i +"' class='offset-sm-1' value='17:00'/>" 
				+ "<button type='button' class='btn offset-sm-1'>-</button>" 
				+ "</div>" ; 
		i++;
		$(".attendDiv").append(html); 
	}

	function roomOpened(yn){
		var msg = yn == 'Y' ? "방을 여시겠습니까?" : "방을 닫으시겠습니까?";  
		if (confirm(msg)) {
			post_to_url("${pageContext.request.contextPath}/studyroom/updateOpened.do", { "roomNum": ${roomInfo.srNo}, "openedYN" : yn });
		}
	}


	function beforeSubmit(){
		var dayStr = "";
		var timeStr = "";
		
		var arrayDay = $("select[name='day']");
		var arrayTime = $("input[name='time']");
		var length = arrayDay.length;
		
		for(var x=0; x<length; x++){
			if(x == length-1){
				dayStr += arrayDay[x].value;
				timeStr += arrayTime[x].value;
			}else{
				dayStr += arrayDay[x].value + ",";
				timeStr += arrayTime[x].value + ","; 
			}
		}		

		$("input[name='attendDay']").val(dayStr);
		$("input[name='attendTime']").val(timeStr);

		$("#updateFrm").submit();
				
	}

	function deleteInput(id){

		console.log(id);

		var mother = $("#"+id).parent();
		mother.remove();

	}
	
   </script>
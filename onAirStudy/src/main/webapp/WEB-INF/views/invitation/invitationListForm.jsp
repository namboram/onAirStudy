<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>초대내역- Invitation list</title>


  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>

 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/invitation.css">


</head>

<body>


  <div class="invitation" style="margin-bottom: 0;">

   
      
      <div class="col-lg" style="background-color:#FBF7FD; padding: 20px;">
        <h2 class="text-gray">Invitation List</h2>
        <hr>
        <div class="container">
          <div class="col-sm" style="background-color: #F9F1ED; border-radius: 25px; border: 2px solid #AD8686; padding: 20px;">
            <h3 >나를 초대한 스터디 그룹</h3>

            <table class="table">
              <thead class="thead-rounded">
                <tr>
                  <th>No.</th>                  
                  <th>그룹 이름</th>
                  <th>그룹 소개</th>
                  <th>초대자</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                 <c:forEach items="${ inList }" var="invitation"> 
                <c:if test="${invitation.invitedId eq sessionID }">
         	        <tr>
                   	<td>${invitation.no}</td>                    
                    <td>${invitation.sTitle}</td>
                    <td>${invitation.sGoal}</td> 
                    <td>${invitation.hostingId}</td> 

                    <td>
                      <button type="button" class="btn btn-outline-primary" onclick="invitation_ok('${ invitation.no }')">수락 </button>
                      <button type="button" class="btn btn-primary" onclick="invitation_no('${ invitation.no }')"> 거절 </button>
                    </td>
                  </tr> 
                  </c:if>                
                </c:forEach> 
           
              </tbody>
            </table>


          </div>

        </div>
      </div>


  
  <!-- The Modal -->
  <div class="modal fade" id="myModal_ok">
    <div class="modal-dialog">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header" style="color: #E2A182;">
          <h4 class="modal-title">초대 수락</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          초대를 수락 하시겠습니까?
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-outline">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>

      </div>
    </div>
  </div>

  <!-- The Modal -->
  <div class="modal fade" id="myModal_no">
    <div class="modal-dialog">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">초대 거절</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          초대를 거절 하시겠습니까?
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-outline">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>

      </div>
    </div>
  </div>
<script>
function invitation_no(no){
	$("#myModal_no").moda().find("[name=no]").val(no);
}
</script>


</body>

</html>
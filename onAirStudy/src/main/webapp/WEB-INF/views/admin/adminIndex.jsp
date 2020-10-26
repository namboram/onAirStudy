<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<%-- 한글 깨짐 방지 --%>

<style>
	.adDivB{
		margin-bottom:100px;
	}
    .bigContainer{
       position: relative;

    }
	.bigContainer div{
		text-align:center;
	}
	#dateB{
		width :30%;
		height: 8%;
		background-color:skyblue;
		margin-left:6%;
	}
	#numberContainerB{
		width:50%;
		height:30%;
		float:left;
		margin-left:15%;
	}
	#leftB div, #rightB div{
		display:inline-block;
		width:100%;
		text-align:center;
		margin-top:3%;
		margin-bottom:5%;
	
	}
	#rightB, #leftB{
		display:inline-block;
		background-color:skyblue;
		width:100%;
        height: 100%;
		border:1px solid gray;
	}
	#graphB{
		width:70%;
        height:40%;
        margin-left:5%;
		background-color:skyblue;
	}
	#graphB, #numberContainerB, #dateB{
		margin-top:2%;
		margin-bottom:2%;
	}
</style>

<!-- #e8f4ff -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<div class="row">
    <div class="col-lg-2">
        <jsp:include page="/WEB-INF/views/admin/adminSideBar.jsp" />
    </div>
    <div class="col-lg-10 .adDivB row">
        <div class="container-fluid row bigContainer">

            <div class="col-xs-12 col-sm-6 col-md-8" id="dateB">
                <h3>Today 2020.10.26</h3>
            </div>
            <div class="container-fluid row" id="numberContainerB">
                <div class="col-xs-6 col-md-6 row" id="leftB">
                    <div class="col-xs-6 col-md-6 row">
                        <div class="col-md-12">아미지</div>
                        <div class="col-md-12">아미지</div>
                        <div class="col-md-12">아미지</div>
                    </div>
                    <div class="col-xs-6 col-md-6 row">
                        <div class="col-md-12">94</div>
                        <div class="col-md-12">6</div>
                        <div class="col-md-12">2</div>
                    </div>
                </div>
                
                <div class="col-xs-6 col-md-6 row" id="rightB">
                    <div class="col-xs-6 col-md-6 row">
                        <div class="col-md-12">회원</div>
                        <div class="col-md-12">게시글</div>
                        <div class="col-md-12">댓글</div>
                        <div class="col-md-12">방갯수</div>
                    </div>
                    <div class="col-xs-6 col-md-6 row">
                        <div class="col-md-12">회원</div>
                        <div class="col-md-12">게시글</div>
                        <div class="col-md-12">댓글</div>
                        <div class="col-md-12">방갯수</div>
                    </div>
                </div>
            </div>
            
            <div class="container-fluid row" id="graphB">
                
                
            </div>
            


        </div>

    </div>
</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>




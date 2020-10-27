<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script>
    window.onload = function() {
        window.editor = SUNEDITOR.create((document.getElementById('sample') || 'sample'), {
            lang: SUNEDITOR_LANG['ko'],
            width: '100%',
            height: '500px',
            font: [
                'Arial', 'Comic Sans MS', 'IMPACT', 'D2Coding'
            ],
            buttonList: [
                ['font', 'fontSize', 'formatBlock'],
                ['bold', 'underline', 'italic', 'strike', 'removeFormat'],
                ['fontColor', 'hiliteColor', 'outdent', 'indent', 'align', 'horizontalRule'],
                ['fullScreen','codeView','image']
            ]
        });
    }

    function check() {
        const title = $('input[name=diaryTitle]').val();
    	const contents = editor.getContents();
        console.log(title);
        
        if(!title){
        	alert("제목을 입력해주세요.")
        	return false;
        }
        else if (!contents || contents == '<p><br></p>') {
            alert("내용을 입력해주세요.");
            return false;
        } else {
            var textarea = editor.getContext().element.originElement;
            textarea.value = contents;
            return true;
        }

    }
</script>


<div class = "col-sm-10 offset-sm-1">  

    <h2>STUDY DIARY</h2>
    
    <div class ="form-group">
	    <form method="post" onsubmit="return check();" action="${ pageContext.request.contextPath }/diary/insertDiary.do"> 
	        <input name="diaryTitle" class="form-control" type="text" placeholder="제목을 입력해주세요."/>
	        <textarea name="diaryContent" id="sample"></textarea>
	        <input class = "btn btn-secondary text-center" type="submit" value="작성">
	        <input type="hidden" name="memberId" value="${loginMember.memberId}" readonly/>
	    </form>
    </div>
</div>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>
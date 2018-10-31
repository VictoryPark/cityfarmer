<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/diary/main2.css"/>">
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script> -->
    <style>
        body {
            margin:0 auto;
        }

        h1 {
            font-size: 30px;
            text-align: left;
            width: auto;
            float: left;
            padding: 15px 0;
        }

        #slideshow {
            margin: 0% auto;
            position: absolute;
            width: 1200px;
            height: 300px;
            padding: 13%;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
        }

        #slideshow>div {
            position: absolute;
            top: 10px;
            left: 10px;
            right: 10px;
            bottom: 10px;
        }
        
       #panel {
           margin: auto;
           position: absolute;
           top: 435px;
           width: 1200px;
           height: 320px;
       }

        #update, #del, #list {
           margin: 5px;
           position: relative;
           top: 660px;
           float: right;
       } 
        
        
    </style>
</head>

<body>
    <header>
        <h1><span>City</span> Farmer</h1>
        <nav>
            <a href="">About</a>
            <a href="">물물교환</a>
            <a href="">공동구매</a>
            <a href="">꿀팁</a>
            <a href="">식물일기</a>
            <a href="">식물갤러리</a>
            <a href="">로그인</a>
            <a href="">회원가입</a>
        </nav>
    </header>

    <div id="slideshow">
        <div id="i1">
            <img src="<c:url value="/resources/css/diary/img/ga1.jpg"/>" width="100%" height="100%">
        </div>
        <div id="i2">
            <img src="<c:url value="/resources/css/diary/img/ga2.jpg"/>" width="100%" height="100%">
        </div>
        <div id="i3">
            <img src="<c:url value="/resources/css/diary/img/ga3.jpg"/>" width="100%" height="100%">
        </div>
        <div id="i4">
            <img src="<c:url value="/resources/css/diary/img/ga4.jpg"/>" width="100%" height="100%">
        </div>
    </div>

    <div class="panel panel-default" id="panel">
        <div class="panel-heading">
         <p class="panel-title">제목 : ${board.drTitle}</p><hr>
          <p class="panel-writer">작성자 : ${board.writer}</p>
          <p class="panel-regdate">작성일 : <fmt:formatDate value="${board.drRegDate}" pattern="yyyy-MM-dd" /></p>

        </div>
        <div class="panel-body">
          <div class="panel-content">${board.drContent}</div>
        </div>
    </div>
    <div>
    <button type="button" id="del" onclick="button1_click();" class="btn pull-right btn-default">삭제</button>
    <button type="button" id="update" onclick="button2_click();" class="btn pull-right btn-default">수정</button>
    <button type="button" id="list" onclick="button3_click();" class="btn pull-right btn-default">목록</button>
    </div>

    <script>
        $("#slideshow > div:gt(0)").hide();

        setInterval(function () {
            $('#slideshow > div:first')
                .fadeOut(1000)
                .next()
                .fadeIn(1000)
                .end()
                .appendTo('#slideshow');
        }, 3000);
        
        function button1_click() {
        	location.href = "diarydelete.cf?no=${board.drNo}";
        }
        
        function button2_click() {
        	location.href = "diaryupdateForm.cf?no=${board.drNo}";
        }
        
        function button3_click() {
        	location.href = "diarylist.cf";
        }
    </script>
</body>
</html>
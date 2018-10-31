<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Detail_Exchange</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/exchange/detailexchange.css"/>">
</head>
<body>
	<header>
        <h1><span>City</span>Farms</h1>
        <nav>
            <a href="">About</a>
            <a href="">Menu</a>
            <a href="">Locations</a>
            <a href="">Gallery</a>
            <a href="">Reviews</a>
            <a href="">Contact</a>
        </nav>
    </header>
    <div class="top-section">
        <div class="main-image"><img id="title-img" src="<c:url value="/resources/img/exchange/exchange3_1.jpg"/>" /></div>
    </div>
    <br>
    <div class="bottom-section">
        <div id="inner">
            <table id="detail">
                <tr>
                    <th>제목</td>
                    <td colspan="5">${board.exTitle}
                        <span id="check">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="inlineCheckbox1" value="option1"> 거래완료
                            </label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${board.writer}</td>
                    <th>작성일</th>
                    <td>${board.regDate}</td>
                    <th>조회수</th>
                    <td>${board.exViewCnt}</td>
                </tr>
                <tr id="content">
                    <td  colspan="6">${board.exContent}</td>
                </tr>
                <!-- <tr>
                    <button type="button" class="btn btn-success list">목록</button>
                    <button type="button" class="btn btn-info update">수정</button>
                    <button type="button" class="btn btn-danger">삭제</button>
                </tr> -->
            </table>
            <div id="buttonbox">
                <button type="button" class="btn btn-success list">목록</button>
                <button type="button" value="${board.exNo}" class="btn btn-info update">수정</button>
                <button type="button" class="btn btn-danger">삭제</button>
            </div>
            <div id="reply">
                <form id="reply" method="POST">
                    <table>
                        <tr>
                            <td id="write">
                                <textarea id="writereply" 
                                        class="form-control" rows="5" name="repl"
                                        >댓글을 입력해주세요.</textarea>
                                <div id="submitbutton">
                                    <a class="btn btn-default" href="#" role="button">등록</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                    
                </form>
                <div id="listreply">
                    <table id="reply">
                        <tr id="head">
                            <td id="writer">${writer}</td>
                            <td id="regDate">${regDate}</td>
                        </tr>
                        <tr id="content">
                            <td id="content">${content}</td>
                            <td id="buttons">
                                <button type="button" id="repldelete" class="btn btn-default btn-xs">삭제</button>
                                <button type="button" id="replupdate" class="btn btn-default btn-xs">수정</button>
                            </td>
                        </tr>
                        <tr id="blank"></tr>
                        <tr id="head">
                            <td id="writer">${writer}</td>
                            <td id="regDate">${regDate}</td>
                        </tr>
                        <tr id="content">
                            <td id="content"colspan="2">${content}</td>
                        </tr>
                        <tr id="blank">
                            
                        </tr>
                        <tr id="head">
                            <td id="writer">${writer}</td>
                            <td id="regDate">${regDate}</td>
                        </tr>
                        <tr id="content">
                            <td id="content"colspan="2">${content}</td>
                        </tr>
                        <tr id="blank"></tr>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <script>
    	$("button.update").click(function() {
    		alert($(this).val())
    		location.href("<c:url value='/exchange/updateform.cf'/>" +"?exno="+$(this).val()")
    	})
    </script>
</body>
</html>
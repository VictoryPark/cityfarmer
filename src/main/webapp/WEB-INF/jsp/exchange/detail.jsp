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
<script>
$(document).ready(function(){
	$.ajax({
		url : "<c:url value='/exchange/comment/list.cf'/>",
		type : "POST",
		data : "exNo=${map.board.exNo}"
	}).done(function(list){
		if(list != null) {
			showcommentList(list);
		} //not null
	}) //done
})//document.ready
</script>

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
                    <td colspan="5">${map.board.exTitle}
                        <span id="check">
                            <label class="checkbox-inline">
                                <input type="checkbox" id="inlineCheckbox1" value="option1"> 거래완료
                            </label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${map.board.writer}</td>
                    <th>작성일</th>
                    <td>${map.board.regDate}</td>
                    <th>조회수</th>
                    <td>${map.board.exViewCnt}</td>
                </tr>
                <tr id="content">
                    <td  colspan="6"><div id="boardContent">${map.board.exContent}</div></td>
                </tr>
                <!-- <tr>
                    <button type="button" class="btn btn-success list">목록</button>
                    <button type="button" class="btn btn-info update">수정</button>
                    <button type="button" class="btn btn-danger">삭제</button>
                </tr> -->
            </table>
            <div id="buttonbox">
                <button type="button" class="btn btn-success list">목록</button>
                <c:if test="${map.board.writer == user.id }">
	                <button type="button" value="${map.board.exNo}" class="btn btn-info update">수정</button>
	                <button type="button" value="${map.board.exNo}" class="btn btn-danger delete">삭제</button>
                </c:if>
            </div>
            <div id="reply">
                <div id="listreply">
                	<div id="listsummary">
                		<table id="replysummary">
                			<tr>
                				<th><span id="count">댓글 : ${map.count} </span></th>
                				<th>
                					<select class="form-control input-sm">
                					<option value="asc">등록순</option>
                					<option value="decs">최신순</option>
                					</select>
                				</th>
                			</tr>
                		</table>
                	</div>
                    <table id="reply">
                       
                    </table>
                </div>
                <form id="reply" method="POST">
                
                    <table>
                        <tr>
                            <td id="write">
                                <textarea id="writereply" 
                                        class="form-control" rows="5" name="repl"
                                        >댓글을 입력해주세요.</textarea>
                                <div id="submitbutton">
                                    <a class="btn btn-default submit" href="#" role="button">등록</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>
    </div>
    <script>
    	$("button.update").click(function() {
    		//alert($(this).val())
    		location.href = "<c:url value='/exchange/updateform.cf'/>" +"?exno="+$(this).val()
    	})
    	$("button.list").click(function() {
    		location.href = "<c:url value='/exchange/list.cf'/>" +"?pageNo=1"
    	})
    	$("button.delete").click(function() {
    		location.href = "<c:url value='/exchange/delete.cf'/>" +"?exno="+$(this).val()
    	})
    	
    	
    	$("a.submit").click(function() {
    		$.ajax({
    			url : "<c:url value='/exchange/comment/write.cf'/>",
    			data : {
    				"excContent" : $("textarea#writereply").val(),
    				"excWriter" : "${user.id}",
    				"exNo" : "${map.board.exNo}"
    				   },
    			type : "POST"
    		}).done(function(list){
    			//console.log(list)
    			if(list != null) {
    				showcommentList(list);
    			} //not null

    			$("textarea#writereply").text("댓글을 입력해주세요.")
    		}) //done
    		
    		
    	}) //a.submit.click
    	

    	function deleteComment(excNo, exNo){
    		var check = confirm("정말 댓글을 삭제하시겠습니까?")
    		if(check ==true) {
    			//alert(check)
    			$.ajax({
    				url : "<c:url value='/exchange/comment/delete.cf'/>",
    				data : {
    					"excNo" : excNo,
    					"exNo" : exNo
    						}
    			}).done(function(list){
    				showcommentList(list)
    			})
    		} else {
    			
    		}
    		//alert(excNo);
    	} // deleteComment
    	
    	function updateComment(excNo){
    		alert(excNo);
    	} // updateComment
    	
    	function showcommentList(list) {
    		var text = '';
    		for(let comment of list){
    			//console.log(comment);
    		    text +='<tr id="head">'
    			text += '<td id="writer">'+comment.excWriter
    			if(comment.excWriter == "${map.board.writer}"){
    				text +='<span class="label label-info">작성자</span>'
    			}
    			text += '</td><td id="regDate">'+comment.regDateString+'</td></tr>'
    			text += '<tr id="content">'
    			text += '<td id="content">'+comment.excContent+'</td>'
    			text += '<td id="buttons">'
    			if(comment.excWriter == "${user.id}") {
	    			text += '<button type="button" id="repldelete" class="btn btn-default btn-xs" value="'+comment.excNo+'">삭제</button>'
	    			text += '<button type="button" id="replupdate" class="btn btn-default btn-xs" value="'+comment.excNo+'">수정</button>'
    			}
    			text += '</td></tr>'
				text += '<tr id="blank"></tr>'
    		}//for
			//console.log(text);
    		$("table#reply").html(text);
    		
    		$("button#repldelete").click(function(){
    			deleteComment($(this).val(), "${map.board.exNo}")
			})
			
    		$("button#replupdate").click(function(){
    			updateComment($(this).val(), "${map.board.exNo}")
			})
			
			
    	} //showcommentList
    </script>
</body>
</html>
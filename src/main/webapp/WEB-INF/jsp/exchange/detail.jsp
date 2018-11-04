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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/regular.css" 
    integrity="sha384-OEIzojYBMrmz48aIjVQj7VG38613/sxpP58OW9h5zBYC7biGFlv9tyu5kWmaAYlF" 
    crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/fontawesome.css" 
	integrity="sha384-HU5rcgG/yUrsDGWsVACclYdzdCcn5yU8V/3V84zSrPDHwZEdjykadlgI6RHrxGrJ" 
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/solid.css" 
	integrity="sha384-uKQOWcYZKOuKmpYpvT0xCFAs/wE157X5Ua3H5onoRAOCNkJAMX/6QF0iXGGQV9cP" 
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/fontawesome.css" 
	integrity="sha384-HU5rcgG/yUrsDGWsVACclYdzdCcn5yU8V/3V84zSrPDHwZEdjykadlgI6RHrxGrJ" 
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/solid.css" 
	integrity="sha384-uKQOWcYZKOuKmpYpvT0xCFAs/wE157X5Ua3H5onoRAOCNkJAMX/6QF0iXGGQV9cP" 
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/fontawesome.css" 
	integrity="sha384-HU5rcgG/yUrsDGWsVACclYdzdCcn5yU8V/3V84zSrPDHwZEdjykadlgI6RHrxGrJ" 
	crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/exchange/detailexchange.css"/>">
<script>
$(document).ready(function(){
	$.ajax({
		url : "<c:url value='/exchange/comment/list.cf'/>",
		type : "POST",
		data : "exno=${map.board.exNo}"
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
            <a href="<c:url value="/start.cf"/>">Contact</a>
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
    		} 
    		//alert(excNo);
    	} // deleteComment
    	
    	function updateform(excNo, exNo){
    		//alert(excNo);
    		$.ajax({
    				url : "<c:url value='/exchange/comment/updateform.cf'/>",
    				data : "exno=" +exNo,
    				type : "POST"
    			}).done(function(list){
    				var text = '';
    				for(let comment of list) {
    	    			//console.log(comment);
    	    			
    	    			if(comment.excRef == 0) {
    		    		    text +='<tr id="head'+comment.excNo+'">'
    		    			text += '<td id="writer" colspan="2">'+comment.excWriter
    		    			
    		    			if(comment.excWriter == "${map.board.writer}") {
    		    				text +='<span class="label label-info">작성자</span>'
    		    			} // 댓글 작성자가 게시글 작성자 일때..
    		    			
    		    			text += '<span id="regDate">'+comment.regDateString+'</span></td></tr>'
    		    			text += '<tr id="content">'
   		    				if(comment.excNo == excNo){	//수정하는 댓글에 textarea 뿌려주는 조건..
   	    	    				text += '<td id="content"><textarea class="form-control" id="excContent" rows="3">'+comment.excContent+'</textarea></td>'
   	    	    				text += '<td id="updatebutton">'
   	   							text += '<button type="button" id="update" class="btn btn-default btn-xs" value="'+comment.excNo+'">수정하기</button>'
   	   	    	    			text += '</td></tr>'
   	    	    			} else {
   		    	    			text += '<td id="content">'+comment.excContent+'</td>'
   		    	    			text += '<td id="updatebutton"><td></tr>'
   	    	    			}
    		    					
    						text += '<tr id="blank'+comment.excNo+'" value="'+comment.excNo+'"><td id="re'+comment.excNo+'" colspan="2"></td></tr>'
    						
    	    			}//exfRef ==0 //답글이 아니고 댓글일때..
    	    			
    	    		}// 댓글 list for
    	    		
    				//console.log(text);
    	    		$("table#reply").html(text); //ref =0 인 댓글들 html 삽입..
    	    		
    	    		var com = null;
    	    		for(let comment of list) {
    	    			com = comment;
    		    		if(comment.excRef == 0) continue;	//4번 7번 8번 ref 만 내려옴..
    		    		console.log(comment.excRef, comment.excNo)
    		    		
    		    			for( let blank of $("tr[id^='blank']")){
    		    				//console.log(blank.getAttribute("value"))
    					    	var text = '';
    		    			
    		    				if(comment.excRef == blank.getAttribute("value")) {
    					    		console.log(comment.excRef, comment.excNo)
    		    					console.log("blank-value", blank.getAttribute("value"))
    					    		//console.log($("tr[id^='blank']"))
    				   				
    				   				text += '<div id="rere'+comment.excNo+'">'
    				 		    	text += '<p>↳ <span id="reWriter">'+comment.excWriter+'</span>'
    				 		    		
    				 		    	if(comment.excWriter == "${map.board.writer}") {
    				   					text +='<span class="label label-info">작성자</span>'
    				   				}
    				 		    		
    				 		    	text += '<span id="regDate">'+comment.regDateString+'</span></p>'
    				 		    	text += '<span id="reContent">'+comment.excContent+'</span>'
    				 		    		
    				 		    	if(comment.excWriter == "${user.id}") {
    					    			text += '<a href="#'+comment.excNo+'" id="repldeletere" data-toggle="tooltip" data-placement="bottom" title="삭제"><i class="far fa-trash-alt"></i></a>'
    					    			text += '<a href="#'+comment.excNo+'" id="replupdatere" data-toggle="tooltip" data-placement="bottom" title="수정"><i class="fas fa-wrench"></i></a>'
    				    			} else {
    				    				text += '<a href="#'+comment.excNo+'" id="replyre" data-toggle="tooltip" data-placement="bottom" title="댓글 달기"><i class="fas fa-reply"></i></i></a>'
    				    			}
    				  		    		text += '</div>'
    				  		    		
    							text += '';
    				  			$("tr#blank"+com.excRef+" > td").append(text)
    		    				} //blank value 와 ref 같으면...if
    		    			} //blank value 값 찾는 for 문...		
    		   			
    		    		
    	    		} // 답글 뿌려주는 for
    				
    			
    	    		$("table#reply").html(text);
		    		$("button#update").click(function() {
		    			updateComment(excNo, exNo);
		    		})
		    		
    		}) //done 
    		
    	} // updateform
    	
    	function updateComment(excNo, exNo) {
    			//alert($("textarea#excContent").val());
    		$.ajax({
    			url : "<c:url value='/exchange/comment/update.cf'/>",
    			data : {
    					"excNo" : excNo,
    					"exNo" : exNo,
    					"excContent" : $("textarea#excContent").val()
    					},
    			type : "POST"
    		}).done(function(list){
    			showcommentList(list)
    		}) //done
    	}//updateComment
    	
    	function insertformReply(excNo, exNo) {
    		var text = '<tr><td id="rere" colspan="2">';
    		text += '<div id="rere">'
    		text += '<input id="reWriter" type="hidden" value="${user.id}"/>'
    		text += '<textarea id="reContent" class="form-control" name="excContent" rows="2">답글을 입력해주세요.</textarea>'
    		text += '<button type="button" id="cancelRepl" class="btn btn-default btn-xs" value="'+excNo+'">취소</button>'
    		text += '<button type="button" id="writeRepl" class="btn btn-default btn-xs" value="'+excNo+'">답글 등록하기</button>'
    		text += '</div></td></tr>'
    		
    		$("tr#content"+excNo).after(text)
    		$("tr#content"+excNo).addClass("rere")
    		
    		$("button#writeRepl").click(function (){
    			insertReply(excNo, exNo);
    		})
    		$("button#cancelRepl").click(function (){
    			showcommentList(excNo, exNo);
    		})
    		
    	} // insertReply
    	
    	function insertReply(excNo, exNo) {
    		$.ajax({
    			url : "<c:url value='/exchange/comment/writerepl.cf'/>",
    			data : {
    					"excRef" : excNo,
    					"excParentNo" : excNo,
    					"exNo" : exNo,
    					"excContent" : $("textarea#reContent").val(),
    					"excWriter" : $("input#reWriter").val()
    					},
    			type : "POST"
    		}).done(function(list){
    			showcommentList(list)
    		}) //done
    	} //insertRepl
    	
    	function deleteReply(excNo, exNo) {
    		$.ajax({
    			
    		}) 
    	} //deleteReply
    	
    	
    	function showcommentList(list) {
    		var text = '';
    		//console.log(list)
    		for(let comment of list) {
    			//console.log(comment);
    			
    			if(comment.excRef == 0) {
	    		    text +='<tr id="head'+comment.excNo+'">'
	    			text += '<td id="writer" colspan="2">'+comment.excWriter
	    			
	    			if(comment.excWriter == "${map.board.writer}") {
	    				text +='<span class="label label-info">작성자</span>'
	    			} // 댓글 작성자가 게시글 작성자 일때..
	    			
	    			text += '<span id="regDate">'+comment.regDateString+'</span></td></tr>'
	    			text += '<tr id="content'+comment.excNo+'">'
	    			text += '<td id="content">'+comment.excContent+'</td>'
	    			text += '<td id="buttons">'
	    			
	    			if(comment.excWriter == "${user.id}") {
		    			text += '<a href="#'+comment.excNo+'" id="commdelete"data-toggle="tooltip" data-placement="bottom" title="삭제"><i class="far fa-trash-alt"></i></a>'
		    			text += '<a href="#'+comment.excNo+'" id="commupdate" data-toggle="tooltip" data-placement="bottom" title="수정"><i class="fas fa-wrench"></i></a>'
	    			} else {
	    				text += '<a href="#'+comment.excNo+'" id="reply" data-toggle="tooltip" data-placement="bottom" title="댓글 달기"><i class="fas fa-reply"></i></i></a>'
	    			}	//댓글 작성자가 로그인한 아이디일때와 아닐때..
	    			
	    			text += '</td></tr>'		
					text += '<tr id="blank'+comment.excNo+'" value="'+comment.excNo+'"><td id="re'+comment.excNo+'" colspan="2"></td></tr>'
					
    			}//exfRef ==0 //답글이 아니고 댓글일때..
    			
    		}// 댓글 list for
    		
			//console.log(text);
    		$("table#reply").html(text); //ref =0 인 댓글들 html 삽입..
    		
    		var com = null;
    		for(let comment of list) {
    			
	    		if(comment.excRef == 0) continue;	//4번 7번 8번 ref 만 내려옴..
	    		//console.log(comment.excRef, comment.excNo)
	    		
	    			for( let blank of $("tr[id^='blank']")){
	    				//console.log(blank.getAttribute("value"))
				    	var text = '';
	    			
	    				if(comment.excRef == blank.getAttribute("value")) {
				    		//console.log(comment.excRef, comment.excNo)
	    					//console.log("blank-value", blank.getAttribute("value"))
				    		//console.log($("tr[id^='blank']"))
			   				
			   				text += '<div id="rere'+comment.excNo+'">'
			 		    	text += '<p>↳ <span id="reWriter">'+comment.excWriter+'</span>'
			 		    		
			 		    	if(comment.excWriter == "${map.board.writer}") {
			   					text +='<span class="label label-info">작성자</span>'
			   				}
			 		    		
			 		    	text += '<span id="regDate">'+comment.regDateString+'</span></p>'
			 		    	text += '<span id="reContent">'+comment.excContent+'</span>'
			 		    		
			 		    	if(comment.excWriter == "${user.id}") {
				    			text += '<a href="#'+comment.excNo+'" value="'+comment.excRef+'" id="repldeletere" data-toggle="tooltip" data-placement="bottom" title="삭제"><i class="far fa-trash-alt"></i></a>'
				    			text += '<a href="#'+comment.excNo+'" value="'+comment.excRef+'" id="replupdatere" data-toggle="tooltip" data-placement="bottom" title="수정"><i class="fas fa-wrench"></i></a>'
			    			} else {
			    				text += '<a href="#'+comment.excNo+'" value="'+comment.excRef+'" id="replyre" data-toggle="tooltip" data-placement="bottom" title="댓글 달기"><i class="fas fa-reply"></i></i></a>'
			    			}
			  		    		text += '</div>'
			  		    		
						text += '';
			  			$("tr#blank"+comment.excRef+" > td").append(text)
	    				} //blank value 와 ref 같으면...if
	    			} //blank value 값 찾는 for 문...		
	   			
	    		
    		} // 답글 뿌려주는 for
    		
    		$("textarea#writereply").val("댓글을 입력해주세요.")
    		
    		//댓글 삭제 버튼
    		$("a#commdelete").click(function(){
    			deleteComment($(this).attr("href").substring(1), "${map.board.exNo}")
			})
			
			//댓글 수정 버튼
    		$("a#commupdate").click(function(){
    			//alert($(this).attr("href").substring(1))
    			updateform($(this).attr("href").substring(1), "${map.board.exNo}")
			})
			
			//아이콘 갖다 댈때 툴팁
			$('[data-toggle="tooltip"]').tooltip()
			
			//답글 form 버튼
			$("a#reply").click(function() {
				insertformReply($(this).attr("href").substring(1), "${map.board.exNo}");
			})
			
			//답글의 삭제 버튼
			$("a#repldeletere").click(function() {
				//alert($(this).attr("href").substring(1))
				//alert($(this).attr("value"))
				deleteReply($(this).attr("href").substring(1), "${map.board.exNo}"/* , $(this).attr("value") */);
			})
			
    	} //showcommentList
    	
    	
    </script>
</body>
</html>
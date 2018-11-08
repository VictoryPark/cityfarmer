<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
$("button.update").click(function() {
	//alert($(this).val())
	location.href = "<c:url value='/exchange/updateform.cf'/>" +"?exno="+$(this).val()
})
$("button.list").click(function() {
	location.href = "<c:url value='/exchange/list.cf'/>" +"?pageNo=1"
})
$("button.delete").click(function() {
	var check = confirm("정말 게시글을 삭제하시겠습니까?")
	if(check ==true) {
		location.href = "<c:url value='/exchange/delete.cf'/>" +"?exno="+$(this).val();	
	}
})


$("input[type='checkbox']").click(function(){
	if($(this).is(":checked")){ //체크햇을때..if
		//alert("거래 완료되었습니다.")
		swal({
			  type: 'success',
			  title: '거래가 완료 되었습니다.',
			  showConfirmButton: false,
			  timer: 3000
			})
		setTimeout(function (){
			$.ajax({
				url : "<c:url value='/exchange/updatey.cf'/>",
				data : "exno=${map.board.exNo}", 
				type : "POST"
			}).done(function(updateno) {
				if(updateno = 1){
					location.href = "<c:url value='/exchange/list.cf'/>" +"?pageNo=1"				
				}
			})
			
		}, 3000);
		
	} else {
		$.ajax({
			url : "<c:url value='/exchange/updaten.cf'/>",
			data : "exno=${map.board.exNo}", 
			type : "POST"
		}).done(function(updateno) {
			if(updateno = 1){
				alert("거래 취소되었습니다.")
				$(this).removeAttr("checked")
				location.href = "<c:url value='/exchange/list.cf'/>" +"?pageNo=1"				
			}
		}) //done
	} //체크를 uncheck 했을때..
}) // 거래완료 체크 ..


$("select").change(function(){
	var $selected = $("select option:selected").val();
	//alert($selected)
	
	if($selected == "desc") {
		$.ajax({
			url : "<c:url value='/exchange/comment/order.cf'/>",
			data : "exno=${map.board.exNo}", 
			type : "POST"
		}).done(function(list) {
			showcommentList(list)
		}) //done
	} else {
		$.ajax({
			url : "<c:url value='/exchange/comment/list.cf'/>",
			data : "exno=${map.board.exNo}", 
			type : "POST"
		}).done(function(list) {
			showcommentList(list)
		}) //done
	}
	
})



$("a.submit").click(function() {
	
	if($("textarea#writereply").val() == "") {
		alert("댓글 내용을 입력해주세요.")
		$("textarea#writereply").focus()
		return;
	} else {
		$.ajax({
			url : "<c:url value='/exchange/comment/write.cf'/>",
			data : {
				"excContent" : $("textarea#writereply").val(),
				"excWriter" : "${user.id}",
				"exNo" : "${map.board.exNo}"
				   },
			type : "POST"
		}).done(function(map){
			//console.log(list)
			if(map != null) {
				$("span#count2").html(map.count)
				showcommentList(map.list);
			} //not null
		}) //done
		
	} //if-else
	
	
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
		}).done(function(map){
			$("span#count2").html(map.count)
			showcommentList(map.list)
		}) //done
	} 
	
	//alert(excNo);
} // deleteComment

function updateform(excNo, exNo, list){
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
	    			
	    			text += '<span id="regDate">'+comment.excRegDate+'</span></td></tr>'
	    			text += '<tr id="content'+comment.excNo+'">'
	    			
    				if(comment.excNo == excNo){	//수정하는 댓글에 textarea 뿌려주는 조건..
  	    				text += '<td id="content"><textarea class="form-control" id="excContent" rows="3">'+comment.excContent+'</textarea></td>'
  	    				text += '<td id="updatebutton">'
						text += '<button type="button" id="cancle" class="btn btn-default btn-xs" value="'+comment.excNo+'">취소</button>'
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
    		//console.log($("table#reply"))
			$("table#reply").html(text); //ref =0 인 댓글들 html 삽입..
    		$("button#cancle").click(function(){
    			showcommentList(list)
    		})
    		
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
			 		    		
			 		    	text += '<span id="regDate">'+comment.excRegDate+'</span></p>'
			 		    	text += '<span id="reContent">'+comment.excContent+'</span>'
			 		    		
			 		    	if(comment.excWriter == "${user.id}") {
				    			text += '<a href="#'+comment.excNo+'" id="repldeletere" data-toggle="tooltip" data-placement="bottom" title="삭제"><i class="far fa-trash-alt"></i></a>'
				    			text += '<a href="#'+comment.excNo+'" id="replupdatere" data-toggle="tooltip" data-placement="bottom" title="수정"><i class="fas fa-wrench"></i></a>'
			    			} else {
			    				text += '<a href="#'+comment.excNo+'" id="replyre" data-toggle="tooltip" data-placement="bottom" title="댓글 달기"><i class="fas fa-reply"></i></i></a>'
			    			}
			  		    		text += '</div>'
			  		    		
						//text += '';
			  			$("tr#blank"+comment.excRef+" > td").append(text)
	    				} //blank value 와 ref 같으면...if
	    			} //blank value 값 찾는 for 문...		

    		} // 답글 뿌려주는 for

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
	}).done(function(map){
		$("span#count2").html(map.count)
		showcommentList(map.list)
		
	}) //done
}//updateComment

function insertformReply(excNo, exNo, list) {
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
		showcommentList(list);
	})
	
} // insertformReply

function insertformReplyRe(excNo, refNo, exNo, list, aObject){
	//alert(excNo)
	//alert(refNo)
	//alert(exNo)
	//alert(excNo)
	var text = '<div id="rere">';
	text += '<input id="reWriter" type="hidden" value="${user.id}"/>'
	text += '<textarea id="reContent" class="form-control" name="excContent" rows="2">답글을 입력해주세요.</textarea>'
	text += '<button type="button" id="cancelreRepl" class="btn btn-default btn-xs" value="'+excNo+'">취소</button>'
	text += '<button type="button" id="writereRepl" class="btn btn-default btn-xs" value="'+excNo+'">답글 등록하기</button>'
	text += '</div>'
	$("a#commupdate").html("");
	$("a#commdelete").html("");
	$("a#reply").html("");
	$("a#replyre").html("");
	
	aObject.parent().after(text)
	/* $("td#re"+refNo).append(text) */
	//$("tr#content"+excNo).addClass("rere")
	
	$("button#writereRepl").click(function (){
		insertReplyre(excNo, refNo, exNo);
	})
	$("button#cancelreRepl").click(function (){
		showcommentList(list);
	})
}

function insertReplyre(excParentNo, refNo, exNo){
	$.ajax({
		url : "<c:url value='/exchange/comment/writerepl.cf'/>",
		data : {
				"excRef" : refNo,
				"excParentNo" : excParentNo,
				"exNo" : exNo,
				"excContent" : $("textarea#reContent").val(),
				"excWriter" : $("input#reWriter").val()
				},
		type : "POST"
	}).done(function(map){
		$("span#count2").html(map.count)
		showcommentList(map.list)
	}) //done
}

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
	}).done(function(map){
		$("span#count2").html(map.count)
		showcommentList(map.list)
	}) //done
} //insertRepl

function deleteReply(excNo, exNo) {
	var check = confirm("정말 댓글을 삭제하시겠습니까?")
	if(check ==true) {
		$.ajax({
			url : "<c:url value='/exchange/comment/deleterepl.cf'/>",
			data : {
					"excNo" : excNo,
					"exNo" : exNo
					},
			type : "POST"
		}).done(function(map){
			$("span#count2").html(map.count)
			showcommentList(map.list)
		}) //done
	}
} //deleteReply

function updateformReply(excNo, exNo, list) {
	$.ajax({
		url : "<c:url value='/exchange/comment/updateformrepl.cf'/>",
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
    			
    			text += '<span id="regDate">'+comment.excRegDate+'</span></td></tr>'
    			text += '<tr id="content'+comment.excNo+'">'
    			text += '<td id="content">'+comment.excContent+'</td>'
    			text += '<td id="buttons">'				
				text += '<tr id="blank'+comment.excNo+'" value="'+comment.excNo+'"><td id="re'+comment.excNo+'" colspan="2"></td></tr>'
				
			}//exfRef ==0 //답글이 아니고 댓글일때..
			
		}// 댓글 list for
		
		//console.log(text);
		//console.log($("table#reply"))
		$("table#reply").html(text); //ref =0 인 댓글들 html 삽입..
		
		
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
		 		    		
		 		    	text += '<span id="regDate">'+comment.excRegDate+'</span></p>'
		 		    	if(comment.excNo == excNo) {
		 		    		text += '<div id="reContent'+comment.excNo+'">'
		 		    		text += '<textarea class="form-control" id="reContent" rows="3">'+comment.excContent+'</textarea>'
   	   						text += '<button type="button" id="cancleRepl" class="btn btn-default btn-xs" value="'+comment.excNo+'">취소</button></div>'
   	   						text += '<button type="button" id="updateRepl" class="btn btn-default btn-xs" value="'+comment.excNo+'">수정하기</button></div>'
   	   						
		 		    	} else {
			 		    	text += '<span id="reContent">'+comment.excContent+'</span>'				 		    		
		 		    	}
		 		    
	  		    		text += '</div>'
		  		    		
					//text += '';
		  			$("tr#blank"+comment.excRef+" > td").append(text)
    				} //blank value 와 ref 같으면...if
    			} //blank value 값 찾는 for 문...		

		} // 답글 뿌려주는 for
		
		$("button#updateRepl").click(function() {
			/* alert(excNo)
			alert(exNo) */
			updateRepl(excNo, exNo);
		})
		
		$("button#cancleRepl").click(function(){
    			showcommentList(list)
    	})
	})//done
} //updateformReply

function updateRepl(excNo, exNo){
	$.ajax({
		url : "<c:url value='/exchange/comment/updaterepl.cf'/>",
		data : {
				"excNo" : excNo,
				"exNo" : exNo,
				"excContent" : $("textarea#reContent").val()
				},
		type : "POST"
	}).done(function(map){
		$("span#count2").html(map.count)
		showcommentList(map.list)
	}) //done
} //updateRepl

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
			
			text += '<span id="regDate">'+comment.excRegDate+'</span></td></tr>'
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
 		    		
 		    	text += '<span id="regDate">'+comment.excRegDate+'</span></p>'
 		    	text += '<span id="reContent">'+comment.excContent+'</span>'
 		    		
 		    	if(comment.excWriter == "${user.id}") {
	    			text += '<a href="#'+comment.excNo+'" value="'+comment.excRef+'" id="repldeletere" data-toggle="tooltip" data-placement="bottom" title="삭제"><i class="far fa-trash-alt"></i></a>'
	    			text += '<a href="#'+comment.excNo+'" value="'+comment.excRef+'" id="replupdatere" data-toggle="tooltip" data-placement="bottom" title="수정"><i class="fas fa-wrench"></i></a>'
    			} else {
    				text += '<a href="#'+comment.excNo+'" value="'+comment.excRef+'" id="replyre" data-toggle="tooltip" data-placement="bottom" title="댓글 달기"><i class="fas fa-reply"></i></i></a>'
    			}
  		    		text += '</div>'
  		    		
			//text += '';
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
		updateform($(this).attr("href").substring(1), "${map.board.exNo}", list)
	})
	
	//아이콘 갖다 댈때 툴팁
	$('[data-toggle="tooltip"]').tooltip()
	
	//댓글의 답글 insert form 버튼
	$("a#reply").click(function() {
		insertformReply($(this).attr("href").substring(1), "${map.board.exNo}", list);
	})
	
	//답글의 삭제 버튼
	$("a#repldeletere").click(function() {
		//alert($(this).attr("href").substring(1))
		//alert($(this).attr("value"))
		deleteReply($(this).attr("href").substring(1), "${map.board.exNo}"/* , $(this).attr("value") */);
	})
	
	//답글의 수정 버튼
	$("a#replupdatere").click(function() {
		updateformReply($(this).attr("href").substring(1), "${map.board.exNo}",list);
	})
	
	//댓글의 답글의 답글 버튼 클릭
	$("a#replyre").click(function() {
		//alert($(this).attr("href").substring(1))
		//alert($(this).attr("value"))
		//alert("${map.board.exNo}")
		insertformReplyRe($(this).attr("href").substring(1), 
				$(this).attr("value"), "${map.board.exNo}", 
				list, 
				$(this))
	})
} //showcommentList


</script>
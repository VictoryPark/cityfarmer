<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
    </script>
<link rel='stylesheet' type='text/css'
	href="<c:url value="/resources/css/diary/main2.css"/>">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script> -->
<style>
body {
	margin: 0 auto;
}

.panel-body {
    padding: 15px;
    clear: both;
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
	position: relative;
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
	position: relative;
/* 	top: 435px; */
	clear:both;
	/* width: 1200px;
	height: 320px; */
}

#update, #del, #list {
	margin: 5px;
	position: relative;
/* 	top: 510px; */
	/* float: right; */
}

.container {
 	position: relative;
	/* top: 532px; */
	clear: both;
}

.container2 {
	position: relative; 
	/* top: 487px; */
}

.comm_btn{
	max-height:50px;
	max-width: 50px;
}

img {
	width: 100%;
	height: 100%;
}

#btn {
	position: relative;
	
}


</style>
</head>

<body>
	<c:import url="../common/header.jsp" />

	<div id="slideshow">
		<div id="i1">
			<img src="<c:url value="/resources/img/diary/ga1.jpg"/>" width="100%"
				height="100%">
		</div>
		<div id="i2">
			<img src="<c:url value="/resources/img/diary/ga2.jpg"/>" width="100%"
				height="100%">
		</div>
		<div id="i3">
			<img src="<c:url value="/resources/img/diary/ga3.jpg"/>" width="100%"
				height="100%">
		</div>
		<div id="i4">
			<img src="<c:url value="/resources/img/diary/ga4.jpg"/>" width="100%"
				height="100%">
		</div>
	</div>
	<br>
	<div class="panel panel-default" id="panel">
		<div class="panel-heading">
			<p class="panel-title">제목 : ${board.drTitle}</p>
			<hr>
			<p class="panel-writer">작성자 : ${board.writer}</p>
			<p class="panel-regdate">
				작성일 :
				<fmt:formatDate value="${board.drRegDate}" pattern="yyyy-MM-dd" />
			</p>

		</div>
		<div class="panel-body">
			<div class="panel-content">${board.drContent}</div>
		</div>
	</div>
	<div id="btn">
		<button type="button" id="del" data-writer="${board.writer}" onclick="button1_click();"
			class="btn pull-right btn-default">삭제</button>
		<button type="button" id="update" data-writer="${board.writer}" onclick="button2_click();"
			class="btn pull-right btn-default">수정</button>
		<button type="button" id="list" onclick="button3_click();"
			class="btn pull-right btn-default">목록</button>
	</div>

		<div class="container">
			<div id="container">
				<ul id="commentlist">
				
				</ul>
			</div>
		<form id="commentForm" method="post">
			<input type="hidden" id="drNo" name="drNo"
				value="${board.drNo}" />
			<br>
			<br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="drcNo"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td>
								<div id="commWriter">${user.id}</div>
								<input type="hidden" name="drcWriter" value="${user.id}"/>
								<textarea style="width: 1100px" rows="3" cols="30"
									id="comment" name="drcContent" placeholder="댓글을 입력하세요" ></textarea>
								<br>
								<div>
									 <%-- <a href='#' onClick="fn_comment('${Comment.drcNo}')"
										class="btn pull-right btn-success">등록</a> --%> 
										<button type="button"  id="combtn" class="btn pull-right btn-success">등록</button>
								</div></td>
					</table>
					
					</div>
				</div>
			</div>
		</form>
	</div>

	<div class="container2">
		<form id="commentListForm" method="post">
			<div id="commentList"></div>
		</form>
	</div>
	
	 <c:import url="../common/footer.jsp" />
	

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
	        
	        $("#del").click(function() {
	        	if($(this).data("writer") != '${user.id}') {
	        		alert("작성자만 삭제 가능합니다.")
	        		return;
	        	}
	        	location.href = "diarydelete.cf?no=${board.drNo}";
	        });
	        
	        $("#update").click(function() {
	        	if($(this).data("writer") != '${user.id}') {
	        		console.log($(this).data("writer"))
	        		alert("작성자만 수정 할 수 있습니다.")
	        		return;
	        	}
	        	location.href = "diaryupdateForm.cf?no=${board.drNo}";
	        });
	        
	        function button3_click() {
	        	location.href = "diarylist.cf";
	        }
	        
	        /*
	         * 댓글 등록하기(Ajax)
	         */
	        
	     $("#combtn").click(function (e) {
			
				$.ajax({
					url: "<c:url value='/diary/diarycommentwriter.cf'/>",
					type: "POST",
					data: {
						"drcContent": $("#comment").val(),
						"drcWriter": "${user.id}",
						"drNo": "${board.drNo}"
					},
				}).done(function(result) {
					if($("#comment").val() == "") {
		        		e.preventDefault();
		        		alert("내용을 입력하세요")
		        		return false;
		        	}
					/* commentList(); */
					getCommentList();
					$("#commentList").val("");
					$('[name=drcContent]').val("");
					
				});
			});
	        
	      
	        
	         
	        /**
	         * 초기 페이지 로딩시 댓글 불러오기
	         */
	            getCommentList();	            
	         
	        /**
	         * 댓글 불러오기(Ajax)
	         */
	       function getCommentList(){
	            
	            $.ajax({
	                type:'GET',
	                url : "<c:url value='/diary/diarycommentlist.cf'/>",
	                dataType : "json",
	                data: "no=${board.drNo}",
	                success : function(data){
	                	
	                		var html = "";
	                		var drcNo = data.length;
	                		
	                	 if(data.length > 0){
		                        
		                        for(i=0; i<data.length; i++){
		                            html += "<div>";
		                            html += "<div><table class='table'><h6><strong>"+data[i].drcWriter+"</strong></h6>";
		                            html += data[i].drcContent + "<tr><td></td></tr>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
		                            html += "<div class='comm_btn btn btn-danger modalDelBtn'>"
		                            html += "<a href=" + data[i].drcNo + " data-writer=" + data[i].drcWriter + ">삭제</a>"
		                            html += "</table></div>";
		                            html += "</div>";   // suc안에 넣어주기
		                        }
		                        
		                    } else {
		                        
		                        html += "<div>";
		                        html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
		                        html += "</table></div>";
		                        html += "</div>";
		                        
		                    }
		                    
		                    $("#drcNo").html(drcNo);
		                    $("#commentList").html(html);
		                
		                }
		        	 }	        	       	     
	              )      
	            }; 
	            
	            // 댓글 삭제
	           	$(document).on("click", "div.comm_btn > a", function(e){
	           		e.preventDefault();
	           		var drcNo = $(this).attr("href");
	           		if('${user.id}' !== $(this).data("writer")) {
	           			alert("본인의 댓글만 삭제할수 있습니다.")
	           			return;
	           		} 
	           	$.ajax({
	           		url: "<c:url value='/diary/diarydeletecomment.cf'/>",
	           		type: "post",
	           		data: "drcNo=" + drcNo
	           	}).done(function (result){
	           	 	getCommentList();
	           	});
	          })
	            
	        
	    </script>
	   
</body>
</html>
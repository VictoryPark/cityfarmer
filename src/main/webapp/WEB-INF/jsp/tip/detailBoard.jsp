<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>



<!-- 합쳐지고 최소화된 최신 CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
 
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
body {
	max-width: 1200px;
	margin: 0 auto;
	font-family: Montserrat, Helvetica, Arial, sans-serif;
}

h1, h3, h4 {
	color: black;
	text-transform: uppercase;
}

h1 {
	font-size: 30px;
	text-align: left;
	width: auto;
	float: left;
	padding: 15px 0;
}

h3 {
	font-size: 18px;
	text-align: center;
	padding: 15px;
}

h4 {
	font-size: 12px;
}

.main-title h3 {
	text-align: left;
	padding: 5px 0px;
	text-transform: uppercase;
	color: #e9c929;
}

p {
	padding: 0px 30px;
	line-height: 21px;
	font-size: 14px;
}

/*The widths are in a percentage!*/
header {
	width: 100%;
	height: 110px;
	border-bottom: 3px solid #ffdf3e;
	margin: 0 auto;
}

header span {
	color: #e9c929;
}

header nav {
	float: right;
	padding: 45px 0px;
}

header nav a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: bold;
	font-size: 14px;
	padding: 0 10px;
	color: black;
}

/*The widths are in a percentage!*/
.top-section, .bottom-section {
	width: 100%;
	margin: 0 auto;
	clear: both;
}

.main-image {
	width: 100%;
	height: auto;
	float: left;
}

.main-image img {
	width: 100%;
	border-bottom: 3px solid #ffdf3e;
}

.main-title {
	width: 100%;
	height: auto;
	float: left;
}

.main-title p {
	padding: 0px;
	line-height: 25px;
	font-size: 16px;
}

.section-one, .section-two, .section-three {
	width: 100%;
	height: auto;
	float: left;
	border-top: 1px solid #eee;
}

.section-one {
	border-radius: 1.5%;
}

.section-one h4 {
	padding: 10px 0px;
}

.section-two h4, .section-three h4 {
	padding: 10px 30px;
}

.menu {
	list-style: none;
	padding: 0px;
}

.menu li {
	padding: 10px 0;
	color: #77a466;
}

.reviews {
	color: #333;
	line-height: 21px;
	font-size: 16px;
}

.address {
	font-size: 16px;
	line-height: 24px;
}

.panel-body {
	height: 300px;
}

#forHeding {
	font-weight: 500;
	font-family: "Roboto", sans-serif;
}

.forComments {
	font-family: "Roboto", sans-serif;
	font-size: 20px;
	font-weight: 500;
	border-bottom: 1px solid black;
}

.forCommentsSize {
	margin-left: 22%;
	width: 60%;
	height: 90px;
}

.forbutton2 {
	height: 30px;
	margin-bottom: 20px;
	font-size: 11px;
}

.forCommentsContainer {
	clear: both;
	position: relative;
	padding: 10px 15px;
	background: #fbfbfb;
	color: #000;
	word-break: break-all;
	border-top: none;
}

.dropbtn {
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 40px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 5px 5px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>
<body>
	<%-- <header>
	<h1>
		<span>City</span>Farmmer
	</h1>
	<nav> <a href="">꿀팁게시판</a> <a href="">공구게시판</a> <a href="">물물교환
		게시판</a> <a href="">식물자랑 갤러리</a> <a href="">달력게시판</a> <a href="">로그인/마이페이지</a>
	</nav> </header>
	<div class="top-section">
		<div class="main-image">
			<img src="/img/hummel-1353423_1920.jpg" width="1200" height="300" />
		</div>
		<div class="main-title">
			<!--여기 제목-->
			<h3>${tipBoard.tipTitle}</h3>
			<p></p>
		</div>
	</div>
	<div class="bottom-section">
		<div class="section-one">
			<div class="panel panel-default">
				<div class="panel-heading" id="forHeding">${tipBoard.writer},
					댓글 몇개인지, 좋아요 갯수, ${tipBoard.tipRegDate}</div>
				<div class="panel-body">${tipBoard.tipContent}</div>
			</div>

		</div>
		<span class="forComments">Comments</span>
	</div>
	<br>

	<textarea></textarea>
	
	
	
	 --%>

	<header>
	<h1>
		<span>City</span>Farmmer
	</h1>
	<nav> <a href="">꿀팁게시판</a> <a href="">공구게시판</a> <a href="">물물교환
		게시판</a> <a href="">식물자랑 갤러리</a> <a href="">달력게시판</a> <a href="">로그인/마이페이지</a>
	</nav> </header>
	<div class="top-section">
		<div class="main-image">
			<img src="./img/hummel-1353423_1920.jpg" width="1200" height="300" />
		</div>
		<div class="main-title">
			<!--여기 제목-->
			<h3>${tipBoard.tipTitle}</h3>
			<p></p>
		</div>
	</div>
	<div class="bottom-section">
		<div class="section-one">
			<div class="panel panel-default">
				<div class="panel-heading" id="forHeding">${tipBoard.writer},
					댓글 몇개인지, 좋아요 갯수, ${tipBoard.tipRegDate}</div>
				<div class="panel-body">${tipBoard.tipContent}</div>
			</div>

		</div>
		<div id="writebtn" class="pull-right">
			<button type="button" class="btn btn-default updateForm">수정</button>

			<button type="button" class="btn btn-default delete">삭제</button>
		</div>
	</div>

	<br>
	<div class="forall1">
		<span class="forComments">Comments</span> <br> <br> <br>
		<div class="forCommentsContainer">
			<!-- 댓글 들어갈 부분 -->


			<div class="row">
				<div class="col-md-2">아란누나</div>
				<div class="col-md-8">하하하 이글 재밌네요~~</div>
				<div class="col-md-2">
					2018/11/1 09:00
					<div class="dropdown pull-right">
						<i class="glyphicon glyphicon-option-horizontal dropbtn"
							aria-hidden="true"></i>
						<div class="dropdown-content">
							<a href="#">수정</a> <a href="#">삭제</a>
						</div>
					</div>
				</div>
				<!-- colmd-2 -->

			</div>

			<br>

		</div>
		<!-- forCommentsContainer -->
		<br> <br>

<!--  댓글 등록 !!  나중 writer 세션받아와서 바꿔주기 -->
		<footer>
		
		
		
		<form id = "insertForm" method = "POST">
		<div class="forall2">
		<input type="hidden" name="tipNo" value="${tipboard.tipNo}" />
		 <input type="hidden" name="tipcWriter" value="아란이누나" />
			<textarea class="forCommentsSize" name = "tipcContent"></textarea>
			<button type="button" class="btn btn-primary btn-lg forbutton2" id = "insertComment">등록</button>
		</div>
		</form>
		
		
		</footer>

		<script>
		
			 
		//댓글 조회
			var commentList = function(){
	        	   $.ajax({
				        	 url: "<c:url value='/tip/listComment.cf'/>",
				        	 type: "POST",
				        	 data: "no=${tipBoard.tipNo}"
	        		   
	        	   }).done(function(result){
	        		   console.log(result)
	        		   
	        		   
	        		   for(let i = 0; i<result.length; i++){
	  	                 
		                	  $(".forCommentsContainer").append(
		 	                         "<div class  = 'row'>"
		 	                         + "<div class='col-md-2'>"+result[i].tipcWriter+"</div>"
		 	                         + "<div class='col-md-8'>"+result[i].tipcContent+"</div>"
		 	                         + "<div class='col-md-2'>"+result[i].tipcRegDate+"<div class='dropdown pull-right'>"
		 	                   	 +"<i class='glyphicon glyphicon-option-horizontal dropbtn' aria-hidden='true'></i>"
		 	                    +"<div class='dropdown-content'>"
		 	                      +"<a href='#' id = 'updateComment'>수정</a>"
		 	                      +"<a href='#' id = 'deleteComment' class = "+result[i].tipcNo+" '>삭제</a>"
		 	                    +"</div></div></div></div>"
		 	                   );
		                }
	        		   
	        	   })
	           };
	           //댓글 화면에 나타내기
	           
	           commentList();
	           
	   
	         //댓글 삭제
	         $(document).on("click", "#deleteComment" , function(e) {
	     
	            	var cNo = $(this).attr("class");
	            	
	            	
	            	$.ajax({
		            	url: "<c:url value='/tip/deleteComment.cf'/>",
		            	type: "POST",
		            	data: "cNo="+cNo
		            
		            }).done(function (result) {
		            	 console.log(result); 
		            	commentList();
		            });
	            });
	         
	         // 댓글 입력, tipcwriter에 로그인시 작성자 세션 추가하기
	     $(document).on("click", "#insertComment", function(e){
	    	 //serialize()는 "a=1&b=2&c=3&d=4&e=5"형태로 직렬화()시켜서 데이터 형성 쓰다 실패..
	    /* 	 var formData = $("#insertForm").serialize(); 
	     console.log(formData);*/
	    var tipcContent = $(".forCommentsSize").val();
	    console.log(tipcContent);
	    	
	    	 $.ajax({
	    		 url : "<c:url value='/tip/insertComment.cf'/>",
	    		 type : "POST",
	    		 data : "tipNo=${tipBoard.tipNo}&tipcWriter=aaa&tipcContent="+tipcContent
	    		 //난 분명이 아란누나로 aaa로 지정을했고 컨트롤러에서 아란누나로 지정을 했긴했는데 아란누나로 덮어 쓰여진건가 그런건가
	  
	    	 }).done(function(result){
	    		 console.log(result);
	    		 commentList();
	    	 });
	    	 
	     });
	         //댓글 수정...
	    /*   $(document).on("click", "#updateComment", function(e){
	    	  
	    		
		    	 $.ajax({
		    		 url : "<c:url value='/tip/updateComment.cf'/>",
		    		 type : "POST",
		    		 data : 
		  
		    	 }).done(function(result){
		    		 console.log(result);
		    		 commentList();
		    	 });
	      }) */
	         
	         
	         
	      
	    	 $(".updateForm").click(function(){
				 
				   location.href="updateBoard.cf?no=${tipBoard.tipNo}";
				 
			 });
			 $(".delete").click(function(){
				 
				   location.href="deleteBoard.cf?no=${tipBoard.tipNo}";
				 
			 });
	        
			
			 </script>
</body>
</html>
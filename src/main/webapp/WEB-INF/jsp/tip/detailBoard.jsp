<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
	src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js" >
</script>

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
	min-height: 300px;
	height: auto;
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
.forspan{
margin-left:80%;
}
.glyphicon-eye-open{
color : black;
}
</style>
<body>


	   <c:import url="../common/header.jsp" />
	<div class="top-section">
		<div class="main-image">
			<img src="<c:url value ="/publishing/bg/img/1.jpg"/>" width="1200" height="300" />
		</div>
		<div class="main-title">
			<!--여기 제목-->
			<h3>${tipBoard.tipTitle}<span class = "pull-right"><i class = "glyphicon glyphicon-eye-open"> ${tipBoard.tipViewCnt}</i></span></h3>
			<p><i src="glyphicon glyphicon-eye-open"></i></p>
		</div>
	</div>
	<div class="bottom-section">
		<div class="section-one">
			<div class="panel panel-default">
				<div class="panel-heading" id="forHeding">
					<i class="glyphicon glyphicon-user"></i>
				
					<span>&nbsp&nbsp${tipBoard.writer}</span><span id="reg_time" class = "forspan"><fmt:formatDate value="${tipBoard.tipRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>
				<div class="panel-body">${tipBoard.tipContent}</div>
			</div>

		</div>
		<div id="writebtn" class="pull-right">
		<button type="button" class="btn btn-default MainPage">목록</button>
			<button type="button" class="btn btn-default updateForm">수정</button>

			<button type="button" class="btn btn-default delete">삭제</button>
		</div>
	</div>

	<br>
	<div class="forall1">
		<span class="forComments">Comments</span><span>(${commentCount})</span> <br> <br> <br>
		<div class="diplay"></div>

		<br>

	</div>
	<!-- forCommentsContainer -->
	<br>
	<br>

	<!--  댓글 등록 !!  나중 writer 세션받아와서 바꿔주기 -->
	<div>
	<form id="insertForm" method="POST">
		<div class="forall2">
			<input type="hidden" name="tipNo" value="${tipboard.tipNo}" /> <input
				type="hidden" name="tipcWriter" value="${user.id}" />
			<textarea class="forCommentsSize" name="tipcContent"></textarea>
			<button type="button" class="btn btn-primary btn-lg forbutton2"
				id="insertComment">등록</button>
		</div>
	</form>
	
	</div>
	

	<script>
		//댓글 조회
		function commentList() {
         $
               .ajax({
                  url : "<c:url value='/tip/listComment.cf'/>",
                  type : "POST",
                  data : "no=${tipBoard.tipNo}"

               })
               .done(
                     function(result) {
                        console.log(result)
                        var text = "";
                        for (let i = 0; i < result.length; i++) {

                           text += "<div class = 'forCommentsContainer'>"
                                 + "<div class  = 'row'>"
                                 + "<div class='col-md-2'><i class='far fa-user'></i>&nbsp&nbsp"
                                 + result[i].tipcWriter
                                 + "</div>"
                                 + "<div class='col-md-8'>"
                                 + result[i].tipcContent
                                 + "</div>"
                                 + "<div class='col-md-2'>"
                                 + result[i].tipcRegDate
                                 + "<div class='dropdown pull-right'>"
                                 + "<i class='glyphicon glyphicon-option-horizontal dropbtn' aria-hidden='true'></i>"
                                 + "<div class='dropdown-content'>"
                                 + "<a href='#' id = 'deleteComment' class = "+result[i].tipcNo+" name = "+result[i].tipcWriter+">삭제</a>"
                                 + "</div></div></div></div></div>";
                        } //for

                        $(".diplay").html(text)

                     })
      };

		commentList();

		//댓글 삭제
	      $(document).on("click", "#deleteComment", function(e) {
	         e.preventDefault();
	         var writer = $(this).attr("name");
	         var cNo = $(this).attr("class");
	         if ('${user.id}' !== writer) {
	            alert("본인이 작성한 댓글만 삭제 가능합니다.")
	            return;
	         }
	         $.ajax({
	            url : "<c:url value='/tip/deleteComment.cf'/>",
	            type : "POST",
	            data : "cNo=" + cNo

	         }).done(function(result) {
	            console.log(result);
	            commentList();
	         });
	      });

		// 댓글 입력, tipcwriter에 로그인시 작성자 세션 추가하기
		$(document)
				.on(
						"click",
						"#insertComment",
						function(e) {
							//serialize()는 "a=1&b=2&c=3&d=4&e=5"형태로 직렬화()시켜서 데이터 형성 쓰다 실패..
							/* 	 var formData = $("#insertForm").serialize(); 
							 console.log(formData);*/
							var tipcContent = $(".forCommentsSize").val();
							console.log(tipcContent);

							$
									.ajax(
											{
												url : "<c:url value='/tip/insertComment.cf'/>",
												type : "POST",
												data : "tipNo=${tipBoard.tipNo}&tipcWriter=${user.id}&tipcContent="
														+ tipcContent
											//난 분명이 아란누나로 aaa로 지정을했고 컨트롤러에서 아란누나로 지정을 했긴했는데 아란누나로 덮어 쓰여진건가 그런건가

											}).done(function(result) {
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
		  $(".MainPage").click(function() {

				location.href = "MainPage.cf";

			});

		$(".updateForm").click(function() {
			 if('${tipBoard.writer}'!='${user.id}'){
					alert("글작성자만 수정 가능합니다.")
					return;	
				}

			location.href = "updateBoard.cf?no=${tipBoard.tipNo}";

		});
		
		  $(".delete").click(function() {
			  if('${tipBoard.writer}'!='${user.id}'){
					alert("글작성자만 삭제 가능합니다.")
					return;	
				}
			  location.href = "deleteBoard.cf?no=${tipBoard.tipNo}";
         });
		  

	</script>
	
</body>
</html>
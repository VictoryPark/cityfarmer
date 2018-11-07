<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

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
	color: yellow;
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
	border-bottom: 3px solid yellow;
	margin: 0 auto;
}

header span {
	color: rgb(247, 247, 170);
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
	border-bottom: 3px solid yellow;
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

.fortitle {
	width: 100%;
	height: 30px;
	border-radius: 20px;
}

::placeholder {
	font-size: 15px;
	text-align: center;
}

.btn-group {
	
}

#summernote {
	position: fixed;
}

#name {
	color: black;
}
</style>
<body>
	<header>
	<h1>
		<span>City</span>Farmmer
	</h1>
	<nav> <a href="">꿀팁게시판</a> <a href="">공구게시판</a> <a href="">물물교환
		게시판</a> <a href="">식물자랑 갤러리</a> <a href="">달력게시판</a> <a href="">로그인/마이페이지</a>
	</nav> </header>

	<form action="write.cf" method="post">
		<div class="top-section">
			<div class="main-image">
				<img src="<c:url value ="/publishing/bg/img/1.jpg"/>" width="1200"
					height="300" />
			</div>
			<div class="main-title">
				<h3>

					<input type="text" id="name" name="tipTitle" class="form-control"
						placeholder="제목을 입력하세요.">
				</h3>
							<input type="hidden" name="writer" value="${user.id}" />
				<p></p>
			</div>
		</div>
		<div class="bottom-section">
			<div class="section-one">


				<textarea id="summernote" name="tipContent">
					
				</textarea>
			</div>
		</div>

		<div class="btn-group" role="group" aria-label="...">
			<button class="btn btn-default">
				글쓰기</a>
			</button>

		</div>
		<input id="imageBoard" name="fileUrl" type="hidden" /> <input
			id="imageoriname" name="oriName" type="hidden" /> <input
			id="imagesysname" name="sysName" type="hidden" /> <input
			id="imagepath" name="path" type="hidden" /> <input id="imagesize"
			name="size" type="hidden" />

	</form>

	<script>
		/* $(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				minHeight : null,
				maxHeight : null,
				focus : true
			});
		});
		 */
		$(document).ready(function() {
			$('#summernote').summernote({
			   
				height : 300,
				minHeight : null,
				maxHeight : null,
				focus : true,
				placeholder : '내용을 입력하여 주세요',
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						console.log(files);
						console.log(this);
						for (let i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				}
			// callbacks
			});
		});
		function sendFile(file, ele) {
			var form_data = new FormData();
			console.log("form_data", form_data)
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : "<c:url value='/tip/insertFile.cf'/>",
				cache : false,
				contentType : false,
				enctype : "multipart/form_data",
				processData : false,
				success : function(tipFile) {
					console.log(tipFile.url);
					$("input#imageBoard").val(tipFile.url)
					$("input#imageoriname").val(tipFile.tipfOriName)
					$("input#imagesysname").val(tipFile.tipfSysName)
					$("input#imagepath").val(tipFile.tipfPath)
					$("input#imagesize").val(tipFile.tipfSize)
					/* append('<li><img src="'+url+'" width="480" height="auto"/></li>') */
					$(ele).summernote("editor.insertImage", tipFile.url);
				}
			})//ajax
		}

		/* $("button:eq(0)").click(function(){
		location.href="MainPage.html";
		 });
			$("button:eq(1)").click(function(){
		location.href="MainPage.html";
		 }); */
	</script>
</body>
</html>
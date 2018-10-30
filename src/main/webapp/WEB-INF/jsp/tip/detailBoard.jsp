<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script
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
</style>
<body>
	<header>
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
				<div class="panel-heading" id="forHeding">${tipBoard.writer}, 댓글 몇개인지, 좋아요
					갯수, ${tipBoard.tipRegDate}</div>
				<div class="panel-body">${tipBoard.tipContent}</div>
			</div>

		</div>
		<span class="forComments">Comments</span>
	</div><br>

	<textarea></textarea>
</body>
</html>
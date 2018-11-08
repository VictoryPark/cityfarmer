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
	color: gray;
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
	color: yellow;
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
	margin: 0 10px;
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

/*The widths are in a percentage!*/
footer {
	width: 100%;
	height: 50px;
	border-top: 3px solid #eee;
	margin: 0 auto;
	clear: both;
	text-align: center;
}

footer span {
	font-family: "Wisdom Script", script;
	text-transform: lowercase;
	color: #77a466;
	font-size: 14px;
}

.forbutton {
	margin-top: 10px;
	margin-left: 95%;
}

.forPage {
	margin-left: 35%;
}
/* .main-title > h3:after{
    display: block;
    clear: both;
    content:'';
} */
.pagination {
	margin-left: 35%
}



a:hover {
	text-decoration: none;
}
</style>
<body>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Brush Up Those Skills!</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/main.css">

</head>
<body>

	<c:import url="../common/header.jsp" />
<!-- 	<h1>
		<span>City</span>Farmmer
	</h1> -->
	<!-- <nav> <a href="">꿀팁게시판</a> <a href="">공구게시판</a> <a href="">물물교환
		게시판</a> <a href="">식물자랑 갤러리</a> <a href="">달력게시판</a> <a href="">로그인/마이페이지</a>
	</nav> </header> -->
	<div class="top-section">
		<div class="main-image">
			<img src="<c:url value ="/publishing/bg/img/1.jpg"/>" width="1200"
				height="300" />
		</div>
		<div class="main-title">
			<h3>
				꿀팁 게시판(${selectCount})
				<button type="button" class="btn btn-default pull-right">
					<a href="<c:url value="/tip/writeBoard.cf"/>">글쓰기</a>
				</button>
			</h3>

			<p></p>
		</div>
	</div>
	<div class="bottom-section">
		<div class="section-one">

			<table class="table  table-hover">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>날짜</th>
					<th>제목</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="b" items="${list}">
					<tr>
						<td>${b.tipNo}</td>
						<td>${b.writer}</td>
						<td><fmt:formatDate value="${b.tipRegDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><a href='detailBoard.cf?no=${b.tipNo}'>${b.tipTitle}</a></td>
						<td>${b.tipViewCnt}</td>
					</tr>
				</c:forEach>
				
				



			</table>
			
			

              	<c:if test="${pageResult.count != 0}">
					<nav>
					  <ul class="pagination">
					    <li <c:if test="${pageResult.prev eq false}">class="disabled"</c:if> >
					      <a href='MainPage.cf?pageNo=${pageResult.beginPage - 1}' aria-label="Previous" >
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
						<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
							<li <c:if test="${i eq pageResult.pageNo}">class="active"</c:if> >
								<a href='MainPage.cf?pageNo=${i}'>${i}</a>
							</li>
						</c:forEach>
					    <li <c:if test="${pageResult.next eq false}">class="disabled"</c:if> >
					      <a href='MainPage.cf?pageNo=${pageResult.endPage + 1}' aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</c:if>
             
			
		

		</div>
	</div>


	 <c:import url="../common/footer.jsp" />

</body>
</html>
<script>
	$("a").mouseenter(function() {
		$(this).addClass("forhover");

	});
	$("a").mouseleave(function() {
		$(this).removeClass("forhover");

	});
    $("nav > ul.pagination > li > a").click(function() {
		var pageNo = $(this).attr("href")
		/* if (pageNo == 0 || pageNo == '${pageResult.lastPage+1}') return false; */
		location.href = "MainPage.cf?pageNo=" + pageNo;
	});
    
</script>

</body>
</html>
	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous">
	    </script>
	<link rel='stylesheet' type='text/css'
		href="<c:url value="/resources/css/diary/main1.css"/>">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel='stylesheet' type='text/css'
		href="<c:url value="/resources/css/diary/calendar2.css"/>">
	<style>
body {
	margin: 0 auto;
}

table, th {
	text-align: center;
}

/************************************검색 창*************************************************/
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

#searchAll {
	background: #f2f2f2;
	font-family: "Open Sans", sans-serif;
	position: relative;
}

.search {
	width: 100%;
	position: relative;
}

.searchTerm {
	float: left;
	width: 100%;
	border: 3px solid #00b4cc;
	padding: 5px;
	/* height: 50px; */
	border-radius: 5px;
	outline: none;
	color: #9dbfaf;
}

.searchTerm:focus {
	color: #00b4cc;
}

.searchButton {
	position: absolute;
	right: 0px; 
	width: 40px;
	height: 36px;
	border: 1px solid #00b4cc;
	background: #00b4cc;
	text-align: center;
	color: #fff;
	border-radius: 5px;
	cursor: pointer;
	font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
#searchAll {
	width: 30%;
	position: relative;
	float: right; margin : 10px auto;
	align-items: right;
	margin: 10px auto;
}

.fa-search:before {
	content: "\f002";
}

#del {
	width: 20%;
	height: 10%;
}
/********************************위에 까지 검색창 스타일*********************************************************/
</style>
	</head>
	
	<body>
		<header>
			<h1>
				<span>City</span> Farmer
			</h1>
			<nav>
				<a href="">About</a> <a href="">물물교환</a> <a href="">공동구매</a> <a
					href="">꿀팁</a> <a href="">식물일기</a> <a href="">식물갤러리</a> <a href="">로그인</a>
				<a href="">회원가입</a>
			</nav>
		</header>
	
		<!-------------------------------------검색창 html---------------------------------------------------->
		<div class="wrap" id="searchAll">
			<div class="search">
				<input type="text" class="searchTerm" placeholder="내용을 입력하세요.">
				<button type="submit" class="searchButton">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	
		<!---------------------------------------------- board--------------------------------------------------------------->
		<div class="container">
			<table class="table table-hover">
				<caption>전체 ${pageResult.count}개</caption>
				<thead>
					<tr>
						<th>#</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="d" items="${list}">
						<tr>
							<td>${d.drNo}</td>
							<td>${d.writer}</td>
							<td><a href='diarydetail.cf?no=${d.drNo}'>${d.drTitle}</a></td>
							<td><fmt:formatDate value="${d.drRegDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<button type="button" onclick="button_click();" id="drwriter"
					class="btn pull-right">글쓰기</button>
			</div>
	
			<c:if test="${pageResult.count != 0}">
				<nav class="text-center">
					<ul class="pagination">
						<li
							<c:if test="${pageResult.prev eq false}">class="disabled"</c:if>>
							<a href="${pageResult.beginPage - 1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a>
						</li>
						<c:forEach var="i" begin="${pageResult.beginPage}"
							end="${pageResult.endPage}">
							<li <c:if test="${i eq pageResult.pageNo}">class="active"</c:if>>
								<a href="${i}">${i}</a>
							</li>
						</c:forEach>
						<li
							<c:if test="${pageResult.next eq false}">class="disabled"</c:if>>
							<a href="${pageResult.endPage + 1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
	
						</a>
						</li>
					</ul>
				</nav>
			</c:if>
			<!--------------------------------------------------------------------- 밑에부터 캘린더 html  -------------------------------------------->
			<div class="calendar pull-right" id="calendar-app">
				<div class="calendar--day-view" id="day-view">
					<span class="day-view-exit" id="day-view-exit">&times;</span> <span
						class="day-view-date" id="day-view-date">MAY 29 2016</span>
					<div class="day-view-content">
						<div class="day-highlight">
							You <span class="day-events" id="day-events">had no events
								for today</span>. &nbsp; <span tabindex="0"
								onkeyup="if(event.keyCode != 13) return; this.click();"
								class="day-events-link" id="add-event" data-date>클릭하세요!</span>
						</div>
						<div class="day-add-event" id="add-day-event-box"
							data-active="false">
							<div class="row">
								<div class="half">
									<label class="add-event-label"> Name of event <input
										type="text" class="add-event-edit add-event-edit--long"
										placeholder="New event" id="input-add-event-name">
	
									</label>
								</div>
								<div class="qtr">
									<label class="add-event-label"> Start Time <input
										type="text" class="add-event-edit" placeholder=""
										id="input-add-event-start-time"
										data-options="1,2,3,4,5,6,7,8,9,10,11,12"
										data-format="datetime"> <input type="text"
										class="add-event-edit" placeholder="am"
										id="input-add-event-start-ampm" data-options="a,p,am,pm">
									</label>
								</div>
								<div class="qtr">
									<label class="add-event-label"> End Time <input
										type="text" class="add-event-edit" placeholder=""
										id="input-add-event-end-time"
										data-options="1,2,3,4,5,6,7,8,9,10,11,12"
										data-format="datetime"> <input type="text"
										class="add-event-edit" placeholder="am"
										id="input-add-event-end-ampm" data-options="a,p,am,pm">
									</label>
								</div>
								<div class="half">
									<a onkeyup="if(event.keyCode != 13) return; this.click();"
										tabindex="0" id="add-event-save"
										class="event-btn--save event-btn">저장</a> <a tabindex="0"
										id="add-event-cancel" class="event-btn--cancel event-btn">취소</a>
								</div>
							</div>
	
						</div>
						<div id="day-events-list" class="day-events-list"></div>
						<div class="day-inspiration-quote" id="inspirational-quote">
							Every child is an artist. The problem is how to remain an artist
							once he grows up. –Pablo Picasso</div>
					</div>
				</div>
				<div class="calendar--view" id="calendar-view">
					<div class="cview__month">
						<span class="cview__month-last" id="calendar-month-last">Apr</span>
						<span class="cview__month-current" id="calendar-month">May</span> <span
							class="cview__month-next" id="calendar-month-next">Jun</span>
					</div>
					<div class="cview__header">일</div>
					<div class="cview__header">월</div>
					<div class="cview__header">화</div>
					<div class="cview__header">수</div>
					<div class="cview__header">목</div>
					<div class="cview__header">금</div>
					<div class="cview__header">토</div>
					<div class="calendar--view" id="dates"></div>
				</div>
				<div class="footer">
					<span><span id="footer-date" class="footer__link">Today
							is May 30</span></span>
				</div>
			</div>
			<!---------------------------------------------- script 캘린더 부분--------------------------------------------------------->
			<script type='text/javascript'
				src="<c:url value="/resources/js/diary/calendar.js"/>"></script>
			<!---------------------------------------------------- script----------------------------------- -->
			<script>
	    function button_click() {
	    	location.href = "diarywriterForm.cf";
	    } 
	    
	    $("nav > ul.pagination > li > a").click(function(e) {
			// 기본 이벤트 막기...
			e.preventDefault();
			
			var pageNo = $(this).attr("href");
	 
			if (pageNo == 0 || pageNo == '${pageResult.lastPage+1}') return false;
			
			location.href = "diarylist.cf?pageNo=" + pageNo;
		});
	    </script>
	</body>
	</html>
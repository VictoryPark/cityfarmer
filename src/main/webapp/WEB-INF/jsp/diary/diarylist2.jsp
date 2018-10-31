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
	<link rel="stylesheet" href="<c:url value="/resources/css/diary/calendar.css"/>">
	<link rel='stylesheet' href="<c:url value="/resources/css/diary/etc.css"/>">
	<link rel='stylesheet' href="<c:url value="/resources/css/diary/main.css"/>">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
        crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
        crossorigin="anonymous"></script>
	<script src="<c:url value="/resources/css/diary/notify.js"/>"></script>
	<style>
	body {
		margin: 0 auto;
	}
	
	#btb {
		margin-top: 5.6%;
		position: relative;
		bottom: 10%;
	}
	</style>
	
	</head>
	
	<body id="drbody">
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
		<!--------------------------------------------post html----------------------------------------------------->
		
		<div class="memo" style="display: none">
		<c:forEach var="b" items="${list}">
			<div class="memoHead">
				<ul class="btnBox">
					<li class="mini"><a href="#"><i class="fas fa-angle-down"></i></a></li>
					<li class="pick"><a href="#"><i class="fas fa-thumbtack"></i></a></li>
					<li class="delete"><a href="#"><i class="fas fa-trash-alt"></i></a></li>
	
				</ul>
			</div>
			<div class="memoContents">
				<textarea name="memoContents" id="memoContents"></textarea>
			</div>
			</c:forEach>
		</div>
		<a href="#" id="addMemo">추가</a>
	
		<!--------------------------------------------------------------------- 밑에부터 캘린더 html  -------------------------------------------->
		<div class="calendar" id="calendar-app">
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
									data-options="1,2,3,4,5,6,7,8,9,10,11,12" data-format="datetime">
									<input type="text" class="add-event-edit" placeholder="am"
									id="input-add-event-start-ampm" data-options="a,p,am,pm">
								</label>
							</div>
							<div class="qtr">
								<label class="add-event-label"> End Time <input
									type="text" class="add-event-edit" placeholder=""
									id="input-add-event-end-time"
									data-options="1,2,3,4,5,6,7,8,9,10,11,12" data-format="datetime">
									<input type="text" class="add-event-edit" placeholder="am"
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
		<!------------------------------------------버튼 html----------------------------------------------------->
		<button type="submit" id="btb"><a href="">글쓰기</a></button>
		<!------------------------------------------------------  캘린더 js------------------------------------------------------------->
		<script type='text/javascript' src="<c:url value="/resources/css/diary/calendar.js"/>"></script>
		<!-----------------------------버튼 스크립트----------------------------------------------->
		<script src="<c:url value="/resources/css/diary/addmemo.js"/>"></script>
	</body>
	
	</html>
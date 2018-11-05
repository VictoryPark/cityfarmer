<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <h1><span>City</span>Farms</h1>
    <nav>
        <a href="/main.cf">메인 메뉴</a>
        <a href="<c:url value="/groupbuy/gb_board.cf"/>">공동구매 하실 분?</a>
        <a href="<c:url value="/exchange/list.cf"/>">물물교환 합시다</a>
        <a href="<c:url value="/gallery/gallerylist1.cf"/>">갤러리</a>
        <a href="<c:url value="/diary/diarylist.cf"/>">나의 새싹 일기</a>
        <a href="<c:url value="/member/logout.cf"/>">로그아웃</a>
    </nav>
</header>

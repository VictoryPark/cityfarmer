<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/main.css"/>">
</head>
<body>
<section class="container">
   <div class="section first">
     <div class="cont_title">
       <!--<div class="letter-container">
         <p class="lettering">Alaska, USA</p>
       </div>-->
       <a href="<c:url value="/tip/MainPage.cf"/>"><h1>꿀팁</h1></a>
       <h3>Tip</h3>
     </div>
     <div class="cont_desc">
       <p>다양한 꿀팁들을 얻어가세요!</p>
     </div>
   </div>
   <div class="section">
     <div class="cont_title">
       <a href="<c:url value="/exchange/list.cf"/>"><h1>물물<br>교환</h1></a>
       <h3>Exchange</h3>
     </div>
     <div class="cont_desc">
       <p>육성한 농작물들을 교환해보세요!</p>
     </div>
   </div>
   <div class="section">
     <div class="cont_title">
       <a href="<c:url value="/groupbuy/gb_board.cf"/>"><h1>공동<br>구매</h1></a>
       <h3>Group Purchasing</h3>
     </div>
     <div class="cont_desc">
       <p>필요한 물품들을 공동 구매를 통해 저렴하게 구해보세요!</p>
     </div>
   </div>
   <div class="section">
     <div class="cont_title">
       <a href="<c:url value="/gallery/gallerylist1.cf"/>"><h1>갤러리</h1></a>
       <h3>Gallery</h3>
     </div>
     <div class="cont_desc">
       <p>내가 기른 예쁜 작물 사진을 갤러리에 올려보세요!</p>
     </div>
   </div>
   <div class="section">
     <div class="cont_title">
       <a href="<c:url value="/diary/diarylist.cf"/>"><h1>나만의<br>일기</h1></a>
       <h3>My diary</h3>
     </div>
     <div class="cont_desc">
       <p>나만의 육성일지를 작성해보세요!</p>
     </div>
   </div>
 </section>
</body>
</html>
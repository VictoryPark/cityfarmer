<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/listexchange.css">
</head>
<body>
    <header>
       <h1><span>City</span>Farms</h1>
       <nav>
           <a href="">About</a>
           <a href="">Menu</a>
           <a href="">Locations</a>
           <a href="">Gallery</a>
           <a href="">Reviews</a>
           <a href="">Contact</a>
       </nav>
   </header>
   <div class="top-section">
       <div class="main-image"><img id="title-img" src="img/exchange3_1.jpg" /></div>
       <div class="col-xs-3 form-inline" >
           <input type="text" name="search" class="form-control"/>
           <button type="button" class="btn btn-default">검색</button>
       </div>
   </div>
   <div class="bottom-section">
       <div class="container-fluid">
           <div class="col-md-4">
               <div id="row">
                   <div class="col-md-12">
                       <div id="image">
                           <a href="#1" ><img id="item" src="img/carrot.png"/></a>
                       </div>
                       <br>
                       <div id="title" >
                           <span id="title">
                               <a href="#1" >당근이 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                           </span>
                       </div>
                       <hr>
                       <div id="description">
                           조회수 : [${viewCount}] / 댓글 : [${reply}]
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div id="row">
                   <div class="col-md-12">
                       <div id="image">
                           <a href="#1" ><img id="item" src="img/brocoli.png" /></a>
                       </div>
                       <br>
                       <div id="title" >
                           <span id="title">
                               <a href="#1">브로콜리 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                           </span>
                       </div>
                       <hr>
                       <div id="description">
                           조회수 : [${viewCount}] / 댓글 : [${reply}]
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div id="row">
                   <div class="col-md-12">
                       <div id="image">
                           <a href="#1" ><img id="item" src="img/beans.png" /></a>
                       </div>
                       <br>
                       <div id="title" >
                           <span id="title">
                               <a href="#1" >완두콩 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                           </span>
                       </div>
                       <hr>
                       <div id="description">
                           조회수 : [${viewCount}] / 댓글 : [${reply}]
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div id="row">
                   <div class="col-md-12">
                       <div id="image">
                           <a href="#1" ><img id="item" src="img/potato.png"/></a>
                       </div>
                       <br>
                       <div id="title" >
                           <span id="title">
                               <a href="#1" >감자가 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                           </span>
                       </div>
                       <hr>
                       <div id="description">
                           조회수 : [${viewCount}] / 댓글 : [${reply}]
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div id="row">
                   <div class="col-md-12">
                       <div id="image">
                           <a href="#1" ><img id="item" src="img/tomato.png" /></a>
                       </div>
                       <br>
                       <div id="title" >
                           <span id="title">
                               <a href="#1">토마토 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                           </span>
                       </div>
                       <hr>
                       <div id="description">
                           조회수 : [${viewCount}] / 댓글 : [${reply}]
                       </div>
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div id="row">
                   <div class="col-md-12">
                       <div id="image">
                           <a href="#1" ><img id="item" src="img/cabbage.png" /></a>
                       </div>
                       <br>
                       <div id="title" >
                           <span id="title">
                               <a href="#1">양배추 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                           </span>
                       </div>
                       <hr>
                       <div id="description">
                           조회수 : [${viewCount}] / 댓글 : [${reply}]
                       </div>
                   </div>
               </div>
           </div>
           <div id="paging">
               <c:if test="${pageResult.count !=0}">
                   <nav>
                   <ul class="pagination">
                   
                       <li <c:if test="${pageResult.prev eq false}"> class="disabled"</c:if> > 
                       <a <c:choose>
                               <c:when test="${pageResult.prev eq true}">href="list3.do?pageNo=${pageResult.beginPage - 1}" </c:when>
                               <c:otherwise>href="#${pageResult.beginPage - 1}"</c:otherwise>
                           </c:choose>
                               aria-label="Previous">
                           <span aria-hidden="true">&laquo;</span>
                       </a>
                       </li>
                       <c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
                           <c:choose>
                               <c:when test="${i eq pageResult.pageNo}">
                                   <li class="active"><a href="#1">${i}</a></li>
                               </c:when>
                               <c:otherwise>
                                   <li><a href="list3.do?pageNo=${i}">${i}</a></li>
                               </c:otherwise>
                           </c:choose>			
                       </c:forEach>
                       <li <c:if test="${pageResult.next eq false}"> class="disabled"</c:if> >
                       <a 
                           <c:choose>
                               <c:when test="${pageResult.next eq true}">href="list3.do?pageNo=${pageResult.endPage+1}" </c:when>
                               <c:otherwise>href="#${pageResult.endPage+1}"</c:otherwise>
                           </c:choose>
                               aria-label="Next">
                           <span aria-hidden="true">&raquo;</span>
                       </a>
                       </li>
                   </ul>
                   </nav>
               </c:if>
           </div>
       </div>
   </div>

   <footer>
       <h4>Powered by lots of <span>fresh</span> ingredients.</h4>
   </footer>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/exchange/listexchange.css"/>">
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
       <div class="main-image"><img id="title-img" src="<c:url value="/resources/img/exchange/exchange3_1.jpg"/>" /></div>
       <form method="POST">
           <a class="btn btn-default" href="<c:url value="/exchange/writeform.cf"/>" role="button">글쓰기</a>
           <div class="col-xs-3 form-inline" id="search">
               <select id="searchsel" class="searchselect">
                   <option value="title">제목</option>
                   <option value="writer">작성자</option>
               </select>
               <input type="text" name="search" class="form-control"/>
               <button type="button" class="btn btn-default">검색</button>
           </div>
       </form>
   </div>
   <div class="bottom-section">
       <div class="container-fluid">
           <div class="col-md-4">    
               <div class="col-md-12">
                   <div id="blur" class="show"><img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/></div>
                   <div id="image">
                       <a href="#1" ><img id="item" src="<c:url value="/resources/img/exchange/carrot.png"/>"/></a>
                   </div>
                   <br>
                   <div id="title" >
                       <span id="title">
                           <a href="#1" >당근이 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                       </span><br>
                   </div>
                   <div id="writer">
                       <span id="writer">
                           작성자 :${writer}
                       </span>
                   </div>
                   <hr>
                   <div id="description">
                       조회수 : [${viewCount}] / 댓글 : [${reply}]
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="col-md-12">
                   <div id="blur" class="hide"><img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/></div>
                   <div id="image">
                       <a href="#1" ><img id="item" src="<c:url value="/resources/img/exchange/brocoli.png"/>" /></a>
                   </div>
                   <br>
                   <div id="title" >
                       <span id="title">
                           <a href="#1">브로콜리 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                       </span>
                   </div>
                   <div id="writer">
                       <span id="writer">
                           작성자 :${writer}
                       </span>
                   </div>
                   <hr>
                   <div id="description">
                       조회수 : [${viewCount}] / 댓글 : [${reply}]
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="col-md-12">
                   <div id="blur" class="show"><img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/></div>
                   <div id="image">
                       <a href="#1" ><img id="item" src="<c:url value="/resources/img/exchange/beans.png"/>" /></a>
                   </div>
                   <br>
                   <div id="title" >
                       <span id="title">
                           <a href="#3" >완두콩 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                       </span>
                   </div>
                   <div id="writer">
                       <span id="writer">
                           작성자 :${writer}
                       </span>
                   </div>
                   <hr>
                   <div id="description">
                       조회수 : [${viewCount}] / 댓글 : [${reply}]
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="col-md-12">
                   <div id="blur" class="show"><img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/></div>    
                   <div id="image">
                       <a href="#1" ><img id="item" src="<c:url value="/resources/img/exchange/potato.png"/>"/></a>
                   </div>
                   <br>
                   <div id="title" >
                       <span id="title">
                           <a href="#1" >감자가 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                       </span>
                   </div>
                   <div id="writer">
                       <span id="writer">
                           작성자 :${writer}
                       </span>
                   </div>
                   <hr>
                   <div id="description">
                       조회수 : [${viewCount}] / 댓글 : [${reply}]
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="col-md-12">
                   <div id="blur" class="hide"><img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/></div>    
                   <div id="image">
                       <a href="#1" ><img id="item" src="<c:url value="/resources/img/exchange/tomato.png"/>" /></a>
                   </div>
                   <br>
                   <div id="title" >
                       <span id="title">
                           <a href="#1">토마토 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                       </span>
                   </div>
                   <div id="writer">
                       <span id="writer">
                           작성자 :${writer}
                       </span>
                   </div>
                   <hr>
                   <div id="description">
                       조회수 : [${viewCount}] / 댓글 : [${reply}]
                   </div>
               </div>
           </div>
           <div class="col-md-4">
               <div class="col-md-12">
                   <div id="blur" class="hide"><img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/></div>    
                   <div id="image">
                       <a href="#1" ><img id="item" src="<c:url value="/resources/img/exchange/cabbage.png"/>" /></a>
                   </div>
                   <br>
                   <div id="title" >
                       <span id="title">
                           <a href="#1">양배추 올해 풍년이예요~ <br>20kg 물물교환 하실분? </a>
                       </span>
                   </div>
                   <div id="writer">
                       <span id="writer">
                           작성자 :${writer}
                       </span>
                   </div>
                   <hr>
                   <div id="description">
                       조회수 : [${viewCount}] / 댓글 : [${reply}]
                   </div>
               </div>
           </div>
       </div>
   </div>
   <div id="paging" class="text-center">
       <div class="pagination">
           <a href="#1" data-page="1" class>&laquo;</a>
           <a href="#1" data-page="1" class>&lt;</a>
           <a href="#1" data-page="1" class>1</a>
           <a href="#1" data-page="1" class>2</a>
           <a href="#1" data-page="1" class>3</a>
           <a href="#1" data-page="1" class>4</a>
           <a href="#1" data-page="1" class>5</a>
           <a href="#1" data-page="1" class>&gt;</a>
           <a href="#1" data-page="1" class>&raquo;</a>
       </div>
   </div>

   <footer>
       <h4>Powered by lots of <span>fresh</span> ingredients.</h4>
   </footer>

</body>
</html>
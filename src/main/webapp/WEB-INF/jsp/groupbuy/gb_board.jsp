<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
    </script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/groupbuy/gb_board.css" />">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
  <header>
            <h1><span>City</span>Farmer</h1>
            <nav>
                <a href="">About</a>
                <a href="">물물교환</a>
                <a href="">공동구매</a>
                <a href="">꿀팁</a>
                <a href="">갤러리</a>
                <a href="">나만의 일기</a>
            </nav>
        </header>
    
        <div class="top-section">
	  <div class="main-image"><img src="https://res.cloudinary.com/bigboydesign1/image/upload/v1476647899/download_schjib.jpg" /></span> 
	  <!-- <div class="main-image"><img src="happy-kids-set-of-four-illustrated-cartoon-kids-holding-blank-signs-image_csp54465470.jpg" style="width:500px; height:200px;"/></span>  -->
            </div>
            <div class="main-title">
                <h1>공동구매 게시판</h1>
            </div>
        </div>
        <div class="bottom-section">
            <div class="section-one">
               <table class="table table-striped">
                   <tr>
                        <td>글 번호</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>조회수</td>
                   </tr>
                   <c:forEach var="gb" items="${list}">
                   <tr>
                       <td>${gb.gbNo}</td>
                       <td>${gb.gbTitle}</td>
                       <td>${gb.writer}</td>
                       <td>${gb.gbViewCnt}</td>
                   </tr>
                   </c:forEach>
               </table>
              
               <div id="paging">
               <nav>
                    <ul class="pagination">
                      <li>
                        <a href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li>
                        <a href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
                <form class="navbar-form navbar" role="search">
                    <div id="search">
                            <div class="form-group">
                                <select class="form-control"> 
                                    <option>선택</option>
                                    <option>제목</option>
                                    <option>내용</option>
                                    <option>제목+내용</option>
                                    <option>작성자</option>
                                </select>                                   
                                <input type="text" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default">검색</button>
                        </div>
                    </form>    
                    <div id="writebtn">
                            <button type="button" id="writeButton" class="btn btn-default">글 쓰기</button>
                    </div>
                </div>
                
            </div>
           
         

        <footer>
            <h4>Copyright ⓒ<span>낭만코양이</span> All rights reserved.</h4>
            
            <h4>with AR, CW, HK, SY, BG</h4>
        </footer>
        <script>
            $("#writeButton").click(function(){
            	location.href = "gb_writeForm.cf"
            });            
        </script>
</body>
</html>
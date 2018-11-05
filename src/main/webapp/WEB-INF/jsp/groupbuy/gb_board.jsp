<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
 
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
            <h1><span>City</span> Farmer</h1>
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
            <div id="list-area">
               <table class="table table-hover">
               	<thead>	
                   <tr>
                        <td>글 번호</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>조회수</td>
                   </tr>
                </thead>
                <tbody>
                       <c:forEach var="gb" items="${list}" varStatus="status"> 
	                   <!-- 현재시간 날짜, 시간으로 나눔 -->
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
						<fmt:formatDate value="${now}" pattern="HH:mm" var="nowTime" />
						<!-- 종료시간 String 에서 Date로 --> 
	                   <fmt:parseDate var="endTime" value="${gb.gbEndTime}" pattern="HH:mm" />
	                   <fmt:formatDate value="${endTime}" var="endTime" pattern="HH:mm" />
	                   <fmt:parseDate var="endDay" value="${gb.gbEndDay}" pattern="yyyy-MM-dd" />
	                   <fmt:formatDate value="${endDay}" var="endDay" pattern="yyyy-MM-dd" />
	                   <tr>
	                   	   <td>${gb.gbNo}</td>
	                   	   <c:choose>
	                   		   <c:when test="${nowDate > endDay}">
	                   		   		 <td><img src='<c:url value='/resources/img/groupbuy/expired.png' />'><span style="color: gray;">만료된 공구입니다.${gb.gbTitle}</span><span class="cmtCount">[${comment[status.index]}]</span></td>
	                     	   </c:when>
	                     	   <c:when test="${nowDate == endDay}">
	                     	   		<c:choose>
	                     	   	 	<c:when test="${nowTime >= endTime}">
	                     	   	 	  <td><img src='<c:url value='/resources/img/groupbuy/expired.png' />'><span style="color: gray;">만료된 공구입니다.${gb.gbTitle}</span><span class="cmtCount">[${comment[status.index]}]</span></td>	
	                     	   	 	</c:when>
	                     	   	 	<c:otherwise>
	                     	   	 	   <td><span><a href="gb_detail.cf?no=${gb.gbNo}">${gb.gbTitle}</a></span><span class="cmtCount">[${comment[status.index]}]</span> </td>
	                     	   	 	</c:otherwise>
	                     	   	 	</c:choose>
	                     	   </c:when>
	                	       <c:otherwise>
	        		               <td><span><a href="gb_detail.cf?no=${gb.gbNo}">${gb.gbTitle}</a></span><span class="cmtCount">[${comment[status.index]}]</span></td>
	  		                   </c:otherwise>
	                       </c:choose>
	                       <td>${gb.writer}</td>
	                       <td>${gb.gbViewCnt}</td>
	                   </tr>
	                   </c:forEach>
	                   <c:if test="${empty list}">
						<tr>
							<td colspan='4'>입력된 게시물이 없습니다.</td>
						</tr>
						</c:if>
					
				 </tbody>
               </table>
              
               <div id="paging">
              	<c:if test="${pageResult.count != 0}">
					<nav>
					  <ul class="pagination">
					    <li <c:if test="${pageResult.prev eq false}">class="disabled"</c:if> >
					      <a href="${pageResult.beginPage - 1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
						<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
							<li <c:if test="${i eq pageResult.pageNo}">class="active"</c:if> >
								<a href="${i}">${i}</a>
							</li>
						</c:forEach>
					    <li <c:if test="${pageResult.next eq false}">class="disabled"</c:if> >
					      <a href="${pageResult.endPage + 1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</c:if>
                </div>
                </div>
                <form id="searchForm" class="navbar-form navbar" role="search">
                    <div id="search">
                            <div class="form-group">
                                <select name="searchType" class="form-control"> 
                                    <option value="0">선택</option>
                                    <option value="1">제목</option>
                                    <option value="2">내용</option>
                                    <option value="3">제목+내용</option>
                                    <option value="4">작성자</option>
                                </select>                                   
                                <input type="text" name="keyword" class="form-control" placeholder="Search">
                            </div>
                            <button type="button" id="searchBtn" class="btn btn-default">검색</button>
                        </div>
                        <input id="pageNo" type="hidden" name="pageNo" value="1">
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
        	$("#writeButton").click(function(e){
        		if('${user.id}' == '') {
       				e.preventDefault()
       				alert("먼저 로그인을 해주세요.")
       				return
       			}
       			
            	location.href = "gb_writeForm.cf"
            });      
            
            $("nav > ul.pagination > li > a").click(function(e) {
        		// 기본 이벤트 막기...
        		e.preventDefault();
        		
        		var pageNo = $(this).attr("href");
//         		alert(pageNo)
        		if (pageNo == 0 || pageNo == '${pageResult.lastPage+1}') return false;
        		
        		if('${list != null}') {
        			location.href = "gb_board.cf?pageNo=" + pageNo;
        			return false;
        		} 
        		
		   		searchAjax(pageNo)
        	});
            
            $("#searchBtn").click(function() {
	       		searchAjax(1)
            });
            
            var searchAjax = function(pageNo) {
            	
            	$("#pageNo").val(pageNo);
            	
		        	var formData = $("#searchForm").serialize();
		        	
		        	if(formData.split('&')[0].split('=')[1]=='0') {
		        		alert("카테고리를 선택해주세요") 
		        		return;
		        	}
		        	
				          $.ajax({
				          	url: "<c:url value='/groupbuy/gb_search.cf'/>",
				          	type: "POST",
				          	data: formData
				          }).done(function(result) {
				          		console.log(result)
				          		
				          		$("#list-area").html(
				          				 `<table class="table table-hover">
				                        	<thead>	
				                            <tr>
				                                 <td>글 번호</td>
				                                 <td>제목</td>
				                                 <td>작성자</td>
				                                 <td>조회수</td>
				                            </tr>
				                         </thead>
				                         <tbody>
				                         </tbody>
				                         </table>
				                         <div id="paging">
				                         </div>`
				          		)
				          		
				          		var html = "";
				          		
				          		for(let i=0; i<result.list.length; i++) {
				          			    html += "<" + "fmt:formatDate value='${now}' pattern='yyyy-MM-dd' var='nowDate' />"
				        					  + "<" + "fmt:formatDate value='${now}' pattern='HH:mm' var='nowTime' />"
				        					  + "<" + "fmt:parseDate var='endTime' value=" + result.list[i].gbEndTime + " pattern='HH:mm' />"
				        					  + "<" + "fmt:formatDate value='${endTime}' var='endTime' pattern='HH:mm' />"
				        					  + "<" + "fmt:parseDate var='endDay' value=" + result.list[i].gbEndDay + " pattern='yyyy-MM-dd' />"
				        					  + "<" + "fmt:formatDate value='${endDay}' var='endDay' pattern='yyyy-MM-dd' />"
				        					  + "<tr>"
				        					  + "<td>"+ result.list[i].gbNo +"</td>"
				        					    <c:choose>
				        					    <c:when test='${nowDate > endDay}'>
				        					  + "<td><img src='/cityFarmer/resources/img/groupbuy/expired.png'><span style='color: gray;'>만료된 공구입니다.</span><span class='cmtCount'>[" + result.comment[i] + "]</span></td>"
				        					    </c:when>
				        					    <c:when test='${nowDate == endDay}'>
				        					   	<c:choose>
				        					   		<c:when test='${nowTime >= endTime}'>
				        					  + 			"<td><img src='<c:url value='/resources/img/groupbuy/expired.png' />'><span style='color: gray;'>만료된 공구입니다.</span><span class='cmtCount'>[" + result.comment[i] + "]</span></td>"
				        					  			</c:when>
				        					  			<c:otherwise>
				        					  +				"<td><span><a href='gb_detail.cf?no="+ result.list[i].gbNo +"'>"+ result.list[i].gbTitle +"</a></span><span class='cmtCount'>[" + result.comment[i] + "]</span> </td>"
				        					  			</c:otherwise>
				        					  	 	</c:choose>
				        					    </c:when>
				        					    <c:otherwise>
				        					  + 	"<td><span><a href='gb_detail.cf?no="+ result.list[i].gbNo +"'>"+ result.list[i].gbTitle +"</a></span><span class='cmtCount'>[" + result.comment[i] + "]</span></td>"
				        					  +  </c:otherwise>
				        					    </c:choose>
				        					    "<td>" + result.list[i].writer + "</td>"
				   	                       	  + "<td>" + result.list[i].gbViewCnt + "</td>"
				   	                       	  + "</tr>"
				   	                       	 
				          		}
				          		$("tbody").html(html);
				          		
				          });
            	
            } // searchAjax
            
         
        </script>
</body>
</html>
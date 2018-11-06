<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/exchange/listexchange.css"/>">
</head>
<body>
   <c:import url="../common/header.jsp" />
   
   <div class="top-section">
       <div class="main-image"><img id="title-img" src="<c:url value="/resources/img/exchange/exchange3_1.jpg"/>" /></div>
       <form method="POST" action="<c:url value='/exchange/listsearch.cf'/>" name="searchForm"> 
       <input type="hidden" name="pageNo" value="1"/>
           <a class="btn btn-default" href="<c:url value="/exchange/writeform.cf"/>" role="button">글쓰기</a>
           <div class="col-xs-3 form-inline" id="search">
               <select id="searchsel" name="type" class="searchselect">
                   <option value="title">제목</option>
                   <option value="writer">작성자</option>
               </select>
               <input type="text" name="keyword" class="form-control"/>
               <button type="button" class="btn btn-default" id="search">검색</button>
           </div>
       </form>
   </div>
   <div class="bottom-section">
       <div class="container-fluid">
       		<c:forEach var="board" items="${map.list}">
       			<div class="col-md-4">    
                	<div class="col-md-12">
	                   <!-- 거래 완료 되었는지 아닌지 확인 -->
	                   <div id="blur" 
		                   <c:choose>
		                   	<c:when test="${board.exComplete =='y'}">
		                   		class="show"
		                   	</c:when>
		                   	<c:otherwise>class="hidden"</c:otherwise>
		                   </c:choose>
	                   >
	                   <c:choose>
	                   	<c:when test="${board.writer == user.id}">
	                   	 <a href="detail.cf?exno=${board.exNo}" ><img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/></a>
	                   	</c:when>
	                   	<c:otherwise> 
	                   		<img id="item" src="<c:url value="/resources/img/exchange/check-circle-solid.png"/>"/>
	                   	</c:otherwise>
	                   </c:choose>
	                   </div>
	                   <div id="image">
	                       <a href="detail.cf?exno=${board.exNo}" >
	                       <c:choose>
		                       <c:when test="${!empty board.url}">
		                       <img id="item" src="${board.url}"/>
		                       </c:when>
		                       <c:otherwise>
		                       <img id="none" src="<c:url value="/resources/img/exchange/cityfarmer.png"/>"/>
		                       </c:otherwise>
	                       </c:choose>
	                       </a>
	                   </div>
	                   <br>
	                   <div id="title" >
	                       <span id="title">
	                           <a href="detail.cf?exno=${board.exNo}" >${board.exTitle} </a>
	                       </span><br>
	                   </div>
	                   <div id="writer">
	                       <span id="writer">
	                           작성자 : ${board.writer}
	                       </span>
	                   </div>
	                   <hr>
	                   <div id="description">
	                       조회수 : [${board.exViewCnt}] / 댓글 : [${board.reply}]
	                   </div>
	               </div>
	           </div>
       		</c:forEach>
           
           
               
       </div>
   </div>
   <c:if test="${map.pageResult.count != 0}">
	   <div id="paging" class="text-center">
	       <div class="pagination">
	           <a <c:if test="${map.pageResult.prevAll eq false}"> class="disabled"</c:if>
	          		 <c:choose>
			      		<c:when test="${map.pageResult.prevAll eq true}">href="list.cf?pageNo=${map.pageResult.beginPage}" </c:when>
			      		<c:otherwise>href="#${map.pageResult.beginPage}"</c:otherwise>
			      	</c:choose>
			      		 aria-label="PreviousAll">
	           <span aria-hidden="true">&laquo;</span></a>
	           <a <c:choose>
			      		<c:when test="${map.pageResult.prev eq true}">href="list.cf?pageNo=${map.pageResult.pageNo - 1}" </c:when>
			      		<c:otherwise>href="#${map.pageResult.pageNo - 1}"</c:otherwise>
			      	</c:choose>
			      		 aria-label="Previous">
	           <span aria-hidden="true">&lt;</span></a>
	           
	           <c:forEach var="i" begin="${map.pageResult.beginPage}" end="${map.pageResult.endPage}">
	           	<c:choose>
				    <c:when test="${i eq map.pageResult.pageNo}">
	           			<a href="#1">${i}</a>
	           		</c:when>
	           		<c:otherwise>
	           			<a href="list.cf?pageNo=${i}">${i}</a>
	           		</c:otherwise>
	           	</c:choose>
	           </c:forEach>
	           
	           
	           <a <c:choose>
			      		<c:when test="${map.pageResult.next eq true}">href="list.cf?pageNo=${map.pageResult.pageNo+1}" </c:when>
			      		<c:otherwise>href="#${map.pageResult.pageNo + 1}"</c:otherwise>
			      	</c:choose>
			      	aria-label="Next">
			      	<span aria-hidden="true">&gt;</span></a>
	           <a <c:if test="${map.pageResult.nextAll eq false}"> class="disabled"</c:if>
	           		<c:choose>
			      		<c:when test="${map.pageResult.nextAll eq true}">href="list.cf?pageNo=${map.pageResult.endPage}" </c:when>
			      		<c:otherwise>href="#${map.pageResult.endPage}"</c:otherwise>
			      	</c:choose>
			      		aria-label="NextAll">
	           <span aria-hidden="true">&raquo;</span></a>
	       </div>
	    </div>
	</c:if>
   <c:import url="../common/footer.jsp" />
   <c:import url="./listJS.jsp" />
<script>
	/* $(document).ready(function(){
		alert("${map.pageResult.next}")
	}) */
</script>
</body>
</html>
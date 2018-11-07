<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ �Խ���</title>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/45226/material-photo-gallery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css"></script>
    	<link href="<c:url value="/resources/css/gallery/gallerylist.css" />" rel="stylesheet">
</head>
<body>
       <header id="header">
            <h1><span>City</span>Farmer</h1>
            <nav>
                <a href="">About</a>
                <a href="">������ȯ</a>
                <a href="">����</a>
                <a href="">��������</a>
                <a href="gallerylist1.cf">������</a>
                <a href="">������ ������</a>
            </nav>
        </header>
        <div class="top-section">
            <div class="main-image">
                <div class="main-title">
                    <h2>�Ĺ� �ڶ� ������</h2>
                </div>
            </div>
                                <div class="row">
            
           
                        
                <div class="board">
                    
                    <div class="content">
                        <!--  <ol class="breadcrumb" S>
                    	<li><a href="#1">Home</a></li>
                    	<li class="active">�����Խ���</li>
                		</ol> -->
                		<hr>		
                    <div class="col-md-2" style="text-align: left">
                        		��ü ${map.pageResult.count}��
                    </div>
                </div>
                <div class="table-responsive" style="width:100%;">
                        <div class="container" style="width:50%; float: right">
                                <div class="gallery">
	                       			<c:forEach var="b" items="${map.list}">
									<c:choose>
		                       		<c:when test="${!empty b.url}">
		                       				<img id="item" src="${b.url}" alt="" width="100%" height="auto" class="gallery-img" />
		                       		</c:when>
		                       		<c:otherwise>
		                      				 <img id="none" src="<c:url value="/resources/img/exchange/cityfarmer.png"/>" class="gallery-img"/>
		                       		</c:otherwise>
	                       </c:choose>
                        		</c:forEach>
                                </div> 
                            </div>
                            
                            
                            <div id="myModal" class="modal fade" role="dialog">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                  <div class="modal-body">
                                  </div>
                                </div>
                              </div>
                            </div><br>
                            
                <table class="table table-hover" style="width: 50%;" >
                            <thead>
                    <tr>
                        <th>��ȣ</th>
                        <th>����</th>
                        <th>�۾���</th>
                        <th>�����</th>
                        <th>��ȸ��</th>
                        <th>��õ��</th>
                    </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach var="b" items="${map.list}">
                        <tr class="clickde">
                            <td>${b.gaNo}</td>
                            <td><a href='gallerydetail.cf?no=${b.gaNo}'>${b.gaTitle}</td>
                            <td>${b.writer}</td>
                            <td><fmt:formatDate value="${b.gaRegDate}" pattern="yyyy-MM-dd" /></td>
                            <td>${b.gaViewCnt}</td>
                            <td>${b.gaRecCnt}</td>
                        </tr>
                    </c:forEach>
                    
                    </tbody>
                </table>
               
                </div>
                         <div>
        
                <!-- <form class="navbar-form" role="search" style="margin-right: 70px">
                    
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="�������� �˻��ϼ���" style="font-size: 15px ;">
                    </div>
                    <button type="submit" class="btn btn-default">�˻�</button>
                    </form>-->
                           <form method="POST"  role="search"action="<c:url value='/gallery/listsearch.cf'/>" class="navbar-form" name="searchForm" > 
           <div class="form-group" id="search">
              <select id="searchsel" name="type" class="searchselect">
	           <c:choose>
	           <c:when test="${map.search.type == 'title'}">
                   <option value="title" selected="selected">����</option>
                   <option value="writer">�ۼ���</option>
               </c:when>
               <c:otherwise>
               	   <option value="title" >����</option>
                   <option value="writer" selected="selected">�ۼ���</option>
               </c:otherwise>
               </c:choose>
               </select>
               <input type="text" name="keyword" class="form-control" value="${map.search.keyword }"/>
               <button type="button" class="btn btn-default" id="search">�˻�</button>
           </div>
          </form> 
                
		<c:if test="${map.pageResult.count != 0 }">
				<div id="paging" class="text-center">
  				<ul class="pagination">
			        <li<c:if test="${map.pageResult.prev eq false }"> class="disabled"</c:if>>
			          <a href="gallerylistsearch.cf?pageNo=${map.pageResult.beginPage - 1}&type=${map.search.type}" aria-label="Previous">
			            <span aria-hidden="true">&laquo;</span>
			          </a>
			        </li>
			    
			    <c:forEach var="i" begin="${map.pageResult.beginPage}" end="${map.pageResult.endPage}">
			        		<li<c:if test="${i eq map.pageResult.pageNo }"> class="active"</c:if>>
			        			<a href="${i}">${i}</a>
			        		</li>
			    </c:forEach>
			        <li <c:if test="${map.pageResult.next eq false}"> class="disabled"</c:if>>
			          <a href="gallerylistsearch.cf?pageNo=${map.pageResult.endPage+1 }" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			          </a>
			        </li>
  				</ul>
				</div>
		</c:if>               
  				<div id="wirte"> 
                    <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                    <button type="button" class="btn btn-primary" id="write">���ۼ�</button>
                  </div>
            </div>
          

        </div>
    
  

    <script>
    $(document).ready(function(){
    	console.log("${map}")
    })
	        var elem = document.querySelector('.m-p-g');

             document.addEventListener('DOMContentLoaded', function() {
                var gallery = new MaterialPhotoGallery(elem);
             });

             $(document).ready(function () {
                $(".gallery-img").click(function(){
                var t = $(this).attr("src");
                 $(".modal-body").html("<img src='"+t+"' class='modal-img'>");
                 $("#myModal").modal();
                 });
                });
             $("#write").click(function(){
            	 location.href="/cityFarmer/gallery/gallerywrite.cf";
             })
       
           // --------------------------------------------------------------------
         	$("div > ul.pagination > li > a").click(function(e){
				e.preventDefault();
		
				var pageNo = $(this).attr("href")
				if(pageNo == 0) return false;
				location.href = "gallerylist1.cf?pageNo="+pageNo; //�Ѿ�� �������� ��ũ������ ó��
				});
	
				function goPage(pageNo) {
					if(pageNo == 0) return false;
					location.href = "gallerylist1.cf?pageNo="+pageNo; //�Ѿ�� �������� ��ũ������ ó��
				}
				
		//---------------------------------------------------------------------------
		$(".pagination a").click(function(e){
		e.preventDefault();
		location.href= $(this).attr("href") + "&type=${map.search.type}&keyword=${map.search.keyword}"
	})
	
	$("button#search").click(function(){
		
		var f = document.searchForm;
		
		if(f.keyword.value == "") {
			alert("�˻��� Ű���带 �Է����ּ���.")
		} else {
			f.submit();
		}
	}) //buttonclick

           
    </script>
</body>
</html>
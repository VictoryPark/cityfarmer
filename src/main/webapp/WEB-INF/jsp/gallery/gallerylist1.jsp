<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <a href="">������</a>
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
                        		��ü ${count}��
                    </div>
                </div>
                <div class="table-responsive" style="width:100%;">
                        <div class="container" style="width:50%; float: right">
                                <div class="gallery">
                                    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr01/original-9161-1439317330-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />                           
                                    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr08/original-1654-1439317465-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />		
                                    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/15/enhanced/webdr08/original-13354-1439321173-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
                                    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/15/enhanced/webdr04/original-25740-1439321209-5.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
                                    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/15/enhanced/webdr08/original-9292-1439319916-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
                                    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr05/original-6710-1439319334-17.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
                                    <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/15/enhanced/webdr02/original-16901-1439320287-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
                                <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr02/original-6989-1439317507-15.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
                                <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr11/original-8867-1439317446-6.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
                                <img src="https://img.buzzfeed.com/buzzfeed-static/static/2015-08/11/14/enhanced/webdr03/original-22498-1439319085-3.jpg?downsize=715:*&output-format=auto&output-quality=auto" alt="" width="100%" height="auto" class="gallery-img" />
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
                    </tr>
                    </thead>
                    
                    <tbody>
                   	<c:forEach var="b" items="${list}">
                        <tr>
                            <td>${b.gaNo}</td>
                            <td>${b.gaTitle}</td>
                            <td>${b.writer}</td>
                            <td><fmt:formatDate value="${b.gaRegDate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                    
                    </tbody>
                </table>
                
                </div>
        
                <form class="navbar-form" role="search" style="margin-right: 70px">
                    
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="�������� �˻��ϼ���" style="font-size: 15px ;" >
                    </div>
                    <button type="submit" class="btn btn-default">�˻�</button>
                </form>          
                
                <nav>
                    <ul class="pagination">
                      <li class="disabled">
                        <a href="#0"aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                          <li class="active"><a href="list1.do?pageNo=1">1</a></li>
                          <li><a href="list2.do?pageNo=2">2</a></li>			        	
                          <li><a href="list2.do?pageNo=3">3</a></li>			        	
                          <li><a href="list2.do?pageNo=4">4</a></li>			        	
                          <li><a href="list2.do?pageNo=5">5</a></li>			        	
                          <li><a href="list2.do?pageNo=6">6</a></li>			        	
                          <li><a href="list2.do?pageNo=7">7</a></li>			        	
                          <li><a href="list2.do?pageNo=8">8</a></li>			        	
                          <li><a href="list2.do?pageNo=9">9</a></li>			        	
                          <li><a href="list2.do?pageNo=10">10</a></li>			        	
                      <li >
                        <a href="list2.do?pageNo=11"aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
                <div id="wirte"> 
                    <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                    <button type="button" class="btn btn-primary" id="write">���ۼ�</button>
                  </div>
                </nav>
            </div>
          

        </div>
    
  

    <script>
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
            
    </script>
</body>
</html>
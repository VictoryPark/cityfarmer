<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!--���ӳ�Ʈ-->
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
        
        <!-- ���� css -->
    	<link href="<c:url value="/resources/css/gallery/gallerywrite.css" />" rel="stylesheet">
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
                <!--
                    
                    <iframe width="100%" height="600px" src="https://www.youtube.com/embed/rRzxEiBLQCA?rel=0;amp;autoplay=1?rel=0;amp;autoplay=1"
                    frameborder="1" gesture="media" allow="encrypred-media" allowfullscreen></iframe>
                --> 
                    <img src="https://res.cloudinary.com/bigboydesign1/image/upload/v1476647899/download_schjib.jpg" />
               
            </div>
            <div class="main-title">
                <h2>�Խñ� �ۼ�</h2>
            </div>
            
			<form action="write.cf" method="post">
            <div>
                <input type="text" class="form-control" placeholder="������ �Է��Ͽ��ּ���" style="width:99%" name="gaTitle"><br>
                <input type="text" class="form-control" placeholder="${id}" style="width:99%" name="writer">
            </div><br>
            <div class="smt">
                    <textarea name="gaContent" id="summernote" value=""><h1>������ ������ּ���</h1></textarea>
            </div>
            <div id="wirte" > 
                
                    <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                    <button class="btn btn-primary">���ۼ�</button>
                    <button class="btn btn-primary">����</button>

            </div>
            </form>
            
        </div><br>
        <script>
        $(document).ready(function() {
             $('#summernote').summernote({
            width: 1200,
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
                });
            });

        
        </script>
</body>
</html>
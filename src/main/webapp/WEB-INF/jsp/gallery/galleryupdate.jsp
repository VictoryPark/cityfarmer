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

        <!--섬머노트-->
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
        
        <!-- 메인 css -->
    	<link href="<c:url value="/resources/css/gallery/gallerywrite.css" />" rel="stylesheet">
</head>
<body>
               <c:import url="../common/header.jsp" />

        <div class="top-section">
            <div class="main-image">   
                <!--
                    
                    <iframe width="100%" height="600px" src="https://www.youtube.com/embed/rRzxEiBLQCA?rel=0;amp;autoplay=1?rel=0;amp;autoplay=1"
                    frameborder="1" gesture="media" allow="encrypred-media" allowfullscreen></iframe>
                --> 
                    <img src="https://res.cloudinary.com/bigboydesign1/image/upload/v1476647899/download_schjib.jpg" />
               
            </div>
            <div class="main-title">
                <h2>게시글 수정</h2>
            </div>
            
			<form action="update.cf" method="post">
			    <input type="hidden" name="gaNo" value="${b.gaNo}" />
			
            	<div>
                	<input type="text" class="form-control" placeholder="제목을 입력하여주세용" style="width:99%" name="gaTitle" value="${b.gaTitle}"><br>
                	<input type="text" class="form-control" placeholder="${user.id}" style="width:99%" name="writer">
            	</div><br>
            <div class="smt">
                    <textarea name="gaContent" id="summernote">${b.gaContent}</textarea>
            </div>
            <div id="update" >
           				 <button type="submit" class="btn btn-primary">수정</button>
            </div>
            </form>
                    <button class="btn btn-primary1" id="">이전으로</button>
            
        </div><br>
           <c:import url="../common/footer.jsp" />
        
        <script>
        $(document).ready(function() {
            $('#summernote').summernote({
           width: 1250,
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,
            placeholder : '내용을 입력하여 주세요',
            callbacks: {
          		onImageUpload : function(files, editor, welEditable) {
          			console.log(files);
          			console.log(this);
          			for(let i=files.length -1; i>=0; i--){
          				sendFile(files[i], this);
          			}
          		}
          	} // callbacks
               });
           });
        function sendFile(file, ele) {
        	var form_data = new FormData();
        	console.log("form_data", form_data)
        	form_data.append('file', file);
        	$.ajax({
        		data : form_data,
        		type : "POST",
        		url : "<c:url value='/gallery/uploadfile.cf'/>",
        		cache : false,
        		contentType : false,
        		enctype : "multipart/form_data",
        		processData : false,
        		success : function(gaFile) {
        			console.log(gaFile.url);
        			$("input#imageBoard").val(gaFile.url)
        			$("input#imageoriname").val(gaFile.gafOriName)
        			$("input#imagesysname").val(gaFile.gafSysName)
        			$("input#imagepath").val(gaFile.gafPath)
        			$("input#imagesize").val(gaFile.gafSize)
        			/* append('<li><img src="'+url+'" width="480" height="auto"/></li>') */
        			$(ele).summernote("editor.insertImage", gaFile.url);
        		}
        	})//ajax
        }
       	
       	
     /*    $("#cblist").click(function () {
			location.href="/cityFarmer/gallery/gallerylist.cf"	
		})
 */
        
        </script>
</body>
</html>
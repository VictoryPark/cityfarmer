<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/exchange/writeexchange.css"/>">
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
    </div>
    <br>
    <div class="bottom-section">
        <form id="write" method="post" action="<c:url value="/exchange/write.cf"/>">
       <input type="hidden" name="writer" value="${user.id}"/>
        <table id="content" > 
            <tr>
                <td><label for="exampleInputEmail1">제목</label></td>
                <td><input type="text" class="form-control input-lg" 
                	name="exTitle" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
                <td><label for="exampleInputEmail1">내용</label></td>
                <td><textarea id="summernote" name="exContent"></textarea></td>
            </tr>
        </table>

        <div id="buttonbox">
            <button class="btn btn-success btn-lg" id="submit">등록하기</button>
        </div>
    	<input id="imageBoard" name="fileUrl" type="hidden"/>
    	
    		<%-- <c:forEach items="${files}" var="file">
    			<li><img src="<c:url value='/resources/file/${file}'/>" width="480" height="auto"/>"></li>
    		</c:forEach> --%>
        </form>
                  
    </div>
    <footer>
        <h4>Powered by lots of <span>fresh</span> ingredients.</h4>
    </footer>
  <script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height : 350,
            focus: true,
            tabsize : 2,
			focus : true,
            placeholder : '내용을 입력하여 주세요',
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
           /*  paragraph : 'justifyLeft' */
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
    		url : "<c:url value='/exchange/uploadfile.cf'/>",
    		cache : false,
    		contentType : false,
    		enctype : "multipart/form_data",
    		processData : false,
    		success : function(url) {
    			console.log(url);
    			$("input#imageBoard").val(url)
    			/* append('<li><img src="'+url+'" width="480" height="auto"/></li>') */
    			$(ele).summernote("editor.insertImage", url);
    		}
    	})//ajax
    }
 
    /* $("button#submit").click(function(){
    	var result = $("form#write").serializeArray();
    	console.log("result", result)
    }) */
  </script>
</body>
</html>
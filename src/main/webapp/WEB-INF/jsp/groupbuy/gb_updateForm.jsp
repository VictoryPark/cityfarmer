<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

    <script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.3.0/tui-code-snippet.min.js"></script>
   <!-- timepicker-->
    <link href="<c:url value="/resources/css/groupbuy/tui-time-picker.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/groupbuy/tui-time-picker.js" />"></script>
    
    <!-- datepicker-->
     <link href="<c:url value="/resources/css/groupbuy/tui-date-picker.css" />" rel="stylesheet">
     <script src="<c:url value="/resources/js/groupbuy/tui-code-snippet.js" />"></script>
     <script src="<c:url value="/resources/js/groupbuy/tui-date-picker.js" />"></script>
    
    <!-- 페이지css-->
     <link href="<c:url value="/resources/css/groupbuy/gb_write.css" />" rel="stylesheet">
    
</head>
<body>
	  <c:import url="../common/header.jsp" />
  
    <div class="top-section">
        <div class="main-image"><img src="https://res.cloudinary.com/bigboydesign1/image/upload/v1476647899/download_schjib.jpg" /></span>
    </div>
    <div class="main-title">
        <h1>공동구매 게시판</h1>
    </div>
   
    </div>
    <form action="gb_update.cf" method="POST">
    <input type="hidden" name="gbNo" value="${gbb.gbNo}" />
    <div class="bottom-section">
        <div class="section-one">
        <h3>공동구매 마감일 선택</h3>
        <div id="datepicker">
            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                    <input type="text" name="gbEndDay"  id="datepicker-input-2" aria-label="Date-Time">
                    <span class="tui-ico-date"></span>
            </div>
            <div id="wrapper-2" style="margin-top: -1px;"></div>
        </div>
    </div>
    
        <div class="section-two">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <div id="title"><input type="text" class="form-control" name="gbTitle" value="${gbb.gbTitle}" style="margin-bottom: 10px;"> </div>
                                <div id="writer">${gbb.writer}</div>
                        </div>
                        <div class="panel-body">
                                <div id="smnt-area"><textarea name="gbContent" id="summernote" value="">${gbb.gbContent}</textarea> </div>
                                 <input id="imageBoard" name="url" type="hidden"/>
                        </div>
                      </div>
            
             <div id="writebtn">
                    <button type="submit" class="btn btn-default">수정</button>
                    &nbsp;&nbsp;
                    <button type="button" id="cancelBtn" class="btn btn-default">취소</button>
            </div>
            <br>
            <br>
        </div> 
    </div>
    	<input id="imageno" name="gbNo" type="hidden" />
    	<input id="imagefileno" name="gbfNo" type="hidden" />
    	
    </form>
    
        <c:import url="../common/footer.jsp" />
        <script>
        $(document).ready(function () {
            $('#summernote').summernote({
                height: 330,                 // set editor height
                placeholder: "내용을 입력해주세요",
                focus: true,                  // set focus to editable area after initializing summernote
                callbacks: {
                    onImageUpload: function(files, editor, welEditable) {
                      for (var i = files.length - 1; i >= 0; i--) {
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
        		url : "<c:url value='/groupbuy/uploadfile.cf'/>",
        		cache : false,
        		contentType : false,
        		enctype : "multipart/form_data",
        		processData : false,
        		success : function(gbFile) {
        			console.log(gbFile.url);
        			$(ele).summernote("editor.insertImage", gbFile.url);
        		}
        	})//ajax
        }
        </script>

        <script>
       		var endDay = "${gbb.gbEndDay}"
            var dateArr = endDay.split('-');
            
//             console.log(dateArr[0])
//             console.log(dateArr[1])
//             console.log(dateArr[2])
            
            var endTime = "${gbb.gbEndTime}"
            var timeArr = endTime.split(':');
            
//             console.log(timeArr[0])
//             console.log(timeArr[1])
            
            var year = dateArr[0];
            var month = dateArr[1]-1;
            var day = dateArr[2];
            var hours = timeArr[0];
            var minutes = timeArr[1];
            
//             console.log(month)
            
            var datepicker2 = new tui.DatePicker('#wrapper-2', {
                date: new Date(year, month, day, hours, minutes),
                input: {
                    element: '#datepicker-input-2',
                    format: 'yyyy-MM-dd HH:mm A'
                },
                timepicker: {
                    layoutType: 'tab',
                    inputType: 'spinbox'
                },
                showAlways: true
            });
            
            $("#cancelBtn").click(function() {
            	location.href="gb_board.cf"
            })
        </script>
</body>
</html>